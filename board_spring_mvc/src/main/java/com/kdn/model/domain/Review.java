package com.kdn.model.domain;

import java.io.Serializable;

public class Review implements Serializable{
	private int rno;
	private int mno;
	private int spoint;
	private String comments;
	private int fno;
	private String fname;
	private String regdate;
	private int scode;
	
	public int getScode() {
		return scode;
	}

	public void setScode(int scode) {
		this.scode = scode;
	}

	public Review(){}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getSpoint() {
		return spoint;
	}

	public void setSpoint(int spoint) {
		this.spoint = spoint;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public Review(int rno, int mno, int spoint, String comments, int fno,
			String fname, String regdate) {
		super();
		this.rno = rno;
		this.mno = mno;
		this.spoint = spoint;
		this.comments = comments;
		this.fno = fno;
		this.fname = fname;
		this.regdate = regdate;
	}

	public Review(int rno, int mno, int spoint, String comments, int fno,
			String fname) {
		super();
		this.rno = rno;
		this.mno = mno;
		this.spoint = spoint;
		this.comments = comments;
		this.fno = fno;
		this.fname = fname;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Review [rno=").append(rno).append(", mno=").append(mno)
				.append(", spoint=").append(spoint).append(", comments=")
				.append(comments).append(", fno=").append(fno)
				.append(", fname=").append(fname).append(", regdate=")
				.append(regdate).append("]");
		return builder.toString();
	}
	
	
}
