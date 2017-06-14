package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.Counter;


public interface CounterDao {
	public void 	add(Counter counter);
	public void 	update(Counter counter) ;
	public Counter	search(String date) ;
}
