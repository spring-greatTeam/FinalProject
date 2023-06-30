package com.project.fin.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fin.store.model.service.StoreService;
import com.project.fin.store.model.vo.Menu;
import com.project.fin.store.model.vo.MenuGroup;
import com.project.fin.store.model.vo.Options;
import com.project.fin.store.model.vo.Store;

@Controller
@RequestMapping("/store")
//@SessionAttributes({"menu"})
public class StoreController {

	@Autowired
	private StoreService storeservice;
	
	/*
	 * @GetMapping("/storeList.me") public String storeList(int category, Model
	 * model) { model.addAttribute("categoryNo",category); return
	 * "redirect:/store/storeList"; }
	 *
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
	
		
		//매장번호로 매장정보 찾기
		// 매장 번호로 해당 매장 메뉴 찾기.
		Store store = storeservice.selectOneStore(storeNo);
		List<Menu> menu = storeservice.selectMenuList(storeNo);
	
//		Menu menu = storeservice.selectMenuList2(storeNo);
		List<MenuGroup> group = storeservice.selectgroupList(storeNo);
		
		Menu menu2 = new Menu();
		int num = menu2.getMenuNo();
		num = storeNo;
		
		/*
		 * System.out.println( menu); System.out.println(group);
		 */
		model.addAttribute("store", store);
		model.addAttribute("menuList", menu);
		model.addAttribute("groupList", group);
		return "store/storeDetail";
	}
	/*
	 * @GetMapping("test.me") public String test(@RequestParam("menu2") String
	 * menuNo, Model model) { System.out.println(menuNo); ArrayList<Options>
	 * optionList = storeservice.selectOption(menuNo);
	 * 
	 * System.out.println(optionList); model.addAttribute("optionList", optionList);
	 * return "jsonView"; }
	 
//	@GetMapping("/test.me")
//	public String test (int menuNo, HttpServletRequest request) {
//		Menu menuName = storeservice.selectOneMenu(menuNo);
//		String referer = request.getHeader("Referer");
//	    return "redirect:" + referer;
//	}
	
	/*
	 * @RequestMapping("test.me") public List<Options> optionList (@PathVariable int
	 * menu2){ List<Options> option = storeservice.selectOpTest(menu2);
	 * 
	 * System.out.println(menu2); return option; }
	 */
	/*
	 * @GetMapping(value = "test.me", produces = "application/json")
	 * 
	 * @ResponseBody public List<Options> test2(@RequestParam("menu2") String
	 * menuNo, Model model) { System.out.println(menuNo); List<Options> optionList =
	 * storeservice.selectOption(menuNo); System.out.println(optionList);
	 * model.addAttribute("optionList", optionList); return optionList; }
	 */

	@GetMapping("test.me")
	public String test(@RequestParam("menuNo") String menuNo, Model model) {
		  // 전달된 menu2 값에 대한 처리 로직
		  // model 객체를 사용하여 데이터를 jsp로 전달
		 List<Options> optionList = storeservice.selectOption(menuNo);
		 model.addAttribute("optionList", optionList);
		 System.out.println(optionList);
		  return "storeList"; 
		}
}

