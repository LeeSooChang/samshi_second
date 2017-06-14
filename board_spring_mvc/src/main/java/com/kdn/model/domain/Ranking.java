package com.kdn.model.domain;

import java.io.Serializable;


public class Ranking implements Serializable{
	private int rkno;
	private String rkname;
	private String imag;
	private String img;
	
	public Ranking(int rkno, String rkname, String imag, String img) {
		super();
		this.rkno = rkno;
		this.rkname = rkname;
		this.imag = imag;
		this.img = img;
	}

	public Ranking(){}

	public Ranking(int rkno, String rkname, String imag) {
		super();
		this.rkno = rkno;
		this.rkname = rkname;
		this.imag = imag;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getRkno() {
		return rkno;
	}

	public void setRkno(int rkno) {
		this.rkno = rkno;
	}

	public String getRkname() {
		return rkname;
	}

	public void setRkname(String rkname) {
		this.rkname = rkname;
	}

	public String getImag() {
		return imag;
	}

	public void setImag(String imag) {
		this.imag = imag;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Ranking [img=").append(img).append("]");
		return builder.toString();
	}
	
}
