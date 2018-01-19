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

import com.goods.wannaone.service.CategoryServiceInterface;
import com.goods.wannaone.util.HttpUtil;

@Controller
public class CategoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	CategoryServiceInterface csi;

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category() {
		logger.info("category");
		return "category";
	}
	
	@RequestMapping(value = "/living", method = RequestMethod.GET)
	public String living() {
		logger.info("living");
		return "category";
	}
	
	@RequestMapping(value = "/figure", method = RequestMethod.GET)
	public String figure() {
		logger.info("figure");
		return "category";
	}
	
	@RequestMapping(value = "/accesory", method = RequestMethod.GET)
	public String accesory() {
		logger.info("accesory");
		return "category";
	}

	@RequestMapping(value = "/clothes", method = RequestMethod.GET)
	public String clothes() {
		logger.info("clothes");
		return "category";
	}

	@RequestMapping(value = "/etc", method = RequestMethod.GET)
	public String etc() {
		logger.info("etc");
		return "category";
	}
	
	@RequestMapping(value = "/categorylist", method = RequestMethod.POST)
	public ModelAndView categorylist(HttpServletRequest req){
		logger.info("categorylist");
		return HttpUtil.returnJson(csi.categorylist(HttpUtil.paramMap(req)));
	}
	
	
	
}
