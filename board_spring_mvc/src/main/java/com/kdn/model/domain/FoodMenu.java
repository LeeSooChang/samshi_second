package com.kdn.model.domain;

public class FoodMenu {
	private int fmno;
	private String fmdate;
	private int fno;
	private int scode;
	
	public FoodMenu(){}
	
	public FoodMenu(int fmno, String fmdate, int fno, int scode){
		fmno = this.fmno;
		fmdate = this.fmdate;
		fno = this.fno;
		scode = this.scode;
	}

	public int getFmno() {
		return fmno;
	}

	public void setFmno(int fmno) {
		this.fmno = fmno;
	}

	public String getFmdate() {
		return fmdate;
	}

	public void setFmdate(String fmdate) {
		this.fmdate = fmdate;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getScode() {
		return scode;
	}

	public void setScode(int scode) {
		this.scode = scode;
	}

	@Override
	public String toString() {
		return "FoodMenu [fmno=" + fmno + ", fmdate=" + fmdate + ", fno=" + fno
				+ ", scode=" + scode + "]";
	}
}
