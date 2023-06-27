package com.project.fin.member.model.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

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
public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate birthday;
	private String phone;
	private LocalDateTime createDate;
	private boolean status;
}
