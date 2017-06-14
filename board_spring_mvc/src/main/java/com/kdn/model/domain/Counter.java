package com.kdn.model.domain;

public class Counter {
	private String cdate;
	private int mcnt ; 
	private int icnt ;
	private int hcnt ;
	private int ecnt ;
	
	public Counter(){}
	
	public Counter(String cdate, int mcnt, int icnt, int hcnt, int ecnt) {
		super();
		this.cdate = cdate;
		this.mcnt = mcnt;
		this.icnt = icnt;
		this.hcnt = hcnt;
		this.ecnt = ecnt;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public int getMcnt() {
		return mcnt;
	}

	public void setMcnt(int mcnt) {
		this.mcnt = mcnt;
	}

	public int getIcnt() {
		return icnt;
	}

	public void setIcnt(int icnt) {
		this.icnt = icnt;
	}

	public int getHcnt() {
		return hcnt;
	}

	public void setHcnt(int hcnt) {
		this.hcnt = hcnt;
	}

	public int getEcnt() {
		return ecnt;
	}

	public void setEcnt(int ecnt) {
		this.ecnt = ecnt;
	}

	@Override
	public String toString() {
		return "Counter [cdate=" + cdate + ", mcnt=" + mcnt + ", icnt=" + icnt
				+ ", hcnt=" + hcnt + ", ecnt=" + ecnt + "]";
	}
	
}
