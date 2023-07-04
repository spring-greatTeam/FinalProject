package com.project.fin.owner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fin.owner.model.service.OwnerService;

@Controller
@RequestMapping("/owner")
public class OwnerController {
		
	@GetMapping("/ownerEnroll.me")
	public String ownerEnroll() {
		return "owner/ownerEnroll";
	}
}
