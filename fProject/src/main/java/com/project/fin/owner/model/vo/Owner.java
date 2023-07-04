package com.project.fin.owner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Owner {

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
