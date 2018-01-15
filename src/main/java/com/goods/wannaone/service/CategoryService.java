package com.goods.wannaone.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
@Service
public class CategoryService implements CategoryServiceInterface {
	
	@Autowired
	DaoInterface di;
	
	private final String namespace = "sql";
	private HashMap<String,Object> result;
	private DaoBean bean;
	private String sqlID;
	
	
	@Override
	public HashMap<String, Object> categorylist(HashMap<String, Object> param){
		result = new HashMap<String,Object>();
	
		// poplist 가져오기
		sqlID = namespace + ".categorylist";
		bean = new DaoBean("SelectList", sqlID, param);
		result.put("categorylist", di.dao(bean));
		
		
		
		sqlID = namespace + ".totCnt";
		bean = new DaoBean("SelectOne", sqlID, null);
		result.put("tot", di.dao(bean));
//		HashMap<String, Object> totCnt = di.totCnt();
//		map.put("totCnt", totCnt);
		 
		
		
		return result;
	}
	
	
	
	
	
	
	

}
