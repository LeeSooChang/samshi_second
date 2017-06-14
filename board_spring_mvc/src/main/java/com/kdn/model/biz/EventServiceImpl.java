package com.kdn.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Event;
import com.kdn.model.domain.UpdateException;

@Service("eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	@Qualifier("eventDao")
	private EventDao dao;
	
	@Override
	public void add(int mno) {
		// TODO Auto-generated method stub
		try{
			dao.add(mno);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("Event add Error");
		}
	}

	@Override
	public Event search(int mno) {
		// TODO Auto-generated method stub
		try{
			return dao.search(mno);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("Event search Error");
		}
	}

}
