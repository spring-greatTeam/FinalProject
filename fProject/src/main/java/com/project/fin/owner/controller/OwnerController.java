package com.project.fin.owner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fin.owner.model.service.OwnerService;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Store;

@Controller
@RequestMapping("/owner")
public class OwnerController {
		
	
	@Autowired 
	private OwnerService ownerService;
	 
	
	@GetMapping("/storeEnroll.me")
	public void storeEnroll() {}
	
	
	 @PostMapping("/storeEnroll.me") 
	 public String storeEnroll(Store store) {
		 int result=ownerService.insertStore(store);
		 return "redirect:/"; 
		 }
	 
	 @GetMapping("/menuGroupForm.me")
	 public String menuGroupForm() {
		 return "owner/menuGroupForm";
	 }
	 
	 @GetMapping("/menuGroupSubmit.me")
	 public String menuGroupSubmit(MenuGroup menuGroup) {
		 int result=ownerService.insertMenuGroup(menuGroup);
		 return"redirect:/";
	 }
}
