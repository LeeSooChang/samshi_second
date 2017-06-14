package com.kdn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Anonymity;
import com.kdn.model.domain.AnonymityPageBean;
import com.kdn.model.domain.UpdateException;
import com.kdn.util.AnonymityPageUtility;
@Service("anonymityService")
public class AnonymityServiceImpl implements AnonymityService {

	@Autowired
	@Qualifier("anonymityDao")
	private AnonymityDao dao;
	
	@Override
	public void update(Anonymity anonymity) {
		try {
			dao.update(anonymity);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ano update error");
		}

	}

	@Override
	public void remove(Anonymity anonymity) {
		try {
			dao.remove(anonymity);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ano remove error");
		}

	}

	@Override
	public Anonymity search(int ano) {
		try {
			dao.search(ano);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ano search error");
		}
		return null;
	}

	@Override
	public void add(Anonymity anonymity) {
		try {
			dao.add(anonymity);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ano add error");
		}

	}

	@Override
	public List<Anonymity> searchAll(AnonymityPageBean bean) {
		try {
			int total = dao.getCount(bean);
			AnonymityPageUtility bar = new AnonymityPageUtility(bean.getInterval(), total, bean.getPageNo(), "/images");
			bean.setPagelink(bar.getPageBar());
			
			return dao.searchAll(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("ano searchAll error");
		}
	}

}
