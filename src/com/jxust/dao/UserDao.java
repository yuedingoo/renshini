package com.jxust.dao;

import com.jxust.bean.User;

public interface UserDao {

	void save(User user) throws Exception;

	User userIfExist(User user) throws Exception;

	String teleIfExist(String tele) throws Exception;

	void modifyPwd(String tele, String password) throws Exception;
	
}
