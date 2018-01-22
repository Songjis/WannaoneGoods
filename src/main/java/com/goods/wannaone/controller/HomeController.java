package com.goods.wannaone.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goods.wannaone.service.HomeServiceInterface;
import com.goods.wannaone.util.HttpUtil;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HomeServiceInterface hsi;
	
	@RequestMapping(value = "/DBTest", method = RequestMethod.GET)
	public ModelAndView dbTest() {
		logger.info("dbTest");
		return HttpUtil.returnJson(hsi.DBTest(null));
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		logger.info("main");
		return "main";
	}
	
	
	//메인에 인기상품이랑 신상품 불러오기
	@RequestMapping(value = "/mainlist", method = RequestMethod.GET)
	public ModelAndView mainlist() {
		logger.info("mainlist");
		return HttpUtil.returnJson(hsi.mainlist(null));
	}
	
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(HttpServletRequest req, ModelAndView mav) {
		HashMap<String, Object> param = HttpUtil.paramMap(req);
		logger.info("detail" + param);
		mav.addObject("detail", hsi.detail(param));
		mav.setViewName("detail");
		return mav;
	}
	
	
	
	
}
