package com.kdn.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.CounterDao;
import com.kdn.model.domain.Board;
import com.kdn.model.domain.Counter;

@Repository("counterDao")
public class CounterDaoImpl implements CounterDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public void add(Counter counter) {
		session.insert("counter.insert", counter);
	}

	@Override
	public void update(Counter counter) {
		session.update("counter.update", counter);
	}

	@Override
	public Counter search(String date) {
		return session.selectOne("counter.search", date);
	}

}
