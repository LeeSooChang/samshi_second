package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.FileBean;
import com.kdn.model.domain.PageBean;

public interface BoardDao {
	public void 	add(Board board) 	;
	public void 	update(Board board) ;
	public void 	remove(int no) 		;
	public Board 	search(int no) 		;
	public List<Board> searchAll(PageBean bean) ;
	public int 		getCount(PageBean bean) ;
	public int 		getBoardNo() 			;
	public void 	addFiles(List<FileBean> files, int bno) ;
	public void 	removeFiles(int bno) ;
}





