package com.kdn.controller;

import java.util.List;












import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.DietService;
import com.kdn.model.biz.NoticeBoardService;
import com.kdn.model.biz.RankingService;
import com.kdn.model.biz.ReviewService;
import com.kdn.model.domain.Diet;
import com.kdn.model.domain.NoticeBoard;
import com.kdn.model.domain.NoticePageBean;
import com.kdn.model.domain.Ranking;
import com.kdn.model.domain.RankingPageBean;
import com.kdn.model.domain.Review;
import com.kdn.model.domain.ReviewPageBean;

@Controller
public class RankingController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RankingService rankingService;
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@Autowired
	private DietService dietService;
	@RequestMapping(value="listRanking.do", method=RequestMethod.GET)
	public String listReview(Model model) {
		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoard.jsp");
		return "index";
	}



}
