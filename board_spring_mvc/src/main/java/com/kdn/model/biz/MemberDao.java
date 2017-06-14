package com.kdn.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kdn.model.domain.Member;
import com.kdn.model.domain.PageBean;

public interface MemberDao {
	public Member search(int id)  ;
	public List<Member> searchAll(PageBean bean) ;
	public int getCount( PageBean bean)  ;
	public void add( Member member)  ;
	/** withdraw를 Y로 update해야 한다.*/
	public void update( String id) ;
	public void update( Member member) ;
}
