package com.jxust.web.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.jxust.bean.User;
import com.jxust.service.UserService;
import com.jxust.utils.FastJsonUtil;
import com.jxust.utils.MD5Utils;
import com.jxust.utils.VerificationCodeUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	private UserService userService;
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	/**
	 * 实现用户注册功能
	 * @return
	 * @throws Exception
	 */
	public String regist() throws Exception {
		user.setPassword(MD5Utils.md5(user.getPassword()));//为密码进行加密
		userService.regist(user);
		return "index";
	}
	
	/**
	 * 获取短信验证码
	 * @return
	 */
	public String getSMSCode(){
		/*短信验证
		 * String host = "http://fesms.market.alicloudapi.com";
	    String path = "/sms/";
	    String method = "GET";
	    String appcode = "ed75eafd4fd248ab8fe27d0266c0254a";//简单身份认证调用信息
	    Map<String, String> headers = new HashMap<String, String>();
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("code", VerificationCodeUtil.get6RandomNumber());//验证码（需要随机生成六位数字）
	    querys.put("phone", user.getTele());//向谁发送
	    querys.put("skin", "5");//发送信息皮肤
//	    querys.put("sign", "认识你");//标签名
		
	    try{
			HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
	    	System.out.println(response.toString());
		} catch (Exception e) {
	    	e.printStackTrace();
	    }*/
		
		// 测试使用（上面的是定稿模板）
		String str = VerificationCodeUtil.get6RandomNumber();//模拟生成的短信验证码
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, str);
		HttpServletRequest request = ServletActionContext.getRequest();
//因为请求响应是无状态的，当使用异步请求发送短信验证时，只能调用这个方法，不能会调用其它方法；当信息填写完成就行提交时会调用regist方法，其中需要之前生成的短信验证码，所以要在生成时进行保存
		request.getSession().setAttribute("code", str);
	    
	    return NONE;
	}
	
	/**
	 * 验证输入的短信验证码是否正确
	 * @return
	 */
	private String vcode;
	public void setVcode(String vcode){
		this.vcode = vcode;
	}
	public String verificationSMS(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String code = (String) request.getSession().getAttribute("code");//之前生成的短信
		// 进行验证码的判断
		String msg = null;
		if(code.equals(vcode)){
			msg = "验证码输入正确";
		}else{
			msg = "验证码不正确";
		}
		FastJsonUtil.write_json(response, msg);
		return NONE;
	}
	
	/**
	 * 进行登录验证
	 * @return
	 * @throws Exception
	 */
	private String remember;
	public void setRemember(String remember){
		this.remember = remember;
	}
	public String login() throws Exception{
		
		// 勾选中记住账号
		if("ok".equals(remember)){
			Cookie cookie = new Cookie("tele", user.getTele());
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addCookie(cookie);
		}
		
		user.setPassword(MD5Utils.md5(user.getPassword()));
		User u = userService.login(user);
		String msg = null;
		if(u == null){
			msg = "账号或密码错误";
			// 将信息放入值栈中到jsp中进行显示
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("msg", msg);
			return "index";
		}
		return "info";
	}
	
	/**
	 * 修改密码（设置新密码）
	 * @return
	 * @throws Exception
	 */
	public String modifyPwd() throws Exception {
		userService.modifyPwd(user.getTele(), MD5Utils.md5(user.getPassword()));
		System.out.println(user.getTele() + '+' + user.getPassword());
		return NONE;
	}
	
	/**
	 * 判断是否为已注册手机号（忘记密码第一步）
	 * @return
	 * @throws Exception
	 */
	public String fpwd1() throws Exception{
		String tele = userService.fpwd1(user.getTele());
		String msg = null;
		if(tele == null){
			msg = "此手机号未注册，请输入正确的账号";
		}else{
			msg = "账号存在";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, msg);
		return NONE;
	}

}
