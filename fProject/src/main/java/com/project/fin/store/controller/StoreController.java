package com.project.fin.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fin.store.model.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreService storeservice;
	
	
	  @GetMapping("/storeList.me") public String storeList(int category, Model model) { 
		  model.addAttribute("categoryNo",category); 
		  return "redirect:/store/storeList"; 
		  }
	
}
