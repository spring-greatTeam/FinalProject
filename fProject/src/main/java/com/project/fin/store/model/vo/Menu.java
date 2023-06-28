package com.project.fin.store.model.vo;

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
public class Menu {

	
	private int menuNo;
	private int storeNo;
	private int categoryNo;
	private String menuName;
	private int price;
}
