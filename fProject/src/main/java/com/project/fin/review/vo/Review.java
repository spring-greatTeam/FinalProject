package com.project.fin.review.vo;

import java.util.Date;

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
public class Review {
	private int reviewNo;
	private int orderNo;
	private String userId;
	private int storeNo;
	private int rating;
	private Date write;
	private String content;
}
