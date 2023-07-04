package com.project.fin.review.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.fin.common.model.vo.PageInfo;
import com.project.fin.common.template.Pagination;
import com.project.fin.orders.model.service.OrdersService;
import com.project.fin.orders.model.vo.Orders;
import com.project.fin.review.service.ReviewService;
import com.project.fin.review.vo.Review;

@SuppressWarnings("unused")
@Controller
@RequestMapping("/review")
@SessionAttributes({"userName"})


public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrdersService ordersService;
	
	
	
	@GetMapping("/memberOrderHistory.me")
	public String memberOrderHistory(Model model) {
		List<Orders> ordersList = ordersService.selectOrdersList();
		model.addAttribute("ordersList", ordersList);
		return "review/memberOrderHistory";
	}
	
	@GetMapping("reviewHistory.me")
	public void reviewHistory (@RequestParam(defaultValue="1") int nowPage, Model model ) {
		int totalRecord = reviewService.selectTotalRecord();
		
		int limit = 2;
		int offset = (nowPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);
		List<Review> reviewList = reviewService.selectReviewList(rowBounds);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pi", pi);
	}
	
	@GetMapping("/review.me")
	  public String showReviewForm(@RequestParam("orderNo")int orderNo, Model model) {
	    // orderNo를 활용하여 리뷰 작성 폼을 구성하고 모델에 필요한 데이터를 추가하는 로직을 작성합니다.
	    // 예시로 모델에 orderNo를 추가해보겠습니다.
	    model.addAttribute("orderNo", orderNo);
	    
	    // 리뷰 작성 폼을 표시하는 JSP 페이지로 이동합니다.
	    return "review/reviewFrm";
	  }
	
	 @PostMapping("/review.me")
	  public String submitReview(Review review, @RequestParam("orderNo") int orderNo) {
	    // 리뷰 작성 폼에서 제출된 리뷰 내용을 처리하는 로직을 작성합니다.
	    // 예시로 모델에 orderNo와 reviewText를 추가해보겠습니다.
		 
		
	    int result = reviewService.insertReview(review);
	    // 리뷰 작성 결과를 표시하는 JSP 페이지로 이동합니다.
	    return "redirect:/";
	  }
}
