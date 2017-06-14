package com.kdn.model.domain;

public class Food {
	private int fno;
	private String fname;
	private String image;
	
	public Food(){}
	
	public Food(int fno, String fname, String image){
		fno = this.fno;
		fname = this.fname;
		image = this.image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Food [fno=" + fno + ", fname=" + fname + ", image=" + image
				+ "]";
	}
	
}
