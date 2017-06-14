package com.kdn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.domain.Board;
import com.kdn.model.domain.FileBean;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.UpdateException;
import com.kdn.util.PageUtility;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
   @Autowired
   @Qualifier("boardDao")
   private BoardDao dao;
   @Override
   public void add(Board board, String dir) {
      try {
         int bno = dao.getBoardNo();
         board.setNo(bno);
         
         dao.add(board);
         List<FileBean> files = board.getFiles();
         if(files!=null){
            dao.addFiles(files, bno);
         }
      } catch (Exception e) {
         e.printStackTrace();
         throw new UpdateException("�Խñ� �ۼ� �� ���� �߻�");
      }
   }

   @Override
   public void update(Board board) {
      try {
         dao.update(board);
         
      } catch (Exception e) {
         e.printStackTrace();
         throw new UpdateException("�Խñ� ���� �� ���� �߻�");
      }
   }

   @Override
   public void remove(int no) {
      try {
         dao.removeFiles(no);
         dao.remove(no);
      } catch (Exception e) {
         e.printStackTrace();
         throw new UpdateException("�Խñ� ���� �� ���� �߻�");
      }
   }
   @Override
   public Board search(int no) {
      try {
         return dao.search(no);
      } catch (Exception e) {
         e.printStackTrace();
         throw new UpdateException("�Խñ� �˻� �� ���� �߻�");
      }
   }
   @Override
   public List<Board> searchAll(PageBean bean) {
      try {
         int total = dao.getCount( bean);
         PageUtility bar = 
           new PageUtility(bean.getInterval()
                       , total
                       , bean.getPageNo()
                       , "images/");
         bean.setPagelink(bar.getPageBar());
         
         return dao.searchAll(bean);
      } catch (Exception e) {
         e.printStackTrace();
         throw new UpdateException("�Խñ� �˻� �� ���� �߻�");
      }
   }
}