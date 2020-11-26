package com.kh.dlog.member.model.service;

import java.util.ArrayList;

import com.kh.dlog.member.model.vo.Member;

public interface MemberService {
	
	int idCheck(String memberId);
	
	int nicknameCheck(String nickname);
	
	String idSearch(Member m);
	
	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	
	ArrayList<Member> infoList();
	
	int infoUpdate(Member m);
	
	ArrayList<Member> introList(Member m);
	
	ArrayList<Member> introListMn(Member m);
	
	int introInsert(Member m);
	
	int introUpdate(Member m);

	int deleteMember(String memberId);

	
	
	
	

}
