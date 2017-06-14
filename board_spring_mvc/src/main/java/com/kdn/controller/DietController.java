package com.kdn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.AnonymityService;
import com.kdn.model.biz.DietService;
import com.kdn.model.biz.NoticeBoardService;
import com.kdn.model.biz.RankingService;
import com.kdn.model.biz.ReviewService;
import com.kdn.model.biz.SuyoService;
import com.kdn.model.domain.Anonymity;
import com.kdn.model.domain.AnonymityPageBean;
import com.kdn.model.domain.Diet;
import com.kdn.model.domain.NoticeBoard;
import com.kdn.model.domain.NoticePageBean;
import com.kdn.model.domain.Ranking;
import com.kdn.model.domain.Review;
import com.kdn.model.domain.ReviewPageBean;
import com.kdn.model.domain.Suyo;

@Controller
public class DietController {
	@Autowired
	NoticeBoardService	noticeBoardService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	DietService dietService;
	
	@Autowired
	RankingService rankingService;
	
	@Autowired
	SuyoService suyoService;
	
	@Autowired 
	private AnonymityService anonymityService;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp"); 
		return model;
	}
	
	@RequestMapping(value = "addWeeklyMenuForm.do", method = RequestMethod.GET)
	public String addWeeklyMenuForm(Model model, NoticePageBean noticebean, ReviewPageBean bean){
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		
		model.addAttribute("addMenuContent", "weekly_menu/addMenu.jsp");
		
		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		List<Suyo> suyoCountList = suyoService.getSuyoCountAll();
		model.addAttribute("suyoCountList", suyoCountList);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoardFromHome.jsp");
		return "index";
	}
	
	@RequestMapping(value = "addWeeklyMenu.do", method = RequestMethod.POST)
	public String addWeeklyMenu(Model model, NoticePageBean noticebean, ReviewPageBean bean, Diet diet, HttpServletResponse response ){
		System.out.println(diet);
		Diet find = dietService.search(diet.getDietDate(), diet.getScode());
		if(find != null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = null;
			try {
				writer = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			writer.println("<script type='text/javascript'>");
			writer.println("alert('이미 식단이 등록된 날짜 입니다. 업데이트 페이지로 이동합니다.');");
			writer.println("</script>");
			writer.flush();
			model.addAttribute("weeklyMenuContent", "weekly_menu/updateMenuForm.jsp");
			model.addAttribute("dietDate", diet.getDietDate());
			model.addAttribute("scode", diet.getScode());
		}
		else{
			dietService.add(diet);
			System.out.println("diet Add : 완료");
			
			List<Diet> dietList = dietService.searchAll();
			model.addAttribute("dietList", dietList);
			model.addAttribute("weeklyMenuContent", "weekly_menu/weeklyMenu.jsp");
		}
		
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		
		

		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		List<Suyo> suyoCountList = suyoService.getSuyoCountAll();
		model.addAttribute("suyoCountList", suyoCountList);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoardFromHome.jsp");
		return "index";
	}
	
	@RequestMapping(value = "updateWeeklyMenuForm.do", method = RequestMethod.GET)
	public String updateWeeklyMenuForm(Model model, NoticePageBean noticebean, ReviewPageBean bean){
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		model.addAttribute("updateMenuContent", "weekly_menu/updateMenuForm.jsp");
		
		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		List<Suyo> suyoCountList = suyoService.getSuyoCountAll();
		model.addAttribute("suyoCountList", suyoCountList);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoardFromHome.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "searchUpdateMenu.do", method = RequestMethod.POST)
	public String searchUpdateMenu(Model model, NoticePageBean noticebean, ReviewPageBean bean, String dietDate, int scode){
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		
		model.addAttribute("updateMenuContent", "weekly_menu/updateMenu.jsp");
		model.addAttribute("oneDiet", dietService.search(dietDate, scode));
		
		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		List<Suyo> suyoCountList = suyoService.getSuyoCountAll();
		model.addAttribute("suyoCountList", suyoCountList);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoardFromHome.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "updateMenu.do", method = RequestMethod.POST)
	public String UpdateMenu(Model model, NoticePageBean noticebean, ReviewPageBean bean, Diet diet){
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		
		dietService.update(diet);
		
		List<Diet> dietList = dietService.searchAll();
		model.addAttribute("dietList", dietList);
		model.addAttribute("weeklyMenuContent", "weekly_menu/weeklyMenu.jsp");
		
		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		List<Suyo> suyoCountList = suyoService.getSuyoCountAll();
		model.addAttribute("suyoCountList", suyoCountList);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoardFromHome.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "listWeeklyMenu.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model, NoticePageBean noticebean, ReviewPageBean bean, AnonymityPageBean anonymitybean) {
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		
		List<Diet> dietList = dietService.searchAll();
		model.addAttribute("dietList", dietList);
		model.addAttribute("weeklyMenuContent", "weekly_menu/weeklyMenu.jsp");
		
		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoardFromHome.jsp");
		
		List<Suyo> suyoCountList = suyoService.getSuyoCountAll();
		model.addAttribute("suyoCountList", suyoCountList);
		
//		익명게시판
		List<Anonymity> anonymityList = anonymityService.searchAll(anonymitybean);
		model.addAttribute("anonymityList", anonymityList);
		model.addAttribute("anonymityPageBean", anonymitybean);
		model.addAttribute("anonymityBoardContent",  "anonymity_board/listAnonymityFromHome.jsp");
		return "index";
	}
	
	
}
