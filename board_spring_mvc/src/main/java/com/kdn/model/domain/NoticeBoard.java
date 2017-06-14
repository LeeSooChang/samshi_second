package com.kdn.model.domain;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeBoard implements Serializable{
	private int nno;
	private int mno;
	private String title;
	private String contents;
	private String ndate;
	private List<FileBean>  files;    //조인 정보
	private MultipartFile[] fileup;
	
	
	public NoticeBoard() {
		super();
	}
	
	public NoticeBoard(int nno, int mno, String title, String contents,
			String ndate) {
		super();
		this.nno = nno;
		this.mno = mno;
		this.title = title;
		this.contents = contents;
		this.ndate = ndate;
	}
	public NoticeBoard(int nno, int mno, String title, String contents,
			String ndate, List<FileBean> files) {
		super();
		this.nno = nno;
		this.mno = mno;
		this.title = title;
		this.contents = contents;
		this.ndate = ndate;
		this.files = files;
	}
	
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public List<FileBean> getFiles() {
		return files;
	}
	public void setFiles(List<FileBean> files) {
		this.files = files;
	}
	public MultipartFile[] getFileup() {
		return fileup;
	}
	public void setFileup(MultipartFile[] fileup) {
		this.fileup = fileup;
	}
	
	
	@Override
	public String toString() {
		return "NoticeBoard [nno=" + nno + ", mno=" + mno + ", title=" + title
				+ ", contents=" + contents + ", ndate=" + ndate + ", files="
				+ files + ", fileup=" + Arrays.toString(fileup) + "]";
	}
	
}
