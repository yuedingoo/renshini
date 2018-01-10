package com.jxust.service;

import com.jxust.bean.User;

public interface UserService {

	void regist(User user) throws Exception;

	User login(User user) throws Exception;

	String fpwd1(String tele) throws Exception;

	void modifyPwd(String tele, String password) throws Exception;

}
