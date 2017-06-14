package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Review;
import com.kdn.model.domain.ReviewPageBean;

public interface ReviewService {
	public void update(Review review);
	public void remove(int rno);
	public Review search(int rno);
	public void add(Review review);
	public List<Review> searchAll(ReviewPageBean bean);

}