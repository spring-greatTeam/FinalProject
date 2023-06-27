package com.project.fin.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fin.store.model.service.StoreService;
import com.project.fin.store.model.vo.Store;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreService storeservice;
	
	/*
	 * @GetMapping("/storeList.me") public String storeList(int category, Model
	 * model) { model.addAttribute("categoryNo",category); return
	 * "redirect:/store/storeList"; }
	 */
	@GetMapping("/storeList.me")
	public String storeList(int category, Model model) {
		
		List<Store> storeList = storeservice.selectStoreList();
		
		model.addAttribute("category", category);
		model.addAttribute("storeList",storeList);
		
		return "store/storeList";
	}
	
	@GetMapping("/storeDetail.me")
	public String storeDetail(int storeNo, Model model) {
		
		Store store = storeservice.selectOneStore(storeNo);
		model.addAttribute("store", store);
		return "store/storeDetail";
	}
}
