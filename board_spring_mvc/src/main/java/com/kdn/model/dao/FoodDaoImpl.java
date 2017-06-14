package com.kdn.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.FoodDao;
import com.kdn.model.domain.Board;
import com.kdn.model.domain.Food;
import com.kdn.model.domain.PageBean;

@Repository("foodDao")
public class FoodDaoImpl implements FoodDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void add(Food food) {
		// TODO Auto-generated method stub
		session.insert("food.insert", food);
	}

	@Override
	public void update(Food food) {
		// TODO Auto-generated method stub
		session.update("food.update", food);
	}

	@Override
	public void remove(int fno) {
		// TODO Auto-generated method stub
		session.delete("food.delete", fno);
	}

	@Override
	public Food search(int fno) {
		// TODO Auto-generated method stub
		return session.selectOne("food.search", fno);
	}

	@Override
	public List<Food> searchAll(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart() - 1, bean.getInterval()); 
		return session.selectList("session.searchAll", bean, rows);
	}

	@Override
	public int getCount(PageBean bean) {
		// TODO Auto-generated method stub
		return session.selectOne("session.getCount", bean);
	}

	@Override
	public int getFoodNo() {
		// TODO Auto-generated method stub
		return session.selectOne("session.getFoodNo");
	}

}
