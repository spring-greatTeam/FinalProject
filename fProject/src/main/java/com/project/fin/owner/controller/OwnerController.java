package com.project.fin.owner.controller;

import java.util.List;

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

import com.project.fin.owner.model.service.OwnerService;
import com.project.fin.owner.model.vo.Owner;
import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Store;

@Controller
@RequestMapping("/owner")
@SessionAttributes({"userId","loginOwner"})

public class OwnerController {
		
	
	@Autowired 
	private OwnerService ownerService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	 
	//------------------------------- 새로운 가게 등록---------------------------------
	
	@GetMapping("/storeEnroll.me")
	public void storeEnroll() {}
	
	
	 @PostMapping("/storeEnroll.me") 
	 public String storeEnroll(Store store) {
		 int result=ownerService.insertStore(store);
		 return "redirect:/"; 
		 }
	 
	//------------------------------- 새로운 메뉴 카테고리 등록---------------------------------

	/*
	 * @GetMapping("/menuGroupForm.me") public String menuGroupForm() { return
	 * "owner/menuGroupForm"; }
	 * 
	 * @GetMapping("/menuGroupSubmit.me") public String menuGroupSubmit(MenuGroup
	 * menuGroup,int storeNo,Model model) { int
	 * result=ownerService.insertMenuGroup(menuGroup);
	 * 
	 * return"redirect:/"; }
	 */
		 
	 //------------------------------- 새로운 메뉴 등록---------------------------------
		/*
		 * @GetMapping("/menuForm.me") public String menuForm() { return
		 * "owner/menuForm"; }
		 * 
		 * @GetMapping("/menuFormSubmit.me") public String menuFormSubmit(Menu menu) {
		 * int result=ownerService.insertMenu(menu); return "redirect:/"; }
		 */
	//------------------------------- 새로운 메뉴(카테고리와 통합) 등록---------------------------------
	 @GetMapping("/menuEnroll.me")
	 public String menuEnroll() {
		 return "owner/menuEnroll";
	 }
	 
	 @GetMapping("/menuGroupSubmit.me")
	 public String menuGroupSubmit(MenuGroup menuGroup) {
		 int result=ownerService.insertMenuGroup(menuGroup);
		 return "owner/menuForm";
	 }
	 
	 @GetMapping("/menuFormSubmit.me")
	 public String menuFormSubmit(Menu menu) {
		 int result=ownerService.insertMenu(menu);
		 return "redirect:/";
	 }
	 //-----------------------------------------------------------------------------------
	 
	 @GetMapping("ownerEnroll.me")
		public void ownerEnroll() {}
		
		@PostMapping("/ownerEnroll.me")
		public String ownerEnroll(@RequestParam String detailAddress, Owner owner, Model model) {
			owner.setAddress(owner.getAddress() + " " + detailAddress); //주소 + 상세주소
			
			//비번 암호화
			String orgPwd = owner.getOwnerPwd();
			String encPwd = passwordEncoder.encode(orgPwd);
			owner.setOwnerPwd(encPwd);
			System.out.println("ecnPwd=" + owner);
			
			int result = ownerService.insertOwner(owner);
			
			if(result > 0 ) { 
				model.addAttribute("msg", "회원가입이 완료되었습니다.");
				return "owner/ownerLogin";
			} else {
				model.addAttribute("msg", "회원가입에 실패하였습니다.");
				return "redirect:/";
			}
		}
		
		@GetMapping("/ownerLogin.me")
		public String login() {
			return "owner/ownerLogin";
		}
		
		@PostMapping("/ownerLogin.me")
		public String login(String ownerId, String ownerPwd, Model model, HttpSession session, RedirectAttributes redirectAttr) { 
			System.out.println("ownerId=" + ownerId);
			System.out.println("ownerPwd=" + ownerPwd);

			Owner owner = ownerService.selectOneOwner(ownerId); //한 회원의 값만 가져와 로그인
			
			// 비밀번호 인증 (아이디 인증은 위에서 아이디가 있으면 들어오고 그런 아이디가 없으면 아예 안 들어옴)
			if(owner != null  && passwordEncoder.matches(ownerPwd, owner.getOwnerPwd())) { 
				
				String userId = owner.getOwnerId();
				session.setAttribute("userId", userId);
				
				//암호화된 비밀번호와 매칭을 시키는 것이기 때문에 DB에 비암호화 비번은 로그인 하지 못함
				model.addAttribute("loginOwner", owner); //requestScope => sessionScope로 어노테이션 써서 변경(어디서든 사용가능해짐)
				//member Bean에 들어있는 값들을 loginMember session에 담음
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다");
				return "owner/ownerLogin";
			}
			return "redirect:/";
		}
		
		@GetMapping("/checkId.do")
		public String checkId(@RequestParam String ownerId, Model model) {
			Owner owner = ownerService.selectOneOwner(ownerId);
			boolean available = owner == null;
			
			model.addAttribute("ownerId", ownerId);
			model.addAttribute("available", available);
			
			return "jsonView";
		}

		@GetMapping("/ownerFind.me")
		public void ownerFind() {};

		@GetMapping("/ownerLogout.me")
		public String memberLogout(SessionStatus status) {
			if(!status.isComplete())
				status.setComplete();
			
			return "redirect:/";
		}
	// My Page
		@GetMapping("ownerMyPage.me")
		public void ownerMyPage() {}
		
		@GetMapping("updatePwd.me")
		public void ownerPwdUdt() {}
		
		@GetMapping("ownerEnter.me")
		public void ownerEnter() {}
		
		@PostMapping("ownerEnter.me") 
		public String ownerEnter(@RequestParam String pwd, Owner owner, Model model) { 
			
			owner = ownerService.selectOneOwner(owner.getOwnerId()); //비번이 암호화 돼있기 때문에 아이디를 비교해서 가져와야 함
			String encodedPwd = owner.getOwnerPwd(); //암호화된 비번 가져오기
			boolean pass = passwordEncoder.matches(pwd, encodedPwd); //입력한 비번 DB 비번 비교대조

			if(pass) { 
				return "owner/ownerInfo"; 
			} else {
				model.addAttribute("msg", "비밀번호가 올바르지 않습니다."); 
				return "owner/ownerEnter"; 
			}

		}

		@PostMapping("ownerInfo.me") 
		public String memberInfo(String ownerId, Model model) {
			model.addAttribute("loginOwner", ownerService.selectOneOwner(ownerId));
			
			return "owner/ownerEnter";
		}
		
		//--------------------------------- 회원정보 수정----------------------------------------
		
		@PostMapping("ownerUpdate.me")
		public String ownerUpdate(@RequestParam String detailAddress, Owner owner, Model model) {
			
			owner.setAddress(owner.getAddress() + " " + detailAddress); //주소 + 상세주소		
			
			int result = ownerService.updateOwner(owner);
			
			if(result > 0) {
				model.addAttribute("msg", "정보가 수정되었습니다.");
			} else {
				model.addAttribute("msg", "정보 수정을 실패했습니다.");
			}

			model.addAttribute("ownerId", owner.getOwnerId());
			return "redirect:/owner/ownerInfo.me?ownerId="+ owner.getOwnerId();
		}
		
		@PostMapping("updatePwd.me")
		public String updatePwd(Owner owner, Model model) {
			
			String orgPwd = owner.getOwnerPwd();
			String encPwd = passwordEncoder.encode(orgPwd);
			owner.setOwnerPwd(encPwd);
			
			int result = ownerService.updatePwd(owner);
			
			
			if(result > 0) {
				model.addAttribute("msg", "비밀번호가 수정되었습니다.");
			} else {
				model.addAttribute("msg", "비밀번호 수정을 실패했습니다.");
			} 
			
			return "owner/ownerInfo";
		}
		
		@GetMapping("ownerDelete.me")
		public void ownerDelete() {}

}
