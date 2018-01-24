package com.goods.wannaone.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;

@Service
public class MypageService implements MypageServiceInterface {

	@Autowired
	DaoInterface di;
	
	private final String namespace = "sql";
	private HashMap<String,Object> result;
	private DaoBean bean;
	private String sqlID;
	
	
	@Override
	public HashMap<String, Object> userUpdate(HashMap<String, Object> param) {
		result = new HashMap<String,Object>();
		sqlID = namespace + ".userUpdate";
		bean = new DaoBean("Update", sqlID, param);
		result.put("userUpdate", di.dao(bean));
		System.out.println("mypage update :" + result);
		return result;
	}

}
