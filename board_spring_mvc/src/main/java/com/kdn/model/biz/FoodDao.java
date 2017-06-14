package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Food;
import com.kdn.model.domain.PageBean;

public interface FoodDao {
	public void add(Food food) ;
	public void update(Food food) ;
	public void remove(int fno) ;
	public Food search(int fno) ;
	public List<Food> searchAll(PageBean bean) ;
	public int 	getCount(PageBean bean) ;
	public int 	getFoodNo() ;
}
