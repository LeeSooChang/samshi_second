package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.NoticeBoard;
import com.kdn.model.domain.NoticePageBean;

public interface NoticeBoardService {
	public void update(NoticeBoard noticeBoard);
	public void remove(int nno);
	public NoticeBoard search(int nno);
	public void add(NoticeBoard noticeBoard, String dir);
	public List<NoticeBoard> searchAll(NoticePageBean bean);
}