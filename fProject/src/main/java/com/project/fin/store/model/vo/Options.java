package com.project.fin.store.model.vo;

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
public class Options {

	
	private int optionNo;
	private int menuNo;
	private String opTitle;
	private String opName;
	private String opPrice;
	private String opType;
}
