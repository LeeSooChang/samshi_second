package com.kdn.model.domain;

import java.io.Serializable;
public class AnonymityPageBean implements Serializable {
	/**
	 * anonymityKey : 검색 조건
	 * anonymityWord: 검색 단어
	 * anonymityPagelink : 목록의 페이지 링크를 표시
	 */
	private String anonymityKey, anonymityWord, anonymityPagelink;
	private int anonymityPageNo, anonymityInterval = 7, anonymityStart=1 , anonymityEnd=anonymityInterval ;
	
	
	public AnonymityPageBean(String anonymityKey, String anonymityWord,
			String anonymityPagelink, int anonymityPageNo,
			int anonymityInterval, int anonymityStart, int anonymityEnd) {
		super();
		this.anonymityKey = anonymityKey;
		this.anonymityWord = anonymityWord;
		this.anonymityPagelink = anonymityPagelink;
		this.anonymityPageNo = anonymityPageNo;
		this.anonymityInterval = anonymityInterval;
		this.anonymityStart = anonymityStart;
		this.anonymityEnd = anonymityEnd;
	}
	
	

	public String getAnonymityKey() {
		return anonymityKey;
	}



	public void setAnonymityKey(String anonymityKey) {
		this.anonymityKey = anonymityKey;
	}



	public String getAnonymityWord() {
		return anonymityWord;
	}



	public void setAnonymityWord(String anonymityWord) {
		this.anonymityWord = anonymityWord;
	}



	public String getAnonymityPagelink() {
		return anonymityPagelink;
	}



	public void setAnonymityPagelink(String anonymityPagelink) {
		this.anonymityPagelink = anonymityPagelink;
	}



	public int getAnonymityPageNo() {
		return anonymityPageNo;
	}



	public void setAnonymityPageNo(int anonymityPageNo) {
		this.anonymityPageNo = anonymityPageNo;
	}



	public int getAnonymityInterval() {
		return anonymityInterval;
	}



	public void setAnonymityInterval(int anonymityInterval) {
		this.anonymityInterval = anonymityInterval;
	}



	public int getAnonymityStart() {
		return anonymityStart;
	}



	public void setAnonymityStart(int anonymityStart) {
		this.anonymityStart = anonymityStart;
	}



	public int getAnonymityEnd() {
		return anonymityEnd;
	}



	public void setAnonymityEnd(int anonymityEnd) {
		this.anonymityEnd = anonymityEnd;
	}



	////////////////////////////////////
	public String getKey() {
		return anonymityKey;
	}
	public void setKey(String anonymityKey) {
		if(anonymityKey==null) this.anonymityKey="all";
		else this.anonymityKey = anonymityKey;
	}
	public String getWord() {
		return anonymityWord;
	}
	public void setWord(String anonymityWord) {
		if(anonymityWord==null) this.anonymityWord = "";
		else this.anonymityWord = anonymityWord;
	}
	public String getPagelink() {
		return anonymityPagelink;
	}
	public void setPagelink(String anonymityPagelink) {
		this.anonymityPagelink = anonymityPagelink;
	}
	public int getPageNo() {
		return anonymityPageNo;
	}
	public void setPageNo(int anonymityPageNo) {
		if(anonymityPageNo>0)this.anonymityPageNo = anonymityPageNo;
		else this.anonymityPageNo=1;
	}
	public void setPageNo(String anonymityPageNo) {
		try {
			this.anonymityPageNo = Integer.parseInt(anonymityPageNo);
		} catch (Exception e) {
			this.anonymityPageNo = 1;
		}
	}
	public String getKey(String k){
		if(k!=null && anonymityKey.equals(k)) return "selected='selected'";
		else return "";
	}
	public AnonymityPageBean(){
		setKey("all");
		setWord("");
		setPagelink("1");
		setPageNo(1);
	}
	public AnonymityPageBean(String anonymityKey, String anonymityWord, String anonymityPagelink, int anonymityPageNo) {
		setKey(anonymityKey);
		setWord(anonymityWord);
		setPagelink(anonymityPagelink);
		setPageNo(anonymityPageNo);
	}
	public AnonymityPageBean(String anonymityKey, String anonymityWord, String anonymityPagelink, String anonymityPageNo) {
		setKey(anonymityKey);
		setWord(anonymityWord);
		setPagelink(anonymityPagelink);
		setPageNo(anonymityPageNo);
	}
	public int getInterval() {
		return anonymityInterval;
	}
	public void setInterval(int anonymityInterval) {
		this.anonymityInterval = anonymityInterval;
	}
	public int getStart() {
		if(anonymityPageNo>1){
			return anonymityStart =  (anonymityPageNo -1) * anonymityInterval + 1;
		}else{
			return   1;
		}
	}
	public void setStart(int anonymityStart) {
		this.anonymityStart = anonymityStart;
	}
	public int getEnd() {
			return anonymityStart+anonymityInterval - 1;
	}
	public void setEnd(int anonymityEnd) {
		this.anonymityEnd =anonymityEnd;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AnonymityPageBean [anonymityKey=").append(anonymityKey)
				.append(", anonymityWord=").append(anonymityWord)
				.append(", anonymityPagelink=").append(anonymityPagelink)
				.append(", anonymityPageNo=").append(anonymityPageNo)
				.append(", anonymityInterval=").append(anonymityInterval)
				.append(", anonymityStart=").append(anonymityStart)
				.append(", anonymityEnd=").append(anonymityEnd).append("]");
		return builder.toString();
	}
	
}











