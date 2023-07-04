package com.project.fin.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Store {

	private int storeNo;
	private int category;
	private String storeName;
	private String address;
	private String phone;
	private int openTime;
	private int closeTime;
	private int minPrice;
	private String dayOff;
	private String content;
	
}
