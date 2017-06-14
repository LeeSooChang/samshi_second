package com.kdn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Ranking;
import com.kdn.model.domain.UpdateException;

@Service("rankingService")
public class RankingServiceImpl implements RankingService {

	@Autowired
	@Qualifier("rankingDao")
	private RankingDao dao;

	@Override
	public List<Ranking> searchN() {
		try {
			return dao.searchN();
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ranking searchAll error");
		}

	}

	@Override
	public List<Ranking> searchM() {
		try {
			return dao.searchM();
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ranking searchM error");
		}
	}

	@Override
	public List<Ranking> searchH() {
		try {
			return dao.searchH();
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ranking searchM error");
		}
	}

	@Override
	public List<Ranking> searchI() {
		try {
			return dao.searchI();
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ranking searchM error");
		}
	}

}
