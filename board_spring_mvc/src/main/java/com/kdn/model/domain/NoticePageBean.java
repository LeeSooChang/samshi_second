package com.kdn.model.domain;

import java.io.Serializable;

public class NoticePageBean implements Serializable {
	/**
	 * key : 검색 조건
	 * word: 검색 단어
	 * pagelink : 목록의 페이지 링크를 표시
	 */
	private String noticeKey, noticeWord, noticePagelink;
	private int noticePageNo, noticeInterval = 3, noticeStart=1 , noticeEnd=noticeInterval ;
	public String getKey() {
		return noticeKey;
	}
	public void setKey(String noticeKey) {
		if(noticeKey==null) this.noticeKey="all";
		else this.noticeKey = noticeKey;
	}
	public String getWord() {
		return noticeWord;
	}
	public void setWord(String noticeWord) {
		if(noticeWord==null) this.noticeWord = "";
		else this.noticeWord = noticeWord;
	}
	public String getPagelink() {
		return noticePagelink;
	}
	public void setPagelink(String noticePagelink) {
		this.noticePagelink = noticePagelink;
	}
	public int getPageNo() {
		return noticePageNo;
	}
	public void setPageNo(int noticePageNo) {
		if(noticePageNo>0)
			this.noticePageNo = noticePageNo;
		else 
			this.noticePageNo=1;
	}
	public void setPageNo(String noticePageNo) {
		try {
			this.noticePageNo = Integer.parseInt(noticePageNo);
		} catch (Exception e) {
			this.noticePageNo = 1;
		}
	}
	public String getKey(String k){
		if(k!=null && noticeKey.equals(k)) return "selected='selected'";
		else return "";
	}
	public NoticePageBean(){
		setKey("all");
		setWord("");
		setPagelink("1");
		setPageNo(1);
	}
	public NoticePageBean(String noticeKey, String noticeWord, String noticePagelink, int noticePageNo) {
		setKey(noticeKey);
		setWord(noticeWord);
		setPagelink(noticePagelink);
		setPageNo(noticePageNo);
	}
	public NoticePageBean(String noticeKey, String noticeWord, String noticePagelink, String noticePageNo) {
		setKey(noticeKey);
		setWord(noticeWord);
		setPagelink(noticePagelink);
		setPageNo(noticePageNo);
	}
	public int getInterval() {
		return noticeInterval;
	}
	public void setInterval(int noticeInterval) {
		this.noticeInterval = noticeInterval;
	}
	public int getStart() {
		if(noticePageNo>1){
			return noticeStart =  (noticePageNo -1) * noticeInterval + 1;
		}else{
			return   1;
		}
	}
	public void setStart(int noticeStart) {
		this.noticeStart = noticeStart;
	}
	public int getEnd() {
			return noticeStart+noticeInterval - 1;
	}
	public void setEnd(int noticeEnd) {
		this.noticeEnd =noticeEnd;
	}
	
	public String getNoticeKey() {
		return noticeKey;
	}
	public void setNoticeKey(String noticeKey) {
		this.noticeKey = noticeKey;
	}
	public String getNoticeWord() {
		return noticeWord;
	}
	public void setNoticeWord(String noticeWord) {
		this.noticeWord = noticeWord;
	}
	public String getNoticePagelink() {
		return noticePagelink;
	}
	public void setNoticePagelink(String noticePagelink) {
		this.noticePagelink = noticePagelink;
	}
	public int getNoticePageNo() {
		return noticePageNo;
	}
	public void setNoticePageNo(int noticePageNo) {
		this.noticePageNo = noticePageNo;
	}
	public int getNoticeInterval() {
		return noticeInterval;
	}
	public void setNoticeInterval(int noticeInterval) {
		this.noticeInterval = noticeInterval;
	}
	public int getNoticeStart() {
		return noticeStart;
	}
	public void setNoticeStart(int noticeStart) {
		this.noticeStart = noticeStart;
	}
	public int getNoticeEnd() {
		return noticeEnd;
	}
	public void setNoticeEnd(int noticeEnd) {
		this.noticeEnd = noticeEnd;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NoticePageBean [noticeKey=").append(noticeKey).append(", noticeWord=")
				.append(noticeWord).append(", noticePagelink=").append(noticePagelink)
				.append(", noticePageNo=").append(noticePageNo).append(", noticeInterval=")
				.append(noticeInterval).append(", noticestart=").append(noticeStart)
				.append(", noticeEnd=").append(noticeEnd).append("]");
		return builder.toString();
	}
	
}











