package com.kdn.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.DietDao;
import com.kdn.model.domain.Board;
import com.kdn.model.domain.Diet;

@Repository("dietDao")
public class DietDaoImpl implements DietDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public void add(Diet diet) {
		// TODO Auto-generated method stub
		session.insert("diet.add", diet);
	}

	@Override
	public void update(Diet diet) {
		// TODO Auto-generated method stub
		session.update("diet.update", diet);
	}

	@Override
	public void remove(int dietNo) {
		// TODO Auto-generated method stub
		session.delete("diet.delete", dietNo);
	}

	@Override
	public List<Diet> search5Diet() {
		// TODO Auto-generated method stub 
		return session.selectList("diet.search5Diet");
	}

	
	@Override
	public List<Diet> searchPrefer(int mno) {
		return session.selectList("diet.searchPrefer", mno);
	}

	@Override
	public int getDietNo() {
		// TODO Auto-generated method stub
		return session.selectOne("diet.getDietNo");
	}

	@Override
	public Diet search(String dietDate, int scode) {
		// TODO Auto-generated method stub
		HashMap<String, String> test = new HashMap<String, String>();
		test.put("dietDate", dietDate);
		test.put("scode", String.format("%d", scode));
		return session.selectOne("diet.search", test);
	}

	@Override
	public Diet searchDiet(int dietNo) {
		return session.selectOne("diet.searchDiet", dietNo);
	}

}
