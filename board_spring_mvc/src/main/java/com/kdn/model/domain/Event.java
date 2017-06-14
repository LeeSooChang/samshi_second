package com.kdn.model.domain;

public class Event {
	private int eno;
	private String edate;
	private int mno;
	
	public Event(){}
	
	public Event(int eno, String edate, int mno) {
		super();
		this.eno = eno;
		this.edate = edate;
		this.mno = mno;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "Event [eno=" + eno + ", edate=" + edate + ", mno=" + mno + "]";
	}
	
}
