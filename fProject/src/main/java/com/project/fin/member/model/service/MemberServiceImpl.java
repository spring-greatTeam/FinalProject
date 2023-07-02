package com.project.fin.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.member.model.dao.MemberDao;
import com.project.fin.orders.model.vo.Orders;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;



	
}
