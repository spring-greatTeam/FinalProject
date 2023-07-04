package com.project.fin.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.fin.cart.model.service.CartService;
import com.project.fin.cart.model.vo.Cart;
import com.project.fin.cart.model.vo.CartList;

@Controller
@SessionAttributes({"cartList", "userId", "loginMember"})
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartservice;
	
	// 장바구니 목록에 추가
	@PostMapping("cart.me")
	public String insertCart(Cart cart,String oprbtn, RedirectAttributes redirectAttributes,HttpSession session) {
		String memberId =(String) session.getAttribute("userId");
		int storeNo = cart.getStoreNo();
			System.out.println(oprbtn);
			// 1. 장바구니 여부 (없으면 새로 생성)
			//1-1 가져와서 없으면 새로 만들기
		List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");	//카트 목록 가져오기
			if (cartList == null) {	//카트목록 없으면
				cartList = new ArrayList<>();
			    session.setAttribute("cartList", cartList);
				System.out.println(cartList);
			}else{//1-2 카트에 있을시
				List<Cart> nowCart = cartList;
				// 중복확인
				if (nowCart.contains(cart)) {
					// 기존 수량
					int index = nowCart.indexOf(cart);	//중복된 객체 찾기
					Cart getcart = nowCart.get(index); //객체 가져오기
					System.out.println(getcart);
					int newQuantity = getcart.getQuantity() + cart.getQuantity();
					getcart.setQuantity(newQuantity);
					int nowCartNo = getcart.getStoreNo();
					redirectAttributes.addFlashAttribute("successMessage",
							  "장바구니에 상품이 성공적으로 담겼습니다.");
					
			}else {
				
				if (!nowCart.isEmpty() && nowCart.get(0).getStoreNo() != cart.getStoreNo()) {
			        // 기존 장바구니에 있는 상품의 매장 번호와 추가하려는 상품의 매장 번호가 다른 경우
			        redirectAttributes.addFlashAttribute("successMessage", "하나의 매장에서만 주문이 가능합니다.");
			        return "redirect:/store/storeDetail.me?storeNo=" + storeNo;
				}
				nowCart.add(cart);
				redirectAttributes.addFlashAttribute("successMessage",
						  "장바구니에 상품이 성공적으로 담겼습니다.");
		}
				session.setAttribute("cartList", cartList);
				System.out.println(cartList);
			}
				return "redirect:/store/storeDetail.me?storeNo=" + storeNo;
	}
	
	// 장바구니 클릭시 리스트 - 로그인 아이디 없으면 장바구니 생성
	@GetMapping("/cart.me")
	public String cartList(Model model, HttpSession session) {
		String memberId = (String) session.getAttribute("userId");
		if(memberId.equals("") || memberId == null) {
			
		}
	/*	else {
			ArrayList<Cart> cartList = cartservice.selectCatList(memberId);
			if(cartList == null || cartList.isEmpty()) {
				session.setAttribute("cartList", cartList);
				return "cart/cart";
			}
		}
		return "cart/cart";
	}*/
		return "/cart/cart";
	}
}
