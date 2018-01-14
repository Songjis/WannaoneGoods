package com.goods.wannaone.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;

@Service
public class HomeService implements HomeServiceInterface {

	@Autowired
	DaoInterface di;
	
	private final String namespace = "sql";
	private HashMap<String,Object> result;
	private DaoBean bean;
	private String sqlID;
	
	@Override
	public HashMap<String, Object> DBTest(HashMap<String, Object> param) {
		result = new HashMap<String,Object>(); // 리턴용 맵 생성
		sqlID = namespace + ".test"; // 실행할 네임스페이스 + 아이디 생성
		bean = new DaoBean("SelectOne", sqlID, param); // 마이바티스에 실행할 명령어 생성
		
		result.put("test", di.dao(bean));  // dao 실행 후 리턴용 맵에 넣기
				
		return result;
	}
	
	
	@Override
	public HashMap<String, Object> poplist(HashMap<String, Object> param){
		result = new HashMap<String,Object>();
		sqlID = namespace + ".poplist";
		bean = new DaoBean("SelectList", sqlID, param);
		
		result.put("poplist", di.dao(bean));
		
		return result;
	}
	

}
