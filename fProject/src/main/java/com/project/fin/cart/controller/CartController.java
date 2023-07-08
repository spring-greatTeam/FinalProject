package com.project.fin.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.fin.cart.model.service.CartService;
import com.project.fin.cart.model.vo.Cart;

@Controller
@SessionAttributes({"cartList", "userId", "loginMember"})
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartservice;
	
	// 장바구니 목록에 추가
	// ID 없으면 이용불가
	// ID있으면 카트 목록 가져오고 없으면 insert
	// 목록 있으면 같은 제품 비교
	// 없으면 같은 매장 비교 후 insert
	@PostMapping("cart.me")
	public String insertCart(Cart cart, RedirectAttributes redirectAttributes,Model model) {
		int storeNo = cart.getStoreNo();
		String memberId = cart.getMemberId();
		
		if(memberId == null) {
			System.out.println("비어있음");
			
		}else {
			System.out.println(cart);
	        List<Cart> resultList =cartservice.cartList(memberId);
	        System.out.println(resultList);
	        if(resultList == null || resultList.isEmpty()) {
	        	cartservice.insertCart(cart);
	        	redirectAttributes.addFlashAttribute("successMessage", "상품이 장바구니에 추가되었습니다.");
	        }else {
	        	boolean cartExists = false;
	            for (Cart item : resultList) {
	            	if(item.equals(cart)) {
	            		int updatedQuantity = item.getQuantity() + cart.getQuantity();
	            		int num = cartservice.updateQuantity(updatedQuantity, item.getStoreNo(), cart.getMenuName(), cart.getOpTitle(), cart.getOpName());
	                    System.out.println(num);
	                    cartExists = true;
	                    
	                    redirectAttributes.addFlashAttribute("successMessage\", \"상품이 장바구니에 추가되었습니다.");
	                    break;
					} 
	            }
	            if (!cartExists) {
	            	if (cart.getStoreNo() != resultList.get(0).getStoreNo()) {
	                    redirectAttributes.addFlashAttribute("successMessage", "한 매장에서만 주문이 가능합니다.");
	                }else {
	                	
	                
	                cartservice.insertCart(cart);
	                redirectAttributes.addFlashAttribute("successMessage", "상품이 장바구니에 추가되었습니다.");
	                return "redirect:/store/storeDetail.me?storeNo=" + storeNo;
	                }
	            }
	        }
			
	    }
	    return "redirect:/store/storeDetail.me?storeNo=" + storeNo;
	}
	
	@GetMapping("cartList.me")
	public String cartList(HttpSession session, Model model) {
		
		String memberId =(String) session.getAttribute("userId");
		
		List<Cart>cartList = cartservice.cartList(memberId);
		
		model.addAttribute("CartList", cartList);
		System.out.println(cartList);
		return "cart/cartList";
	}
	
	@PostMapping("cartDelete.me")
	public String cartDelete(@RequestParam("cartNo") int cartNo) {
		  int result = cartservice.cartDelete(cartNo);
		  return "cart/cartList";
		}
	
}
