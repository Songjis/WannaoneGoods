package com.goods.wannaone.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goods.wannaone.service.JoinServiceInterface;
import com.goods.wannaone.util.HttpUtil;



@Controller
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	JoinServiceInterface jsi;
	

	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		logger.info("join");
		return "join";
	}
	
	
	@RequestMapping(value="UserJoin", method = RequestMethod.POST)
	public ModelAndView Userjoin(HttpServletResponse resp, HttpServletRequest req){
		   HashMap<String, Object> param = HttpUtil.paramMap(req);
		   HashMap<String, Object> createUser = new HashMap<String, Object>();
	       createUser = jsi.data(param);
	       return HttpUtil.returnJson(createUser);
	      }
	
	
	
	@RequestMapping(value="CheckId", method = RequestMethod.POST)
	 public void checkid(HttpServletResponse resp, HttpServletRequest req){
		String email = req.getParameter("email");
		HashMap<String, Object> checkid = new HashMap<String, Object>();
		checkid.put("email", email);
		checkid = jsi.checkid(checkid);
        HttpUtil.returnJson(checkid);
	}
	

}
