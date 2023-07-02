package com.project.fin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.review.dao.ReviewDao;
import com.project.fin.review.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;

	@Override
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return reviewDao.insertReview(review);
	}

	@Override
	public List<Review> selectReviewList() {
		// TODO Auto-generated method stub
		return reviewDao.selectReviewList();
	}


}
