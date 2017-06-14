package com.kdn.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.RankingDao;
import com.kdn.model.domain.Ranking;
import com.kdn.model.domain.RankingPageBean;
@Repository("rankingDao")
public class RankingDaoImpl implements RankingDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Ranking> searchN() {
		
		return session.selectList("ranking.searchN");
	}

	@Override
	public List<Ranking> searchM() {
		return session.selectList("ranking.searchM");
	}

	@Override
	public List<Ranking> searchH() {
		return session.selectList("ranking.searchH");
	}

	@Override
	public List<Ranking> searchI() {
		return session.selectList("ranking.searchI");
	}


}
