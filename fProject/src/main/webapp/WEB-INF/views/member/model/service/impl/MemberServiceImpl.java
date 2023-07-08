package com.project.fin.member.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fin.member.model.dao.MemberDao;
import com.project.fin.member.model.service.MemberService;
import com.project.fin.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public Member selectOneMember(String memberId) {
		return memberDao.selectOneMember(memberId);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	
}