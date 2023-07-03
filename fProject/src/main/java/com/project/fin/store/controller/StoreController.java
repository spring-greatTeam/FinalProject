package com.project.fin.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.fin.store.model.service.StoreService;
import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Options;
import com.project.fin.store.model.vo.Store;
@SessionAttributes({"cartList", "loginMember"})
@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreService storeservice;
	
	
	@GetMapping("/storeList.me")
	public String storeList(int category, Model model) {
		
		List<Store> storeList = storeservice.selectStoreList();
		model.addAttribute("category", category);
		model.addAttribute("storeList",storeList);
		
		return "store/storeList";
	}
	
	@GetMapping("/storeDetail.me")
	public String storeDetail(int storeNo, Model model) {
	
		//매장번호로 매장정보 찾기
		// 매장 번호로 해당 매장 메뉴 찾기.
		Store store = storeservice.selectOneStore(storeNo);
		List<Menu> menu = storeservice.selectMenuList(storeNo);
		List<MenuGroup> group = storeservice.selectgroupList(storeNo);
		
		model.addAttribute("store", store);
		model.addAttribute("menuList", menu);
		model.addAttribute("groupList", group);
		return "store/storeDetail";
	}
	@GetMapping("/test.me")
	public String test(@RequestParam(name = "menuNo") int menuNo, Model model) {
		  // model로 json으로 값 넘겨서 modal에 사용
		 List<Options> optionList = storeservice.selectOption(menuNo);
		 model.addAttribute("optionList", optionList);
		 return "storeList"; 
		}
		  
		 
}

