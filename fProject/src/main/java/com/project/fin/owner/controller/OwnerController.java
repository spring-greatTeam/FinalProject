package com.project.fin.owner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fin.owner.model.service.OwnerService;
import com.project.fin.owner.model.vo.Owner;

@Controller
@RequestMapping("/owner")
public class OwnerController {
		
	@Autowired
	private OwnerService ownerService;
	
	@GetMapping("/ownerEnroll.me")
	public String ownerEnroll() {
		return "owner/ownerEnroll";
	}
	
	@PostMapping("/insertOwner.me")
	public String insertOwner(Owner owner) {
		
		int result=ownerService.insertOwner(owner);
		return "owner/ownerEnroll";
	}
}
