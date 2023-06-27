package com.project.fin.store.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Store {
	
	@NonNull
	private int storeNo;
	@NonNull
	private String storeName;
	@NonNull
	private int category;
	@NonNull
	private String leader;
	@NonNull
	private String address;
	private String dayOff;
	private String businessHours;
	private String phone;
	private String deliveryArea;
	private String content;
	private int limitPrice;
	
}
