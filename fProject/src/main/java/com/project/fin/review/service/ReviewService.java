package com.project.fin.review.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.project.fin.review.vo.Review;


public interface ReviewService {

	int insertReview(Review review);

	List<Review> selectReviewList(RowBounds rowBounds);

	int selectTotalRecord();

	List<Review> selectReviewList();

}
