package com.kdn.model.domain;

import java.io.Serializable;

public class Anonymity implements Serializable{
	private int ano;
	private int mno;
	private String anopw;
	private String anotitle;
	private String anocontents;
	private String anodate;
	
	public Anonymity(){}

	public Anonymity(int ano, String anopw, String anotitle,
			String anocontents, String anodate) {
		super();
		this.ano = ano;
		this.anopw = anopw;
		this.anotitle = anotitle;
		this.anocontents = anocontents;
		this.anodate = anodate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getAnopw() {
		return anopw;
	}

	public void setAnopw(String anopw) {
		this.anopw = anopw;
	}

	public String getAnotitle() {
		return anotitle;
	}

	public void setAnotitle(String anotitle) {
		this.anotitle = anotitle;
	}

	public String getAnocontents() {
		return anocontents;
	}

	public void setAnocontents(String anocontents) {
		this.anocontents = anocontents;
	}

	public String getAnodate() {
		return anodate;
	}

	public void setAnodate(String anodate) {
		this.anodate = anodate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("anonymity [ano=").append(ano).append(", anopw=")
				.append(anopw).append(", anotitle=").append(anotitle)
				.append(", anocontents=").append(anocontents)
				.append(", anodate=").append(anodate).append("]");
		return builder.toString();
	}
	
}
