package com.project.fin.orders.model.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Orders {
	private int orderNo;	
	private int storeNo;	
	private String memberId;
	private String storeName;
	private String menuName;
	private String ordTime;
	private String ordState;
	private int price;
	private int delivery;
	private String ordAddress;
	private int ordPhone;
	private String request;
	private int cancle;
	private int totalPrice;
}
