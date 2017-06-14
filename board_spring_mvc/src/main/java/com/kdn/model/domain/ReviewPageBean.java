package com.kdn.model.domain;

import java.io.Serializable;
public class ReviewPageBean implements Serializable {
	/**
	 * reviewKey : 검색 조건
	 * reviewWord: 검색 단어
	 * reviewPagelink : 목록의 페이지 링크를 표시
	 */
	private String reviewKey, reviewWord, reviewPagelink;
	private int reviewPageNo, reviewInterval = 7, reviewStart=1 , reviewEnd=reviewInterval ;
	
	
	
	public String getReviewKey() {
		return reviewKey;
	}
	public void setReviewKey(String reviewKey) {
		this.reviewKey = reviewKey;
	}
	public String getReviewWord() {
		return reviewWord;
	}
	public void setReviewWord(String reviewWord) {
		this.reviewWord = reviewWord;
	}
	public String getReviewPagelink() {
		return reviewPagelink;
	}
	public void setReviewPagelink(String reviewPagelink) {
		this.reviewPagelink = reviewPagelink;
	}
	public int getReviewPageNo() {
		return reviewPageNo;
	}
	public void setReviewPageNo(int reviewPageNo) {
		this.reviewPageNo = reviewPageNo;
	}
	public int getReviewInterval() {
		return reviewInterval;
	}
	public void setReviewInterval(int reviewInterval) {
		this.reviewInterval = reviewInterval;
	}
	public int getReviewStart() {
		return reviewStart;
	}
	public void setReviewStart(int reviewStart) {
		this.reviewStart = reviewStart;
	}
	public int getReviewEnd() {
		return reviewEnd;
	}
	public void setReviewEnd(int reviewEnd) {
		this.reviewEnd = reviewEnd;
	}

	public String getKey() {
		return reviewKey;
	}
	public void setKey(String reviewKey) {
		if(reviewKey==null) this.reviewKey="all";
		else this.reviewKey = reviewKey;
	}
	public String getWord() {
		return reviewWord;
	}
	public void setWord(String reviewWord) {
		if(reviewWord==null) this.reviewWord = "";
		else this.reviewWord = reviewWord;
	}
	public String getPagelink() {
		return reviewPagelink;
	}
	public void setPagelink(String reviewPagelink) {
		this.reviewPagelink = reviewPagelink;
	}
	public int getPageNo() {
		return reviewPageNo;
	}
	public void setPageNo(int reviewPageNo) {
		if(reviewPageNo>0)this.reviewPageNo = reviewPageNo;
		else this.reviewPageNo=1;
	}
	public void setPageNo(String reviewPageNo) {
		try {
			this.reviewPageNo = Integer.parseInt(reviewPageNo);
		} catch (Exception e) {
			this.reviewPageNo = 1;
		}
	}
	public String getKey(String k){
		if(k!=null && reviewKey.equals(k)) return "selected='selected'";
		else return "";
	}
	public ReviewPageBean(){
		setKey("all");
		setWord("");
		setPagelink("1");
		setPageNo(1);
	}
	public ReviewPageBean(String reviewKey, String reviewWord, String reviewPagelink, int reviewPageNo) {
		setKey(reviewKey);
		setWord(reviewWord);
		setPagelink(reviewPagelink);
		setPageNo(reviewPageNo);
	}
	public ReviewPageBean(String reviewKey, String reviewWord, String reviewPagelink, String reviewPageNo) {
		setKey(reviewKey);
		setWord(reviewWord);
		setPagelink(reviewPagelink);
		setPageNo(reviewPageNo);
	}
	public int getInterval() {
		return reviewInterval;
	}
	public void setInterval(int reviewInterval) {
		this.reviewInterval = reviewInterval;
	}
	public int getStart() {
		if(reviewPageNo>1){
			return reviewStart =  (reviewPageNo -1) * reviewInterval + 1;
		}else{
			return   1;
		}
	}
	public void setStart(int reviewStart) {
		this.reviewStart = reviewStart;
	}
	public int getEnd() {
			return reviewStart+reviewStart - 1;
	}
	public void setEnd(int reviewEnd) {
		this.reviewEnd =reviewEnd;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReviewPageBean [reviewKey=").append(reviewKey)
				.append(", reviewWord=").append(reviewWord)
				.append(", reviewPagelink=").append(reviewPagelink)
				.append(", reviewPageNo=").append(reviewPageNo)
				.append(", reviewInterval=").append(reviewInterval)
				.append(", reviewStart=").append(reviewStart)
				.append(", reviewEnd=").append(reviewEnd).append("]");
		return builder.toString();
	}
	
}











