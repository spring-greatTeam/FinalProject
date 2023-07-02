package com.project.fin.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.fin.review.service.ReviewService;
import com.project.fin.review.vo.Review;

@Controller
@RequestMapping("/review")
@SessionAttributes({"userName"})


public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("reviewHistory.me")
	public void reviewHistory (Model model) {
		List<Review> reviewList = reviewService.selectReviewList();
		
		model.addAttribute("reviewList", reviewList);
	}
}
