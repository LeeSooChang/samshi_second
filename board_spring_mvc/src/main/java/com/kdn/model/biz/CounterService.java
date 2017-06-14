package com.kdn.model.biz;

import com.kdn.model.domain.Counter;

public interface CounterService {
	public void update(Counter counter);
	public Counter search(String date);
	public void add(Counter counter);
}
