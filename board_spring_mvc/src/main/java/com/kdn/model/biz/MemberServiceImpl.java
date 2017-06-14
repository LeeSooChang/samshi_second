package com.kdn.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.dao.MemberDaoImpl;
import com.kdn.model.domain.Member;
import com.kdn.model.domain.UpdateException;
import com.kdn.model.domain.PageBean;
import com.kdn.util.DBUtil;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	
	public Member search(int mno) {
		Member member = null;
		try {
			member = dao.search(mno);
		} catch(Exception  s){
			throw new UpdateException("DB Search Error");
		} 
		if(member == null){
			throw new UpdateException("Member is null in search");
		}else{
			return member;
		}
		
	}

	public List<Member> searchAll(PageBean bean) {
		List<Member> members= null;
		try {
			int count = dao.getCount( bean);
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB SearchAll Error");
		}
	}

	public boolean login(int mno, String passwrod) {
		Member member = null;
		try {
			member = dao.search(mno);
		} catch(Exception  s){
			throw new UpdateException("DB Login Error");
		} 
		if(member == null){
			throw new UpdateException("회원 정보가 없습니다.");
		}
		if(passwrod ==null || !passwrod.equals(member.getPassword())){
			throw new UpdateException("비밀번호가 틀립니다");
		}
		return true;
	}

	public void update(Member member) {
		try {
			Member find= dao.search(member.getMno());
			if(find == null){
				throw new UpdateException("Member is null in update procedure");
			}else{
				dao.update( member);
			}
		} catch(Exception  s){
			throw new UpdateException("DB Update Error : " + member);
		} 
	}
	
	public void add(Member member) {
		try {
			Member find= dao.search(member.getMno());
			System.out.println(member);
			if(find != null){
				throw new UpdateException("add.");
			}else{
				dao.add(member);
			}
		} catch(Exception  s){
			throw new UpdateException("DB Add Error");
		} 
	}
}
