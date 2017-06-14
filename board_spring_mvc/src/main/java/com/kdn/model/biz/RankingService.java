package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Ranking;

public interface RankingService {
	public List<Ranking> searchM();
	public List<Ranking> searchH();
	public List<Ranking> searchI();
	public List<Ranking> searchN();

}