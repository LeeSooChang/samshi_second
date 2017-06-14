package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Ranking;

public interface RankingDao {
	public List<Ranking> searchN() ;
	public List<Ranking> searchM() ;
	public List<Ranking> searchH() ;
	public List<Ranking> searchI() ;
	

}





