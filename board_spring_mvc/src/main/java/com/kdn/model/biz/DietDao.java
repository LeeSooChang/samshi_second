package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.Diet;
import com.kdn.model.domain.FileBean;

public interface DietDao {
	public void 	add(Diet diet) 	;
	public void 	update(Diet diet) ;
	public void 	remove(int dietNo) ;
	public List<Diet> 	search5Diet() ;
	public List<Diet>	searchPrefer(int mno);
	public Diet 	search(String dietDate, int scode) ;
	public Diet 	searchDiet(int dietNo) ;
	public int 		getDietNo() ;
	/*public void 	addFiles(List<FileBean> files, int dietNo) ;
	public void 	removeFiles(int bno) ;*/
}
