package com.kdn.model.domain;

public class FileBean {
	private int uno;
	private String rfilename;
	private String sfilename;
	private int nno;
	public FileBean(){}
	public FileBean(String filename, String sfilename) {
		this.rfilename = filename;
		this.sfilename = sfilename;
	}
	public FileBean(int no, String filename, String sfilename, int bno) {
		this.uno = no;
		this.rfilename = filename;
		this.sfilename = sfilename;
		this.nno = bno;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FileBean [no=").append(uno).append(", filename=").append(rfilename).append(", sfilename=")
				.append(sfilename).append(", bno=").append(nno).append("]");
		return builder.toString();
	}
	public int getNo() {
		return uno;
	}
	public void setNo(int no) {
		this.uno = no;
	}
	public String getFilename() {
		return rfilename;
	}
	public void setFilename(String rfilename) {
		this.rfilename = rfilename;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	public int getBno() {
		return nno;
	}
	public void setBno(int bno) {
		this.nno = bno;
	}
	
	
	
	
	
}
