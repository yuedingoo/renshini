package com.jxust.app.bean;

public class responseApp {
    private String code;

    private String msg;

    private String uid;

    public responseApp() {}

    public responseApp(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public responseApp(String code, String msg, String uid) {
        this.code = code;
        this.msg = msg;
        this.uid = uid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
}
