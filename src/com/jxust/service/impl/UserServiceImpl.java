package com.jxust.service.impl;

import com.jxust.bean.User;
import com.jxust.dao.UserDao;
import com.jxust.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	/**
	 * 用户的注册
	 */
	@Override
	public void regist(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.save(user);
	}

	/**
	 * 用户登录判断
	 */
	@Override
	public User login(User user) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userIfExist(user);
	}

	/**
	 * 判断此手机号是否已经注册（找回密码第一步）
	 */
	@Override
	public String fpwd1(String tele) throws Exception {
		// TODO Auto-generated method stub
		return userDao.teleIfExist(tele);
	}

	/**
	 * 修改密码
	 */
	@Override
	public void modifyPwd(String tele, String password) throws Exception {
		// TODO Auto-generated method stub
		userDao.modifyPwd(tele, password);
	}
}
