package com.goods.wannaone.service;

import java.util.HashMap;
import java.util.List;

public interface CartServiceInterface {
	public HashMap<String, Object> insertCart(HashMap<String, Object> param);
	public HashMap<String, Object> selectCart(HashMap<String, Object> param);
}
