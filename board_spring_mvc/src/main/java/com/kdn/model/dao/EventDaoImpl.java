package com.kdn.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.EventDao;
import com.kdn.model.domain.Event;

@Repository("eventDao")
public class EventDaoImpl implements EventDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public void add(int mno) {
		// TODO Auto-generated method stub
		System.out.println("this is mno : " + mno);
		session.insert("event.insert", mno);
	}

	@Override
	public Event search(int mno) {
		// TODO Auto-generated method stub
		return session.selectOne("event.search", mno);
	}

}
