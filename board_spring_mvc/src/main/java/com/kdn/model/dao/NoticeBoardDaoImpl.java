package com.kdn.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.model.biz.NoticeBoardDao;
import com.kdn.model.domain.FileBean;
import com.kdn.model.domain.NoticeBoard;
import com.kdn.model.domain.NoticePageBean;

@Repository("noticeBoardDao")
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public void add(NoticeBoard noticeBoard) {
		sql.insert("noticeBoard.insert", noticeBoard);
	}

	@Override
	public void update(NoticeBoard noticeBoard) {
		sql.update("noticeBoard.update", noticeBoard);
	}

	@Override
	public void remove(int nno) {
		sql.delete("noticeBoard.delete", nno);
	}

	@Override
	public NoticeBoard search(int nno) {
		return sql.selectOne("noticeBoard.search", nno);
	}

	@Override
	public List<NoticeBoard> searchAll(NoticePageBean noticebean) {
		RowBounds rows = new RowBounds(noticebean.getStart()-1, noticebean.getInterval());
		return sql.selectList("noticeBoard.searchAll", noticebean, rows);
	}

	@Override
	public int getCount(NoticePageBean bean) {
		return sql.selectOne("noticeBoard.getCount", bean);
	}

	@Override
	public int getNoticeBoardNo() {
		return sql.selectOne("noticeBoard.getNoticeBoardNo");
	}

	@Override
	public void addFiles(List<FileBean> files, int nno) {
		for(FileBean fileBean : files) {
			fileBean.setBno(nno);
			sql.insert("noticeBoard.insertFile", fileBean);
		}
	}

	@Override
	public void removeFiles(int nno) {
		sql.delete("noticeBoard.delete", nno);
	}

}
