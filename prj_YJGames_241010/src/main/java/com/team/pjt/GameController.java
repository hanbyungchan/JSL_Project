package com.team.pjt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.cart.CartList;
import command.cart.Payment;
import command.game.GameRegist;
import command.game.IndexList;
import command.library.LibraryDetail;
import command.library.LibraryList;
import command.review.MyReviewList;
import command.review.ReviewDelete;
import command.review.ReviewList;
import command.review.ReviewSave;
import command.review.ReviewUpdate;
import command.review.ReviewUpdateForm;
import command.user.UserDelete;
import command.user.UserInfo;
import command.user.UserJoin;
import command.user.UserLogin;
import command.user.UserLogout;
import command.user.UserUpdate;
import command.view.ViewPage;
import common.CommonExecute;
import common.CommonTemplate;
import dao.GameDao;
import dao.UserDao;

@Controller
public class GameController {

	@Autowired
	JdbcTemplate template;
	@Autowired
	public void aaa() {
		CommonTemplate.setTemplate(template);
	}
	
	//뉴스 상세보기
	@RequestMapping("NewsView")
	public String NewsView(HttpServletRequest req) {
		CommonExecute news = new command.news.NewsView();
		news.execute(req);
		return"news/news_view";
	}
	//게임사별 뉴스 목록을 게임 라이브러리 따위에 띄운다면 그쪽에서 호출해줘야됨.
	//뉴스 게시판
	@RequestMapping("News")
	public String News(HttpServletRequest req) {
		CommonExecute news = new command.news.News();
		news.execute(req);
		return"news/news";
	}
	
	@RequestMapping("Search")
	public String Search(HttpServletRequest req) {
		CommonExecute game = new command.search.Search();
		game.execute(req);
		return"search/search";
	}
	
	@RequestMapping("Game")
	public String Game(HttpServletRequest req) {
			String gubun = req.getParameter("t_gubun");
			String viewPage = "";
			if(gubun == null) gubun = "list";
			//홈페이지
			if(gubun.equals("list")) {CommonExecute game = new IndexList();game.execute(req);viewPage = "index";}
			//홈페이지2
			else if(gubun.equals("goStore")){CommonExecute game = new IndexList();game.execute(req);viewPage = "index";}
			//홈페이지2
			else if(gubun.equals("view")){CommonExecute game = new ViewPage();game.execute(req);viewPage = "view";}
			//support
			else if(gubun.equals("support")){viewPage = "support/support";}
			//library
			else if(gubun.equals("library")){CommonExecute game = new LibraryList();game.execute(req);viewPage = "library/library";}
			//library 상세
			else if(gubun.equals("library_detail")){CommonExecute game = new LibraryDetail();game.execute(req);viewPage = "library/libraryDetail";}
			//리뷰
			else if(gubun.equals("review")){CommonExecute game = new ReviewList();game.execute(req);viewPage = "review/review";}
			//내리뷰
			else if(gubun.equals("myreview")){
				HttpSession session = req.getSession();
				if(session.getAttribute("sessionName") == null) {
					req.setAttribute("t_gubun", "goSignin");
					req.setAttribute("t_msg", "Please log in!");
					req.setAttribute("t_url", "Game");
					viewPage = "common_alert";
				}
				else{CommonExecute game = new MyReviewList();game.execute(req);viewPage = "review/myreview";}}
			//리뷰적기
			else if(gubun.equals("review_write")){
				HttpSession session = req.getSession();
				if(session.getAttribute("sessionName") == null) {
					req.setAttribute("t_gubun", "goSignin");
					req.setAttribute("t_msg", "Please log in!");
					req.setAttribute("t_url", "Game");
					viewPage = "common_alert";
				}
				else {
				CommonExecute game = new ReviewList();
				game.execute(req);
				viewPage = "review/review_write";}}
			//리뷰저장
			else if(gubun.equals("review_save")) {CommonExecute game = new ReviewSave();game.execute(req);viewPage = "common_alert";}
			//리뷰수정페이지
			else if(gubun.equals("review_updateform")) {CommonExecute game = new ReviewUpdateForm();game.execute(req);viewPage = "review/review_update";}
			//리뷰수정
			else if(gubun.equals("review_update")) {CommonExecute game = new ReviewUpdate();game.execute(req);viewPage = "common_alert";}
			//리뷰삭제
			else if(gubun.equals("review_delete")) {CommonExecute game = new ReviewDelete();game.execute(req);viewPage = "common_alert";}
			//로그인창
			else if(gubun.equals("goSignin")){viewPage = "user/user_login";} 
			//회원가입창(개인)
			else if(gubun.equals("userjoin_cus")) {viewPage = "user/user_join_customer";}
			//회원가입창(기업)
			else if(gubun.equals("userjoin_com")) {viewPage = "user/user_join_company";}
			//내정보
			else if(gubun.equals("userinfo")) {CommonExecute game = new UserInfo();game.execute(req);viewPage = "user/user_myinfo";}
			//장바구니
			else if(gubun.equals("cart")) {
				HttpSession session = req.getSession();
				if(session.getAttribute("sessionName") == null) {
					req.setAttribute("t_gubun", "goSignin");
					req.setAttribute("t_msg", "Please log in!");
					req.setAttribute("t_url", "Game");
					viewPage = "common_alert";
				}
			else {
				CommonExecute game = new CartList();game.execute(req);viewPage = "cart";}}
			//회원가입
			else if(gubun.equals("usersave")) {CommonExecute game = new UserJoin();game.execute(req);viewPage = "common_alert";}
			//로그인
			else if(gubun.equals("userlogin")) {CommonExecute game = new UserLogin();game.execute(req);viewPage = "common_alert";}
			//로그아웃
			else if(gubun.equals("userlogout")) {CommonExecute game = new UserLogout();game.execute(req);viewPage = "common_alert";}
			//유저수정
			else if(gubun.equals("userupdate")) {CommonExecute game = new UserUpdate();game.execute(req);viewPage = "common_alert";}
			//유저삭제
			else if(gubun.equals("userdelete")) {CommonExecute game = new UserDelete();game.execute(req);viewPage = "common_alert";}
			//구매
			else if(gubun.equals("payment")) {CommonExecute game = new Payment();game.execute(req);viewPage = "payment";}
			//게임 등록폼
			else if(gubun.equals("gameRegistForm")) {GameDao dao = new GameDao();String g_code = dao.AutoNo();req.setAttribute("g_code", g_code);viewPage = "registration/game_regist";}
			//게임 등록
			 else if(gubun.equals("gameRegist")) {CommonExecute game = new GameRegist();game.execute(req);viewPage = "common_alert";}
			
			return viewPage;
	}
	//id중복체크
	@RequestMapping("checkId")
	public void checkId(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String id = request.getParameter("t_u_id");
		UserDao dao = new UserDao();
		int count = dao.userCheckId(id);
		if(count == 1) out.print("Unuseable ID");
		else out.print("Useable ID");
	}
	//장바구니 삭제
	@RequestMapping("RemoveCart")
	public void RemoveCart(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_u_id");
		String g_code = request.getParameter("t_g_code");
		GameDao dao = new GameDao();
		int count = dao.RemoveCart(u_id, g_code);
		if(count == 1) out.print(count);
		else out.print("");
	}
	
	//장바구니 추가
	@RequestMapping("Contain")
	public void ContainGame(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_u_id");
		String g_code = request.getParameter("t_g_code");
		GameDao dao = new GameDao();
		int count2 = dao.Whether_to_purchase(u_id, g_code);
		int count3 = dao.Whether_to_cart(u_id, g_code);
		if(count3 == 0) {
			if(count2 == 0) {
				int count = dao.AddCart(u_id, g_code);
				if(count == 1) out.print(count);
				else out.print("");
			}else out.print("3");
		}else out.print("4");
		
	}
	//지갑으로 결제
	@RequestMapping("Card_recharge")
	public void Card_recharge(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		GameDao dao = new GameDao();
		int count = 0;
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_id");
		ArrayList<String> lists = dao.GameCodeList(u_id);
		for(String codes : lists) {
			count = dao.AddPurchase(u_id, codes);
		}
		if(count != 0) {out.print(count);dao.RemoveCartAll(u_id);}
		else out.print("");
	}
	//게임머니로 결제
		@RequestMapping("Game_money_purchase")
		public void Game_money_purchase(HttpServletRequest request, HttpServletResponse response) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = null;
			GameDao dao = new GameDao();
			UserDao dao2 = new UserDao();
			int count = 0;
			try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
			String u_id = request.getParameter("t_id");
			String u_money = request.getParameter("t_u_money");
			HttpSession session = request.getSession();
			String m_money = (String)session.getAttribute("sessionMoney");
			Double money = Double.parseDouble(m_money) - Double.parseDouble(u_money);
			ArrayList<String> lists = dao.GameCodeList(u_id);
			for(String codes : lists) {
				count = dao.AddPurchase(u_id, codes);
			}
			if(count != 0) {out.print(count);dao.RemoveCartAll(u_id);dao2.Payment(u_id, money);session.setAttribute("sessionMoney", money); }
			else out.print("");
		}
	//충전
	@RequestMapping("Payment")
	public void Payment(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_id");
		String u_money = request.getParameter("t_u_money");
		HttpSession session = request.getSession();
		String m_money = (String)session.getAttribute("sessionMoney");
		Double money = Double.parseDouble(u_money)+Double.parseDouble(m_money);
		UserDao dao = new UserDao();
		int count = dao.Payment(u_id, money);
		if(count == 1) {out.print(count); session.setAttribute("sessionMoney", money);}
		else out.print("");
	}
	
}
