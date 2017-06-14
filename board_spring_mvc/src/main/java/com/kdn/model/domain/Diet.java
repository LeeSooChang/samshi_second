package com.kdn.model.domain;

public class Diet {
	private int dietNo;
	private int scode;
	private String dietDate;
	private String mainDish;
	private String sideDish;
	
	public Diet(){}
	
	public Diet(int dietNo, int scode, String dietDate, String mainDish, String sideDish) {
		super();
		this.dietNo = dietNo;
		this.scode = scode;
		this.dietDate = dietDate;
		this.mainDish = mainDish;
		this.sideDish = sideDish;
	}

	public int getDietNo() {
		return dietNo;
	}

	public void setDietNo(int dietNo) {
		this.dietNo = dietNo;
	}

	public int getScode() {
		return scode;
	}

	public void setScode(int scode) {
		this.scode = scode;
	}

	public String getDietDate() {
		return dietDate;
	}

	public void setDietDate(String date) {
		this.dietDate = date;
	}

	public String getMainDish() {
		return mainDish;
	}

	public void setMainDish(String mainDish) {
		this.mainDish = mainDish;
	}

	public String getSideDish() {
		return sideDish;
	}

	public void setSideDish(String sideDish) {
		this.sideDish = sideDish;
	}

	@Override
	public String toString() {
		return "Diet [dietNo=" + dietNo + ", scode=" + scode + ", dietDate=" + dietDate
				+ ", mainDish=" + mainDish + ", sideDish=" + sideDish + "]";
	}
}
