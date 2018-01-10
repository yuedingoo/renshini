package com.jxust.utils;

public class VerificationCodeUtil {
	
	/**
	 * 得到六位随机数
	 * @return
	 */
	public static String get6RandomNumber(){
		String str = String.valueOf((int)((Math.random()*9+1)*100000));
		if(str.equals("1000000")){
			str = String.valueOf((int)((Math.random()*9+1)*100000));
		}
		return str;
	}

}
