package com.kdn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
public class AnonymityController {

	@Autowired
	private AnonymityService anonymityService;
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@Autowired
	private DietService dietService;
	
	@Autowired
	private RankingService rankingService;
	
	@Autowired
	private SuyoService suyoService;
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value="listAnonymity.do", method=RequestMethod.GET)
	public String listAnonymity(AnonymityPageBean anonymitybean, Model model, NoticePageBean noticebean, ReviewPageBean bean){
		List<Anonymity> anonymityList = anonymityService.searchAll(anonymitybean);
		model.addAttribute("anonymityList", anonymityList);
		model.addAttribute("anonymityPageBean", anonymitybean);
		model.addAttribute("anonymityBoardContent",  "anonymity_board/listAnonymity.jsp");
		
//		그외 입력문 추가
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");

		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");

		List<Diet> dietList = dietService.searchAll();
		model.addAttribute("dietList", dietList);
		model.addAttribute("weeklyMenuContent", "weekly_menu/weeklyMenuFromHome.jsp");

		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);

		model.addAttribute("rankingBoardContent", "ranking_board/listBoard.jsp");

		List<Suyo> suyoCountList = suyoService.getSuyoCountAll();
		model.addAttribute("suyoCountList", suyoCountList);

		return "index";
	}

	@RequestMapping(value="insertAnonymity.do", method=RequestMethod.POST)
	public String insertAnonymity(Anonymity anonymity){
		System.out.println("this is anony : " + anonymity);
		anonymityService.add(anonymity);
		return "redirect:listAnonymity.do";
	}
	@RequestMapping(value="deleteAnonymity.do", method=RequestMethod.POST)
	public String deleteAnonymity(Anonymity anonymity){
		System.out.println("this is delete anony : " + anonymity);
		anonymityService.remove(anonymity);
		return "redirect:listAnonymity.do";
	}
	@RequestMapping(value="updateAnonymity.do", method=RequestMethod.POST)
	public String updateAnonymity(Anonymity anonymity){
		System.out.println("this is update anony : " + anonymity);
		anonymityService.update(anonymity);
		return "redirect:listAnonymity.do";
	}
}


