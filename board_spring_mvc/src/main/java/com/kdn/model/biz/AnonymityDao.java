package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Anonymity;
import com.kdn.model.domain.AnonymityPageBean;


public interface AnonymityDao {
	public void add(Anonymity anonymity);
	public void update(Anonymity anonymity);
	public void remove(Anonymity anonymity);
	public Anonymity search(int ano);
	public List<Anonymity> searchAll(AnonymityPageBean bean);
	public int getCount(AnonymityPageBean bean);
	public int getBoardNo();
}





