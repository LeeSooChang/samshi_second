package com.kdn.model.biz;

import com.kdn.model.domain.Event;

public interface EventService {
	public void add(int mno);
	public Event search(int mno);
}
