package com.kdn.model.domain;

import java.io.Serializable;

public class Suyo implements Serializable{
	private int dietNo;
	private int mno;
	private int suyoCountAll;
	public Suyo() {
		super();
	}
	public Suyo(int dietNo, int mno) {
		super();
		this.dietNo = dietNo;
		this.mno = mno;
	}
	
	public Suyo(int dietNo, int mno, int suyoCountAll) {
		super();
		this.dietNo = dietNo;
		this.mno = mno;
		this.suyoCountAll = suyoCountAll;
	}
	public int getDietno() {
		return dietNo;
	}
	public void setDietno(int dietno) {
		this.dietNo = dietNo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	@Override
	public String toString() {
		return "Suyo [dietNo=" + dietNo + ", mno=" + mno + ", suyoCountAll="
				+ suyoCountAll + "]";
	}
	public int getDietNo() {
		return dietNo;
	}
	public void setDietNo(int dietNo) {
		this.dietNo = dietNo;
	}
	public int getSuyoCountAll() {
		return suyoCountAll;
	}
	public void setSuyoCountAll(int suyoCountAll) {
		this.suyoCountAll = suyoCountAll;
	}
	
	
}
