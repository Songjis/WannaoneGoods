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
	
	
	
	@RequestMapping(value = "/categorylist", method = RequestMethod.POST)
	public ModelAndView categorylist(HttpServletRequest req){
		System.out.println("ddddd");
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		if(req.getParameter("start") != null){
			param.put("start", Integer.parseInt(req.getParameter("start")));
		}else{
			param.put("start", 0);
		}
		if(req.getParameter("viewRow") != null){
			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		}else {
			param.put("viewRow", 9);
		}
		System.out.println(param);
		
		return HttpUtil.returnJson(csi.categorylist(param));
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
