package com.jxust.web.action;

import com.jxust.bean.User;
import com.jxust.service.IndexService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class IndexAction extends ActionSupport implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	private IndexService indexService;
	public void setIndexService(IndexService indexService){
		this.indexService = indexService;
	}
	
	/**
	 * 调转到主页面，下面的方法可以加载数据在主页面中进行显示
	 * @return
	 * @throws Exception
	 */
	public String index() throws Exception{
		return "index";
	}

}
