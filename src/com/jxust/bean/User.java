package com.jxust.bean;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String uid;
	
	private String name;	//真实姓名用于登录
	
	private String password;	//登录密码
	
	private String tele;	//手机号

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTele() {
		return tele;
	}

	public void setTele(String tele) {
		this.tele = tele;
	}

}
