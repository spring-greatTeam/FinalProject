package com.project.fin.member.model.service;

import com.project.fin.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	int updateMember(Member member);

	int updatePwd(Member member);

	
}
