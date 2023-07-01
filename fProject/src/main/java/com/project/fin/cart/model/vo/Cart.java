package com.project.fin.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Cart {
	private int cartNo;
	private String memberId;
	private int orderNo;
	private String storeName;
	private String menuName;
	private int totalPrice;
	private int quantity;
}
