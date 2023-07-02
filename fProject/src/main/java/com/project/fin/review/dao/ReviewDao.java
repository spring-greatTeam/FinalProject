package com.project.fin.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.review.vo.Review;


@Mapper
public interface ReviewDao {

	int insertReview(Review review);

}
