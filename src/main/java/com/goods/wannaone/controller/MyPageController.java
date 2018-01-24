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

import com.goods.wannaone.service.MypageServiceInterface;
import com.goods.wannaone.util.HttpUtil;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class MyPageController {

	@Autowired
	MypageServiceInterface msi;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		logger.info("mypage");
		return "mypage/mypage";
	}
	
	/*유저정보불러오기*/
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public ModelAndView userSelect(HttpServletRequest req, HttpServletResponse response){
		HashMap<String, Object> param = HttpUtil.paramMap(req);
		return HttpUtil.returnJson(msi.userUpdate(param));
	}
}
