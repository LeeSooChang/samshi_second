package com.kdn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Diet;
import com.kdn.model.domain.Food;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.UpdateException;
import com.kdn.util.PageUtility;

@Service("DietService")
public class DietSeviceImpl implements DietService {

	@Autowired
	@Qualifier("dietDao")
	private DietDao dao;
	
	@Override
	public void update(Diet diet) {
		try{
			dao.update(diet);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Update error"); 
		}
	}

	@Override
	public void remove(int dietNo) {
		try{
			dao.remove(dietNo);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Delete error"); 
		}
	}

	@Override
	public Diet search(String dietDate, int scode) {
		try{
			return dao.search(dietDate, scode);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Delete error"); 
		}
	}

	@Override
	public void add(Diet diet) {
		try{
			int dietNo = dao.getDietNo();
			diet.setDietNo(dietNo);
			dao.add(diet);
		}
		catch(Exception e){
			e.printStackTrace();
			throw new UpdateException("DB Add error");
		}
	}

	@Override
	public List<Diet> searchAll() {
		try{
		    return dao.search5Diet();
		} catch(Exception e){
			 e.printStackTrace();
	         throw new UpdateException("DB SearchAll error");
		}
	}

	@Override
	public List<Diet> searchPrefer(int mno) {
		try{
			return dao.searchPrefer(mno);	
		}catch(Exception e){
			 e.printStackTrace();
	         throw new UpdateException("DB SearchPrefer error");
		}
	}

	@Override
	public Diet searchDiet(int dietNo) {
		try{
			return dao.searchDiet(dietNo);
		}
		catch(Exception e){
			e.printStackTrace();
	         throw new UpdateException("DB SearchDiet error");
		}
	}

	
}
