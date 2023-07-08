package com.project.fin.member.controller;

import javax.servlet.http.HttpSession;

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
@SessionAttributes({"userId", "loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("memberEnroll.me")
	public void memberEnroll() {}
	
	@PostMapping("/memberEnroll.me")
	public String memberEnroll(@RequestParam String detailAddress, Member member, Model model) {
		member.setAddress(member.getAddress() + " " + detailAddress); //주소 + 상세주소
		
		//비번 암호화
		String orgPwd = member.getMemberPwd();
		String encPwd = passwordEncoder.encode(orgPwd);
		member.setMemberPwd(encPwd);
		System.out.println("ecnPwd=" + member);
		
		int result = memberService.insertMember(member);
		
		if(result > 0 ) { 
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			return "member/login";
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@GetMapping("/login.me")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login.me")
	public String login(String memberId, String memberPwd, Model model, HttpSession session, RedirectAttributes redirectAttr) { 
		System.out.println("memberId=" + memberId);
		System.out.println("memberPwd=" + memberPwd);
		
		Member member = memberService.selectOneMember(memberId); //한 회원의 값만 가져와 로그인
		
		// 비밀번호 인증 (아이디 인증은 위에서 아이디가 있으면 들어오고 그런 아이디가 없으면 아예 안 들어옴)
		if(member != null  && passwordEncoder.matches(memberPwd, member.getMemberPwd())) { // 입력한 비밀번호(memberPwd)와 저장된 암호화된 비밀번호(member.getMemberPwd())를 비교합니다. 
			
			String userId = member.getMemberId();
			session.setAttribute("userId", userId);
			
			//암호화된 비밀번호와 매칭을 시키는 것이기 때문에 DB에 비암호화 비번은 로그인 하지 못함
			model.addAttribute("loginMember", member); //requestScope => sessionScope로 어노테이션 써서 변경(어디서든 사용가능해짐)
			//member Bean에 들어있는 값들을 loginMember session에 담음
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다");
			return "member/login";
		}
		return "redirect:/";
	}
	
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
	
	@GetMapping("updatePwd.me")
	public void memberPwdUdt() {}
	
	@GetMapping("memberEnter.me")
	public void memberEnter() {}
	
	@PostMapping("memberEnter.me") 
	public String memberEnter(@RequestParam String pwd, Member member, Model model) { 
		
		member = memberService.selectOneMember(member.getMemberId()); //비번이 암호화 돼있기 때문에 아이디를 비교해서 가져와야 함
		String encodedPwd = member.getMemberPwd(); //암호화된 비번 가져오기
		boolean pass = passwordEncoder.matches(pwd, encodedPwd); //입력한 비번 DB 비번 비교대조

		if(pass) { 
			return "member/memberInfo"; 
		} else {
			model.addAttribute("msg", "비밀번호가 올바르지 않습니다."); 
			return "member/memberEnter"; 
		}

	}

	@PostMapping("memberInfo.me") 
	public String memberInfo(String memberId, Model model) {
		model.addAttribute("loginMember", memberService.selectOneMember(memberId));
		
		return "member/memberEnter";
	}
	
	//--------------------------------- 회원정보 수정----------------------------------------
	
	@PostMapping("memberUpdate.me")
	public String memberUpdate(@RequestParam String detailAddress, Member member, Model model) {
		
		member.setAddress(member.getAddress() + " " + detailAddress); //주소 + 상세주소		
		
		int result = memberService.updateMember(member);
		
		if(result > 0) {
			model.addAttribute("msg", "정보가 수정되었습니다.");
		} else {
			model.addAttribute("msg", "정보 수정을 실패했습니다.");
		}

		model.addAttribute("memberId", member.getMemberId());
		return "redirect:/member/memberInfo.me?memberId="+ member.getMemberId();
	}
	
	@PostMapping("updatePwd.me")
	public String updatePwd(Member member, Model model) {
		
		String orgPwd = member.getMemberPwd();
		String encPwd = passwordEncoder.encode(orgPwd);
		member.setMemberPwd(encPwd);
		
		int result = memberService.updatePwd(member);
		
		
		if(result > 0) {
			model.addAttribute("msg", "비밀번호가 수정되었습니다.");
		} else {
			model.addAttribute("msg", "비밀번호 수정을 실패했습니다.");
		} 
		
		return "member/memberInfo";
	}
	
	@GetMapping("memberDelete.me")
	public void memberDelete() {}

	
}









