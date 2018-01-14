package com.goods.wannaone.controller;

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
	
	@RequestMapping(value = "/poplist", method = RequestMethod.GET)
	public ModelAndView poplist() {
		logger.info("poplist");
		return HttpUtil.returnJson(hsi.poplist(null));
	}
	
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail() {
		logger.info("detail");
		return "detail";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("login");
		return "login";
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		logger.info("join");
		return "join";
	}
	
	
	
}
