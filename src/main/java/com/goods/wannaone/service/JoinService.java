package com.goods.wannaone.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;

@Service
public class JoinService implements JoinServiceInterface {
	@Autowired
	DaoInterface di;
	
	
	private final String namespace = "sql";
	private HashMap<String,Object> result;
	private DaoBean bean;
	private String sqlID;
	    

	@Override
	public HashMap<String, Object> data(HashMap<String, Object> param) {
		result = new HashMap<String,Object>();
		sqlID = namespace + ".insertJoin";
		bean = new DaoBean("Insert", sqlID, param);
		result.put("join", di.dao(bean));
		return result;
	}

	@Override
	public HashMap<String, Object> checkid(HashMap<String, Object> param) {
		result = new HashMap<String,Object>();
		sqlID = namespace + ".overlapId";
		bean = new DaoBean("SelectOne", sqlID, param);
		result.put("checkid", di.dao(bean));
		return result;
	}

}
