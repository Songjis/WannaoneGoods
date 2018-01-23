package com.goods.wannaone.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;
@Service
public class LoginService implements LoginServiceInterface {
	
	@Autowired
	DaoInterface di;
	
	private final String namespace = "sql";
	private HashMap<String,Object> result;
	private DaoBean bean;
	private String sqlID;
	    

	@Override
	public HashMap<String, Object> selectLogin(HashMap<String, Object> param) {
		result = new HashMap<String,Object>();
		sqlID = namespace + ".selectLogin";
		bean = new DaoBean("SelectOne", sqlID, param);
		result.put("selectLogin", di.dao(bean));
		System.out.println("SERVICE : " + result);
		
		if(result.get("selectLogin") == null){
			result.put("stat", 0);//0일때 null
	      }else {
	    	  result.put("stat", 1);//1일때 데이터가 보여지게 된다.
	      }
		return result;
	}

}
