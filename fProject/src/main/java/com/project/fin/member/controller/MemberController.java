package com.project.fin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.project.fin.member.model.service.MemberService;
import com.project.fin.orders.model.service.OrdersService;
import com.project.fin.orders.model.vo.Orders;
import com.project.fin.review.service.ReviewService;
import com.project.fin.review.vo.Review;

@Controller
@RequestMapping("/member")
@SessionAttributes({"userName"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/login.me")
	public void login() {};
	
	@GetMapping("/memberEnroll.me")
	public void memberEnroll() {};

	@GetMapping("/memberFind.me")
	public void memberFind() {};

	@GetMapping("/memberLogout.me")
	public String memberLogout(SessionStatus status) {
		if(!status.isComplete())
			status.setComplete();
		
		return "redirect:/";
	}
	
	@GetMapping("/memberOrderHistory.me")
	public String memberOrderHistory(Model model) {
		List<Orders> ordersList = ordersService.selectOrdersList();
		model.addAttribute("ordersList", ordersList);
		return "member/memberOrderHistory";
	}
// My Page
	@GetMapping("memberMyPage.me")
	public void memberMyPage() {}
	
	@GetMapping("memberUpdate.me")
	public void memberUpdate() {}
	
	
	@GetMapping("memberDelete.me")
	public void memberDelete() {}
	
	@GetMapping("question.me")
	public void question() {}
	
//	로그인 테스트용
	@GetMapping("/memberlogin.me")
	public String memberlogin(String id, Model model) {
		System.out.println(id);
		
		 model.addAttribute("userName", id);
		return "redirect:/";
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
	  public String submitReview(@RequestParam("orderNo") int orderNo, String userId, int rating, String content, Model model) {
	    // 리뷰 작성 폼에서 제출된 리뷰 내용을 처리하는 로직을 작성합니다.
	    // 예시로 모델에 orderNo와 reviewText를 추가해보겠습니다.
		 
		System.out.println(orderNo);
		List <Review> Review =  reviewService.insertReview();
		model.addAttribute("review", Review);
	    System.out.println("review" + Review);
	    
	    // 리뷰 작성 결과를 표시하는 JSP 페이지로 이동합니다.
	    return "redirect:/";
	  }
}









