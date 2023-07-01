package com.project.fin.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.fin.cart.model.service.CartService;
import com.project.fin.cart.model.vo.Cart;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartservice;
	
	@PostMapping("cart.me")
	public String insertCart(Cart cart,int storeNo, RedirectAttributes redirectAttributes) {
	       
			int result = cartservice.insertCart(cart);
	        
			if(result == 1) {
			redirectAttributes.addFlashAttribute("successMessage", "장바구니에 상품이 성공적으로 담겼습니다.");
			redirectAttributes.addFlashAttribute("redirectBack", true);
			} 
			return "redirect:/store/storeDetail.me?storeNo="+storeNo;
			
			
	}
}
