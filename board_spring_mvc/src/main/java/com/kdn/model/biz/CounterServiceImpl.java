package com.kdn.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Counter;
import com.kdn.model.domain.UpdateException;

@Service("counterService")
public class CounterServiceImpl implements CounterService {
	@Autowired
	@Qualifier("counterDao")
	private CounterDao dao;
	
	@Override
	public void update(Counter counter) {
		// TODO Auto-generated method stub
		try{
			dao.update(counter);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("counter 업데이트 중 에러");
		}
	}

	@Override
	public Counter search(String date) {
		try{
			return dao.search(date);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("counter 찾기 중 에러");
		}
	}

	@Override
	public void add(Counter counter) {
		try{
			dao.add(counter);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("counter 추가 중 에러");
		}
	}

}
