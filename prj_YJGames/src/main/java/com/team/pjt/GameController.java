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
import command.game.StoreRegist;
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
import dto.GameRegiDto;

@Controller
public class GameController {

	@Autowired
	JdbcTemplate template;
	@Autowired
	public void aaa() {
		CommonTemplate.setTemplate(template);
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
			else if(gubun.equals("library")){viewPage = "library/library";}
			//library 상세
			else if(gubun.equals("library_detail")){viewPage = "library/libraryDetail";}
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
			else if(gubun.equals("gameRegistForm")) {
				GameDao dao = new GameDao();
				String g_code = dao.AutoCode();
				ArrayList<GameRegiDto> dtos = dao.genreCheckList();
				req.setAttribute("g_code", g_code);
				req.setAttribute("dtos", dtos);
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "registration/game_regist";
			//게임 등록
			} else if(gubun.equals("gameRegist")) {
				CommonExecute game = new GameRegist();
				game.execute(req);
				viewPage = "common_alert";
			//상점 페이지 등록폼
			} else if(gubun.equals("storeRegistForm")) {
				GameDao dao = new GameDao();
				HttpSession session = req.getSession();
		        String sessionName = (String) session.getAttribute("sessionName");
				String s_page_no = dao.AutoNo();
				ArrayList<GameRegiDto> dtos = dao.GameSelectList(sessionName);
				req.setAttribute("s_page_no", s_page_no);
				req.setAttribute("dtos", dtos);
				CommonExecute game = new StoreRegist();
				game.execute(req);
				viewPage = "registration/store_regist";
			//상점 페이지 등록
			} else if(gubun.equals("storeRegist")) {
				CommonExecute game = new StoreRegist();
				game.execute(req);
				viewPage = "common_alert";
			}
			
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
			// TODO Auto-generated catch block
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
		int count = dao.AddCart(u_id, g_code);
		if(count == 1) out.print(count);
		else out.print("");
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
	//파일다운로드 
	/*
	@RequestMapping("FileDownload")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String savePath = request.getParameter("t_fileDir");// 첨부파일경로
	 	String fileName = request.getParameter("t_fileName");   // 다운로드 받을 첨부파일명
		if(savePath.equals("notice")) savePath = CommonUtil.getNoticeDir();
		if(savePath.equals("pds")) savePath = CommonUtil.getPdsDir(); 
	    String orgfilename = fileName ;
	    InputStream in = null;
	    OutputStream os = null; 
	    File file = null;
	    boolean skip = false;
	    String client = "";
	  
	    try{
	        try{
	            file = new File(savePath, fileName);
	            in = new FileInputStream(file);
	        }catch(FileNotFoundException fe){
	            skip = true;
	        }
	         
	        client = request.getHeader("User-Agent");
	        response.reset() ;
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-Description", "JSP Generated Data");
	 
	        if(!skip){
	 
	            // IE
	            if(client.indexOf("MSIE") != -1){
	                response.setHeader ("Content-Disposition", "attachment; filename="+orgfilename);
	 
	            }else{
	                // 한글 파일명 처리
	                orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");

	                response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
	                response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	            } 
	             
	            response.setHeader ("Content-Length", ""+file.length() );
	            os = response.getOutputStream();
	            byte b[] = new byte[(int)file.length()];
	            int leng = 0;
	             
	            while( (leng = in.read(b)) > 0 ){
	                os.write(b,0,leng);
	            }
	 
	        }else{
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
	        }
	        in.close();
	        os.close();
	 
	    }catch(Exception e){
	    	System.out.println(savePath+"첨부 파일 다운 오류~ 파일명:"+fileName);
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}*/
}
