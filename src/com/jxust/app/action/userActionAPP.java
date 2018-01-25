package com.jxust.app.action;

import com.jxust.app.bean.responseApp;
import com.jxust.bean.User;
import com.jxust.service.IndexService;
import com.jxust.service.UserService;
import com.jxust.utils.FastJsonUtil;
import com.jxust.utils.MD5Utils;
import com.jxust.utils.VerificationCodeUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

public class userActionAPP extends ActionSupport implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;

	private UserService userService;
	public void setUserService(UserService userService){
		this.userService = userService;
	}

	private User user = new User();

	@Override
	public User getModel() {
		return user;
	}

	/**
	 * 进行登录验证
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception{

		String code = null, msg = null;

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		user.setPassword(MD5Utils.md5(user.getPassword()));
		//使用 web 开发中的代码
		User u = userService.login(user);
		if(u == null){
			code = "505";
			msg = "账号或密码错误";
			responseApp ra = new responseApp(code, msg, null);
			String jsonString = FastJsonUtil.toJSONString(ra);
			FastJsonUtil.write_json(response, jsonString);
		}else{
			code = "200";
			msg = "账号和密码正确";
			responseApp ra = new responseApp(code, msg, u.getUid());
			String jsonString = FastJsonUtil.toJSONString(ra);
			FastJsonUtil.write_json(response, jsonString);
		}
		return NONE;
	}

	/**
	 * 用户注册实现
	 * @return
	 * @throws Exception
	 */
	public String register() throws Exception{

		String code = null, msg = null;

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		//得到两个提交的参数并放入对象中
		user.setPassword(MD5Utils.md5(user.getPassword()));
		//使用 web 开发中的代码
		userService.regist(user);
		code = "200";
		msg = "用户注册成功";
		responseApp ra = new responseApp(code, msg);
		String jsonString = FastJsonUtil.toJSONString(ra);
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}

	/**
	 * 判断是否为已注册手机号（忘记密码第一步）
	 * @return
	 * @throws Exception
	 */
	public String accountIfExist() throws Exception{
		String code = null,msg = null;
		HttpServletResponse response = ServletActionContext.getResponse();
		String tele = userService.fpwd1(user.getTele());
		if(tele == null){
			code = "505";
			msg = "此手机号未注册，请输入正确的账号";
		}else{
			code = "200";
			msg = "账号存在";
		}
		responseApp ra = new responseApp(code, msg);
		String jsonString = FastJsonUtil.toJSONString(ra);
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
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
	/*private String code;
	public void setCode(String code){
		this.code = code;
	}
	public String verificationSMS(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String msg = null;

		String code1 = (String) request.getSession().getAttribute("code");//之前生成的短信
		// 进行验证码的判断
		if(code.equals(code1)){
			msg = "验证码输入正确";
		}else{
			msg = "验证码不正确";
		}
		FastJsonUtil.write_json(response, msg);
		return NONE;
	}*/

	/**
	 * 修改密码（设置新密码）
	 * @return
	 * @throws Exception
	 */
	private String vcode;
	public void setVcode(String vcode){
		this.vcode = vcode;
	}
	public String modifyPwd() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String code = null,msg = null;

		if(!vcode.equals((String) request.getSession().getAttribute("code"))){
			code = "505";
			msg = "手机验证码错误";
		}else{
			userService.modifyPwd(user.getTele(), MD5Utils.md5(user.getPassword()));
			code = "200";
			msg = "用户修改密码成功";
		}
		responseApp ra = new responseApp(code, msg);
		String jsonString = FastJsonUtil.toJSONString(ra);
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}
}
