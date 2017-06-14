package com.kdn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.BoardService;
import com.kdn.model.domain.Board;
import com.kdn.model.domain.PageBean;

public class BoardController {
	
	/**
	 * Error 泥섎━
	 * 
	 * @ExceptionHandler Controller�뿉�꽌 �삤瑜섍� 諛쒖깮�븯硫� 泥섎━�븯�뒗 湲곕뒫
	 */
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); //request�뿉 ���옣
		model.addObject("content", "ErrorHandler.jsp"); //request�뿉 ���옣
		return model;
		
	}
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="insertBoardForm.do", method=RequestMethod.GET)
	public String insertBoardForm(Model model) {
		model.addAttribute("content", "board/insertBoard.jsp");
		return "index";
	}
	@RequestMapping(value="insertBoard.do", method=RequestMethod.POST)
	public String insertBoard(Board board, HttpServletRequest request) {
		String dir = request.getRealPath("upload/");
		boardService.add(board, dir);
		
		return "redirect:listBoard.do";
	}
	
	@RequestMapping(value="listBoard.do", method=RequestMethod.GET)
	public String listBoard(PageBean bean, Model model) {
		List<Board> list = boardService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "board/listBoard.jsp");
		return "index";

	}

	@RequestMapping(value="searchBoard.do", method=RequestMethod.GET)
	public String searchBoard(int no, Model model) {
		System.out.println("boardcontrol>>>>>>>>>>>>>>>>>>>>>>>>>searchboard.do");
		model.addAttribute("board", boardService.search(no));
		model.addAttribute("content", "board/searchBoard.jsp");
		return "index";
		
	}
	

}
