package com.kdn.model.domain;

import java.io.Serializable;

public class Member implements Serializable{
	private int mno;
	private String grade = "N";
	private String password;
	private String mname;
	private String phone;
	private String email;
	private String prefer;

	public Member(){
		
	}
	public Member(int mno, String password, String mname, String phone, String email) {
		super();
		this.mno = mno;
		this.password = password;
		this.mname = mname;
		this.phone = phone;
		this.email = email;
	}
	public Member(int mno, String password, String mname, String phone, String email, String prefer) {
		super();
		this.mno = mno;
		this.password = password;
		this.mname = mname;
		this.phone = phone;
		this.email = email;
		this.prefer = prefer;
	}
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPrefer() {
		if(prefer!=null &&  prefer.startsWith(",")){
			this.prefer = prefer.substring(1);
		}
		return prefer;
	}
	public void setPrefer(String prefer) {
		this.prefer = prefer;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("mno=");
		builder.append(mno);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", password=");
		builder.append(password);
		builder.append(", mname=");
		builder.append(mname);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", email=");
		builder.append(email);
		builder.append(", prefer=");
		builder.append(getPrefer());
		return builder.toString();
	}

	
}
