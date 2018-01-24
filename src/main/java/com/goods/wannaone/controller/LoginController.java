package com.goods.wannaone.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goods.wannaone.service.LoginServiceInterface;
import com.goods.wannaone.util.HttpUtil;


@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(WriteController.class);
	
	@Autowired
	LoginServiceInterface lsi;
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("login");
		return "login";
	}
	
	 @RequestMapping(value = "loginData", method = RequestMethod.POST)
	   public ModelAndView loginData(HttpServletRequest req, HttpServletResponse response, HttpSession session){
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("email", req.getParameter("email"));
		  map.put("pw", req.getParameter("pw"));
	      map = lsi.selectLogin(map);
	      System.out.println("controller : "+map);
	      if(Integer.parseInt(map.get("stat").toString())==1){
	    	  session.setAttribute("user", map);
	    	  
	        }
	      
	      return HttpUtil.returnJson(map);
	   }
	 
	 
	 @RequestMapping("/checkLogin")
		public ModelAndView checkLogin(HttpSession session, HttpServletResponse resp){
			HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
			HashMap<String, Object> data = new HashMap<String, Object> ();
			HashMap<String, Object> data2 = new HashMap<String, Object> ();
			if(user == null){
				data.put("state", 0);
				System.out.println("실패 : "+data);
			}else{
				data = (user.get("selectLogin"));
				data2.put("name", data.get("name"));
				data2.put("email", data.get("email"));
				
				data2.put("state", 1);
				
				System.out.println("성공 : "+ data2);
			}
			return HttpUtil.returnJson(data);
		}
	 
	 
	 
	 @RequestMapping("/logout")
	 public void logout(HttpSession session, HttpServletResponse resp){
		System.out.println("로그아웃!");
		session.invalidate();
		HttpUtil.sendResponceToJson(resp, new HashMap<String,Object>());
	}
	
		
	 
	 
	
		/*@RequestMapping(value = "/loginData", method = RequestMethod.POST)
		public ModelAndView login(HttpServletRequest req){
			HashMap<String, Object> param = HttpUtil.paramMap(req);
			System.out.println(param);
			return HttpUtil.returnJson(lsi.selectLogin(param));
		}
		*/
}
