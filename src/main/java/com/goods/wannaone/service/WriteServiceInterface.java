package com.goods.wannaone.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface WriteServiceInterface {
	
    public HashMap<String,Object> inwriting(HashMap<String,Object> param);
	public HashMap<String, Object> fileOutput(HttpServletRequest req, MultipartFile[] img);
    public HashMap<String, Integer> fileAdd(HashMap<String, Object> param);
    public HashMap<String, Integer> fileUpdate(HashMap<String, Object> param);
    
    public HashMap<String,Object> setGoods(HashMap<String,Object> param, HashMap<String, Object> subImagesMap);

}
