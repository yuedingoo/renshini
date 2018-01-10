package com.jxust.service.impl;

import com.jxust.dao.IndexDao;
import com.jxust.dao.UserDao;
import com.jxust.service.IndexService;

public class IndexServiceImpl implements IndexService {

	private IndexDao indexDao;
	public void setIndexDao(IndexDao indexDao){
		this.indexDao = indexDao;
	}
	
}
