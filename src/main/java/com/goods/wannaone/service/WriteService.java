package com.goods.wannaone.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goods.wannaone.bean.DaoBean;
import com.goods.wannaone.dao.DaoInterface;

import com.goods.wannaone.util.HttpUtil;

@Service
public class WriteService implements WriteServiceInterface {
    @Autowired
    DaoInterface di;
	
    private final String namespace = "sql";
	private HashMap<String,Object> result;
	private DaoBean bean;
	private String sqlID;
    
	@Override
	public HashMap<String, Object> inwriting(HashMap<String, Object> param) {
		result = new HashMap<String,Object>();
		//InsertNews  goods테이블에 상품등록
		sqlID = namespace + ".InsertNews";
		bean = new DaoBean("Insert", sqlID, param);
		result.put("InsertNews", di.dao(bean));		
		
		//InsertImgs img테이블에 사진등록
		sqlID = namespace + ".InsertImgs";
		bean = new DaoBean("Insert", sqlID, param);
		result.put("InsertImgs", di.dao(bean));
		
		return result;
	}

	
	@Override
	public HashMap<String, Integer> fileAdd(HashMap<String, Object> param) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		System.out.println("여기도 왔어~~");
		map.put("status", (Integer) di.dao(bean));
		return map;
	}

	@Override
	public HashMap<String, Integer> fileUpdate(HashMap<String, Object> param) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("status", (Integer) di.dao(bean));
		return map;
	}
	
	@Override
	public HashMap<String, Object> fileOutput(HttpServletRequest req, MultipartFile[] img) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      HashMap<String, Object> param = HttpUtil.paramMap(req);
	      List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	      System.out.println("for문 시작");
		  for(int i = 0; i < img.length; i++){
		         try {
		            byte[] bytes = img[i].getBytes();
		            
		            String imgpath = "";
		            // 개발 툴에서만 사용 할것!
		            imgpath = "D:/GDJ7/WannaoneGoods/src/main/webapp/";
//		            imgpath = req.getSession().getServletContext().getRealPath("/") + imgpath2;
		            
		            UUID uuid = UUID.randomUUID();
		            String fileName = img[i].getOriginalFilename();
		            String extension = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		            String[] extensions = {"JPG","JPEG","BMP","PNG"};
		            boolean check = false;
		            HashMap<String, Object> data = new HashMap<String, Object>();
		            
		            for(int c = 0; c < extensions.length; c++){
		            	if(extensions[c].equals(extension.toUpperCase())){
		            		check = true;
		            	}
		            }
		            
		            if(check){
			            String imgname = "resources/img/";
	//		            	   imgname += img[i].getOriginalFilename();
			            	   imgname += uuid + "." + extension;
			            
			            File f = new File(imgpath);
			            System.out.println("중간 :" +imgpath+imgname);
			            // 파일 경로 없을 때 폴더 생성하기
						if(!f.exists()){
							f.mkdirs();
						}
						
						// 경로에 같은 파일이 없을때 파일 생성
						f = new File(imgpath + imgname);
			            if(!f.exists()){
			               OutputStream out = new FileOutputStream(f);
			               out.write(bytes);
			               out.close();
			               
			               data.put("picName", imgname);
			               data.put("status", 1);
			               list.add(data);
			            }
		            } else {
		            	data.put("picName", "");
		            	data.put("status", 0);
			            list.add(data);
		            }
		         } catch (IOException e) {
		            e.printStackTrace();
		         } finally {
		         }
		      }
			   
          map.put("images", list);
		  System.out.println(map);
	      return map;
	}


	@Override
	public HashMap<String, Object> setGoods(HashMap<String, Object> param, HashMap<String, Object> subImagesMap) {
		result = new HashMap<String,Object>();
		
		try {
			//InsertNews  goods테이블에 상품등록
			sqlID = namespace + ".InsertNews";
			bean = new DaoBean("Insert", sqlID, param);
			di.dao(bean);
			
			//getGno  goods테이블에 최신 gno 가져오기
			sqlID = namespace + ".getGno";
			bean = new DaoBean("SelectOne", sqlID, param);
			HashMap<String, Object> imgParam = (HashMap<String, Object>) di.dao(bean);
			
			//InsertImgs img테이블에 이미지등록
			List<HashMap<String, Object>> subList = (List<HashMap<String, Object>>) subImagesMap.get("images");
			sqlID = namespace + ".InsertImgs";
			for(int i = 0; i < subList.size(); i++){
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("gno", imgParam.get("gno"));
				map.put("picpath", subList.get(i).get("picName"));
				map.put("sort", (i + 1));
				bean = new DaoBean("Insert", sqlID, map);
				di.dao(bean);
			}
			result.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", 0);
		} finally {
			System.out.println(result);
		}
		
		return result;
	}


}
