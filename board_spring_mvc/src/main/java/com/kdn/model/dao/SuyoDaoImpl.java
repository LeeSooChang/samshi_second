package com.kdn.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.SuyoDao;
import com.kdn.model.domain.Suyo;

@Repository("suyoDao")
public class SuyoDaoImpl implements SuyoDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public void add(Suyo suyo) {
		sql.insert("suyo.insert",suyo);
	}

	@Override
	public void minus(Suyo suyo) {
		sql.delete("suyo.delete", suyo);
	}

	@Override
	public int getSuyoCount(Suyo suyo) {
		return sql.selectOne("suyo.getSuyoCount", suyo);
	}
	
	@Override
	public List<Suyo> getSuyoCountAll() {
		return sql.selectList("suyo.getSuyoCountAll");
	}
	
	@Override
	public Suyo searchSuyo(Suyo suyo) {
		return sql.selectOne("suyo.searchSuyo", suyo);
	}

}
