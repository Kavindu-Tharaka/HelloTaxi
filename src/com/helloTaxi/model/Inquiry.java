package com.helloTaxi.model;

public class Inquiry {
	
	private String name;
	private String msg;
	private static Inquiry inquiry;
	
	private Inquiry() {}
	
	
	//singleton design pattern
	public static Inquiry getInquiry() {
		
		if (inquiry == null) {
			inquiry = new Inquiry();
			return inquiry;
		}
		return inquiry;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	

}
