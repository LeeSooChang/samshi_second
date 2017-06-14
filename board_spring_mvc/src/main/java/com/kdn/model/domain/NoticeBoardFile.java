package com.kdn.model.domain;

import java.io.Serializable;
public class NoticeBoardFile implements Serializable {
	private int uno;
	private String rfileName;
	private String fileName;
	private int nno;
	public NoticeBoardFile(){}
	public NoticeBoardFile(int no, String rfileName, String fileName, int nno) {
		super();
		this.uno = no;
		this.rfileName = rfileName;
		this.fileName = fileName;
		this.nno = nno;
	}
	@Override
	public String toString() {
		return  new StringBuilder().append("BoardFile [no=")
				.append(uno).append(", rfileName=")
				.append(rfileName).append(", fileName=")
				.append(fileName).append(", bno=")
				.append(nno).append("]").toString();
	}
	public int getNo() {
		return uno;
	}
	public void setNo(int no) {
		this.uno = no;
	}
	public String getRfileName() {
		return rfileName;
	}
	public void setRfileName(String rfileName) {
		this.rfileName = rfileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getBno() {
		return nno;
	}
	public void setBno(int bno) {
		this.nno = bno;
	}
	
}








