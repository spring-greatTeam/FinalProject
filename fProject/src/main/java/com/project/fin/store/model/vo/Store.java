package com.project.fin.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Store {
	private int storeNo;
	private int category;
	private String storeName;
	private String address;
	private int phone;
	private int openTime;
	private int closeTime;
	private int minPrice;
	private String dayOff;
	private String content;
}
