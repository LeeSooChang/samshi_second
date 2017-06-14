package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Member;
import com.kdn.model.domain.PageBean;

public interface MemberService {

	public Member search(int mno);
	public List<Member> searchAll(PageBean bean);
	public boolean login(int mno, String passwrod);
	public void update(Member member);
	public void add(Member member);

}