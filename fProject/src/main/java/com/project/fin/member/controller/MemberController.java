package com.project.fin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.project.fin.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({"userName"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
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
// My Page
	@GetMapping("memberMyPage.me")
	public void memberMyPage() {}
	
	@GetMapping("memberUpdate.me")
	public void memberUpdate() {}
	
	@GetMapping("memberOrderHistory.me")
	public void memberOrderHistory() {}
	
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
	
	
}









