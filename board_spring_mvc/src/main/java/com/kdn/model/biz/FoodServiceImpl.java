package com.kdn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Food;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.UpdateException;
import com.kdn.util.PageUtility;

@Service("foodService")
public class FoodServiceImpl implements FoodService {
	@Autowired
	@Qualifier("foodDao")
	private FoodDao dao; 
	
	@Override
	public void update(Food food) {
		try{
			dao.update(food);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Update error"); 
		}
	}

	@Override
	public void remove(int fno) {
		try{
			dao.remove(fno);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Delete error"); 
		}
	}

	@Override
	public Food search(int fno) {
		try{
			return dao.search(fno);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Delete error"); 
		}
	}

	@Override
	public void add(Food food) {
		try{
			int fno = dao.getFoodNo();
			food.setFno(fno);
			dao.add(food);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Add error");
		}
	}

	@Override
	public List<Food> searchAll(PageBean bean) {
		try{
			int total = dao.getCount(bean);
			PageUtility bar = 
		           new PageUtility(bean.getInterval()
		                       , total
		                       , bean.getPageNo()
		                       , "images/");
		         bean.setPagelink(bar.getPageBar());
		    return dao.searchAll(bean);
		} catch(Exception e){
			 e.printStackTrace();
	         throw new UpdateException("DB SearchAll error");
		}
	}

}
