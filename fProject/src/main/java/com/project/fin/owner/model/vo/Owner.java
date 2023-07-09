package com.project.fin.owner.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;

import lombok.Data; 

import lombok.NoArgsConstructor;

import lombok.ToString;
  
@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString 
public class Owner {
	private int storeNo;	// 시퀀스 값
	private String ownerId;			
	private String ownerPwd;
	private String ownerName;
	private Date ownerBirthday;
	private String phone;
	private String address;
	private String businessNumber;
  }
 