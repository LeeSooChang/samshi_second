 package com.kdn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.model.biz.AnonymityService;
import com.kdn.model.biz.DietService;
import com.kdn.model.biz.MemberService;
import com.kdn.model.biz.NoticeBoardService;
import com.kdn.model.biz.RankingService;
import com.kdn.model.biz.ReviewService;
import com.kdn.model.biz.SuyoService;
import com.kdn.model.domain.Anonymity;
import com.kdn.model.domain.AnonymityPageBean;
import com.kdn.model.domain.Diet;
import com.kdn.model.domain.Member;
import com.kdn.model.domain.NoticeBoard;
import com.kdn.model.domain.NoticePageBean;
import com.kdn.model.domain.PageBean;
import com.kdn.model.domain.Ranking;
import com.kdn.model.domain.Review;
import com.kdn.model.domain.ReviewPageBean;
import com.kdn.model.domain.Suyo;

@Controller
public class MemberController {
	@Autowired
	NoticeBoardService	noticeBoardService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	DietService dietService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RankingService rankingService;
	
	@Autowired
	private SuyoService suyoService;
	
	@Autowired
	private AnonymityService anonymityService;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		return model;
	}
	
	//등록
	@RequestMapping(value="registerForm.do", method=RequestMethod.GET)
	public String insertMemberForm(NoticePageBean noticebean, Model model, ReviewPageBean bean, AnonymityPageBean anonymitybean) {
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
		
//		익명게시판
		List<Anonymity> anonymityList = anonymityService.searchAll(anonymitybean);
		model.addAttribute("anonymityList", anonymityList);
		model.addAttribute("anonymityPageBean", anonymitybean);
		model.addAttribute("anonymityBoardContent",  "anonymity_board/listAnonymityFromHome.jsp");
	
		model.addAttribute("content", "member/register.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="registerMember.do", method=RequestMethod.POST)
	public String insertMember(NoticePageBean noticebean, Model model, ReviewPageBean bean, AnonymityPageBean anonymitybean, Member member) {
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		
		List<Diet> dietList = dietService.searchAll();
		model.addAttribute("dietList", dietList);
		model.addAttribute("weeklyMenuContent", "weekly_menu/weeklyMenuFromHome.jsp");
		
		model.addAttribute("content", "member/register.jsp");
		
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
		
//		익명게시판
		List<Anonymity> anonymityList = anonymityService.searchAll(anonymitybean);
		model.addAttribute("anonymityList", anonymityList);
		model.addAttribute("anonymityPageBean", anonymitybean);
		model.addAttribute("anonymityBoardContent",  "anonymity_board/listAnonymityFromHome.jsp");
		System.out.println(member);
		memberService.add(member);
		return "redirect:/";
	}
	
	//로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, int mno, String pw) {
		System.out.println("log : 로그인 시도 - " + mno);
		memberService.login(mno, pw);
		session.setAttribute("mno", mno);
		session.setAttribute("grade", memberService.search(mno).getGrade());
		session.setAttribute("prefer", memberService.search(mno).getPrefer());
		session.setAttribute("mname", memberService.search(mno).getMname());
		
		List<Diet> preferList = dietService.searchPrefer(mno);
		System.out.println("preferList : " + preferList);
		session.setAttribute("preferList",preferList);
		
		if(memberService.search(mno).getGrade().equals('Y'))
			System.out.println("log : 관리자 로그인 완료");
		else
			System.out.println("log : 사용자 로그인 완료");
		
		
		return "redirect:/";
	}

	//로그아웃
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String loginOut(HttpSession session) {
		session.removeAttribute("mno");
		session.removeAttribute("grade");
		session.removeAttribute("prefer");
		session.removeAttribute("mname");
		return "redirect:/";
	}
	
	//myPage
	@RequestMapping(value="myPage.do", method=RequestMethod.GET)
	public String myPage(HttpSession session, NoticePageBean noticebean, Model model, ReviewPageBean bean, AnonymityPageBean anonymitybean) {
		List<NoticeBoard> noticeList = noticeBoardService.searchAll(noticebean);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeBoardContent", "notice_board/listBoardFromHome.jsp");
		
		List<Review> list = reviewService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("reviewBoardContent", "review_board/listReviewFromHome.jsp");
		
		List<Diet> dietList = dietService.searchAll();
		model.addAttribute("dietList", dietList);
		model.addAttribute("weeklyMenuContent", "weekly_menu/weeklyMenuFromHome.jsp");
		
		int mno = (Integer) session.getAttribute("mno");
		System.out.println(memberService.search(mno));
		model.addAttribute("member", memberService.search(mno));
		model.addAttribute("content", "member/myPage.jsp");
		
		List<Ranking> rankingList = rankingService.searchN();
		model.addAttribute("rankingList", rankingList);
		List<Ranking> rankingM = rankingService.searchM();
		model.addAttribute("rankingM", rankingM);
		List<Ranking> rankingH = rankingService.searchH();
		model.addAttribute("rankingH", rankingH);
		List<Ranking> rankingI = rankingService.searchI();
		model.addAttribute("rankingI", rankingI);
		
		model.addAttribute("rankingBoardContent", "ranking_board/listBoard.jsp");
		
//		익명게시판
		List<Anonymity> anonymityList = anonymityService.searchAll(anonymitybean);
		model.addAttribute("anonymityList", anonymityList);
		model.addAttribute("anonymityPageBean", anonymitybean);
		model.addAttribute("anonymityBoardContent",  "anonymity_board/listAnonymityFromHome.jsp");
		return "index";
		
	}
	
	@RequestMapping(value="memberUpdateForm.do", method=RequestMethod.GET)
	public String memberUpdateForm(Model model) {
		model.addAttribute("content", "member/updateMember.jsp");
		return "index";
	}
	
	@RequestMapping(value="updateMember.do", method=RequestMethod.POST)
	public void updateMember(Member member, Model model, HttpServletResponse response) throws IOException {
		memberService.update(member);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.println("<script>alert('회원정보가 변경 되었습니다.');"
				  + "document.location.href = '/board'"
				  + "</script>");
		out.flush();
		out.close();
	}
	
	//멤버 리스트
	@RequestMapping(value="memberList.do", method=RequestMethod.GET)
	public String memberList(PageBean bean, Model model) {
		List<Member> list = memberService.searchAll(bean);
		model.addAttribute("mlist", list);
		model.addAttribute("content", "member/memberList.jsp");
		return "index";
	}
}