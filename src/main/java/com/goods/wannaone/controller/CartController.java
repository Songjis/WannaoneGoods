package com.goods.wannaone.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goods.wannaone.service.CartServiceInterface;
import com.goods.wannaone.util.HttpUtil;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Autowired
	CartServiceInterface csi;
	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String join() {
		logger.info("cart");
		return "cart";
	}
	
	
	@RequestMapping(value="insertCart", method = RequestMethod.POST)
	public ModelAndView insertCart(HttpServletResponse resp, HttpServletRequest req){
		   HashMap<String, Object> param = HttpUtil.paramMap(req); 
		   System.out.println(param);		   
		   
		   HashMap<String, Object> cart = new HashMap<String, Object>();
		   cart = csi.insertCart(param);
	       return HttpUtil.returnJson(cart);
	      }
	
	
	@RequestMapping(value = "/selectCart", method = RequestMethod.POST)
	public ModelAndView selectCart(HttpServletRequest req, HttpServletResponse response){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", req.getParameter("email"));
		logger.info("selectCart");
		return HttpUtil.returnJson(csi.selectCart(map));
	}
	

}
