package com.goods.wannaone.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@RequestMapping(value = "/accesory", method = RequestMethod.GET)
	public String accesory() {
		logger.info("accesory");
		return "category/accesory";
	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category() {
		logger.info("category");
		return "category/category";
	}

	@RequestMapping(value = "/clothes", method = RequestMethod.GET)
	public String clothes() {
		logger.info("clothes");
		return "category/clothes";
	}

	@RequestMapping(value = "/etc", method = RequestMethod.GET)
	public String etc() {
		logger.info("etc");
		return "category/etc";
	}

	@RequestMapping(value = "/figure", method = RequestMethod.GET)
	public String figure() {
		logger.info("figure");
		return "category/figure";
	}

	@RequestMapping(value = "/living", method = RequestMethod.GET)
	public String living() {
		logger.info("living");
		return "category/living";
	}
	
	
	
}
