package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Review;
import com.kdn.model.domain.ReviewPageBean;

public interface ReviewDao {
	public void 	add(Review review) 	;
	public void 	update(Review review) ;
	public void 	remove(int rno) 		;
	public Review 	search(int rno) 		;
	public List<Review> searchAll(ReviewPageBean bean) ;
	public int 		getCount(ReviewPageBean bean) ;
	public int 		getBoardNo() 			;
}





