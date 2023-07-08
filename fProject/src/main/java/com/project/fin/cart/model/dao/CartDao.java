package com.project.fin.cart.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.fin.cart.model.vo.Cart;


@Mapper
public interface CartDao {


	int insertCart(Cart cart);

	List<Cart> cartList(String memberId);

	int updateQuantity(int updatedQuantity, int storeNo, String menuName, String opTitle, String opName);

	int cartDelete(int cartNo);









}
