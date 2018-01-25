package com.goods.wannaone.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
		HashMap<String, Object> list =new HashMap<String,Object>();
		result = new HashMap<String,Object>();
		sqlID = namespace + ".insertCart";
		System.out.println("service : " + param);
		
		JSONArray jsonArray = JSONArray.fromObject(param.get("list").toString());
		for(int i = 0; i < jsonArray.size(); i++){
			JSONObject jo = jsonArray.getJSONObject(i);
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			data.put("gno", jo.getInt("gno"));
			data.put("email", jo.getString("email"));
			data.put("gname", jo.getString("gname"));
			data.put("price", jo.getInt("price"));
			data.put("memberpick", jo.getString("memberpick"));
			data.put("ea", jo.getInt("ea"));
			System.out.println(i + " : " + data);
			
			bean = new DaoBean("Insert", sqlID, data);
			di.dao(bean);
		}
//		bean = new DaoBean("Insert", sqlID, param);
//		result.put("insertCart", di.dao(bean));
		return result;

	}
	
	@Override
	public HashMap<String, Object> selectCart(HashMap<String, Object> param){
		result = new HashMap<String,Object>();
	
		// 장바구니 리스트 가져오기
		sqlID = namespace + ".selectCart";
		bean = new DaoBean("SelectList", sqlID, param);
		result.put("selectCart", di.dao(bean));
		return result;
	}
	
	
	
	    
	
	
	
	


}
