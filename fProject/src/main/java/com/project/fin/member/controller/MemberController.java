package com.project.fin.member.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.fin.member.model.service.MemberService;
import com.project.fin.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/login.me")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login.me")
	public String login(String memberId, String memberPwd, Model model, RedirectAttributes redirectAttr) { 
		System.out.println("memberId=" + memberId);
		System.out.println("memberPwd=" + memberPwd);
		
		Member member = memberService.selectOneMember(memberId); //한 회원의 값만 가져와 로그인
		System.out.println("member =" + member);
		
		// 비밀번호 인증 (아이디 인증은 위에서 아이디가 있으면 들어오고 그런 아이디가 없으면 아예 안 들어옴)
		if(member != null) { 
						//암호화된 비밀번호와 매칭을 시키는 것이기 때문에 DB에 비암호화 비번은 로그인 하지 못함
			model.addAttribute("loginMember", member); //requestScope => sessionScope로 어노테이션 써서 변경(어디서든 사용가능해짐)
			//member Bean에 들어있는 값들을 loginMember session에 담음
		} else {
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다");
		}
		return "redirect:/";
	}
	
	@GetMapping("memberEnroll.me")
	public void memberEnroll() {}
	
	@PostMapping("/memberEnroll.me")
	public String memberEnroll(@RequestParam String detailAddress, Member member, RedirectAttributes redirectAttr) {
		member.setAddress(member.getAddress() + detailAddress);
		int result = memberService.insertMember(member);
		
		//비번 암호화 2단계에서 구현할 수 있음 해라
		
		//alert창 더 구현해야함!!! (Model이 어떨 때 쓰이는가,,,)
		if(result > 0 ) { 
			redirectAttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
			return "member/login";
		} else {
			redirectAttr.addFlashAttribute("msg", "회원가입에 실패하였습니다.");
			return "redirect:/";
		}
	};
	
	@GetMapping("/checkId.do")
	public String checkId(@RequestParam String memberId, Model model) {
		Member member = memberService.selectOneMember(memberId);
		boolean available = member == null;
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("available", available);
		
		return "jsonView";
	}

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

	
}









