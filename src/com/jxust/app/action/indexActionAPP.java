package com.jxust.app.action;

import com.jxust.bean.User;
import com.jxust.service.IndexService;
import com.jxust.utils.FastJsonUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;

public class indexActionAPP extends ActionSupport implements ModelDriven<User>{

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
		String code = null, msg = null;

		//以后可能有一些查询操作（）

		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, msg);
		return NONE;
	}

}
