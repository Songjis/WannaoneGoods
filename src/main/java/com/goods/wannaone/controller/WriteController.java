package com.goods.wannaone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goods.wannaone.service.WriteServiceInterface;
import com.goods.wannaone.util.HttpUtil;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class WriteController {
	
	private static final Logger logger = LoggerFactory.getLogger(WriteController.class);

    @Autowired
    WriteServiceInterface wsi;
    
    @RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		logger.info("write");
		return "write";
	}
	

    @RequestMapping(value = "/inwriting", method = RequestMethod.POST)
      public ModelAndView inwriting (HttpServletRequest req, ModelAndView mav, 
    		 @RequestParam("mimg") MultipartFile[] mimg, @RequestParam("simg") MultipartFile[] simg){
    	
    	HashMap<String, Object> param = HttpUtil.paramMap(req);
    	System.out.println("comment : " +req.getParameter("content"));
    	HashMap<String, Object> mainImagesMap = wsi.fileOutput(req, mimg);
    	HashMap<String, Object> subImagesMap = wsi.fileOutput(req, simg);
    	
    	// 디비 넣기
    	List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) mainImagesMap.get("images");
    	param.put("gimg", list.get(0).get("picName"));
    	
    	return HttpUtil.returnJson(wsi.setGoods(param, subImagesMap));
    }

	
}
