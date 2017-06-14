package com.kdn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Suyo;
import com.kdn.model.domain.UpdateException;

@Service("suyoService")
public class SuyoServiceImpl implements SuyoService {

	@Autowired
	@Qualifier("suyoDao")
	private SuyoDao dao;
	
	@Override
	public void add(Suyo suyo) {
		Suyo findsuyo = dao.searchSuyo(suyo);
		try {
			if(findsuyo != null){
				System.out.println("이미 등록 했습니다.");
			}else{
				dao.add(suyo);
			}
		} catch (Exception e) {
			e.printStackTrace();
	        throw new UpdateException("수요 수 증가 중 오류 발생");
		}
	}

	@Override
	public void minus(Suyo suyo) {
		Suyo findsuyo = dao.searchSuyo(suyo);
		try {
			if(findsuyo != null){
				dao.minus(suyo);
			}else{
				System.out.println("추가해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
	        throw new UpdateException("수요 수 감소 중 오류 발생");
		}
	}
	
	@Override
	public Suyo searchSuyo(Suyo suyo){
		Suyo findsuyo = dao.searchSuyo(suyo);
		try {
			if(findsuyo != null){
				return findsuyo;
			}else{
				System.out.println("결과가 없습니다.");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
	        throw new UpdateException("수요 수 감소 중 오류 발생");
		}
	}

	@Override
	public int getSuyoCount(Suyo suyo) {
		try {
			return dao.getSuyoCount(suyo);
		} catch (Exception e) {
			e.printStackTrace();
	        throw new UpdateException("수요 수 조사 중 오류 발생");
		}
	}
	
	@Override
	public List<Suyo> getSuyoCountAll() {
		try {
			return dao.getSuyoCountAll();
		} catch (Exception e) {
			e.printStackTrace();
	        throw new UpdateException("모든 수요 수 조사 중 오류 발생");
		}
	}

}
