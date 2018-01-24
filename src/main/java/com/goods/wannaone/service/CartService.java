package com.goods.wannaone.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;

@Service
public class CartService implements CartServiceInterface {

	@Autowired
	DaoInterface di;
	
	private final String namespace = "sql";
	private HashMap<String,Object> result;
	private DaoBean bean;
	private String sqlID;
	
	@Override
	public HashMap<String, Object> insertCart(HashMap<String, Object> param) {
		result = new HashMap<String,Object>();
		sqlID = namespace + ".insertCart";
		bean = new DaoBean("Insert", sqlID, param);
		result.put("insertCart", di.dao(bean));
		return result;

	}
	
	
	
	    
	
	
	
	


}
