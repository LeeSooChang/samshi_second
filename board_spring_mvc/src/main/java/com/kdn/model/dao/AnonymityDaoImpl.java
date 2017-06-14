package com.kdn.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.AnonymityDao;
import com.kdn.model.domain.Anonymity;
import com.kdn.model.domain.AnonymityPageBean;
@Repository("anonymityDao")
public class AnonymityDaoImpl implements AnonymityDao {

	@Autowired
	private SqlSessionTemplate session;
	@Override
	public void add(Anonymity anonymity) {
		// TODO Auto-generated method stub
		session.selectOne("anonymity.insert", anonymity);

	}

	@Override
	public void update(Anonymity anonymity) {
		// TODO Auto-generated method stub
		session.selectOne("anonymity.update", anonymity);

	}

	@Override
	public void remove(Anonymity anonymity) {
		// TODO Auto-generated method stub
		session.selectOne("anonymity.delete", anonymity);

	}

	@Override
	public Anonymity search(int ano) {
		// TODO Auto-generated method stub
		return session.selectOne("anonymoty.search", ano);
	}

	@Override
	public List<Anonymity> searchAll(AnonymityPageBean bean) {
		// TODO Auto-generated method stub
		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("anonymity.searchAll", bean, rows);
	}

	@Override
	public int getCount(AnonymityPageBean bean) {
		// TODO Auto-generated method stub
		return session.selectOne("anonymity.getCount", bean);
	}

	@Override
	public int getBoardNo() {
		// TODO Auto-generated method stub
		return session.selectOne("anonymity.getAnonymityNo");
	}

}
