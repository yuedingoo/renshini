package com.jxust.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.bean.User;
import com.jxust.dao.UserDao;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	/**
	 * 进行用户的注册保存
	 */
	@Override
	@Transactional(readOnly = false)
	public void save(User user) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(user);
	}

	/**
	 * 此用户是否存在
	 */
	@Override
	public User userIfExist(User user) throws Exception {
		// TODO Auto-generated method stub
		List<User> list = (List<User>)this.getHibernateTemplate().find("from User where tele = ? "
				+ "and password = ?", user.getTele(), user.getPassword());
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	/**
	 * 判断此手机号是否存在（找回密码第一步）
	 */
	@Override
	public String teleIfExist(String tele) throws Exception {
		// TODO Auto-generated method stub
		List<User> list = (List<User>)this.getHibernateTemplate().find("from User where tele = ?", tele);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0).getTele();
	}

	/**
	 * 修改密码（找回密码第二步）
	 */
	@Override
	@Transactional(readOnly = false)
	public void modifyPwd(String tele, String password) throws Exception {
		System.out.println(tele+'+'+password);
		// TODO Auto-generated method stub
		List<User> list = (List<User>)this.getHibernateTemplate().find("from User where tele = ?", tele);
		User u = list.get(0);
		u.setPassword(password);
		this.getHibernateTemplate().update(u);
	}

}
