package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Diet;
import com.kdn.model.domain.PageBean;

public interface DietService {
	public void add(Diet diet);
	public void update(Diet diet);
	public void remove(int dietNo);
	public Diet search(String dietDate, int scode);
	public Diet searchDiet(int dietNo);
	public List<Diet> searchAll();
	public List<Diet> searchPrefer(int mno);
}
