package com.team.pjt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
//import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import command.admin.GamesList;
import command.admin.NewsList;
import command.admin.UserActivate;
import command.admin.UserDelete2;
import command.admin.UserGameList;
import command.admin.UserInfo2;
import command.admin.UserList;
import command.admin.UserUpdate2;
import command.cart.CartList;
import command.cart.Payment;
import command.cart.Payment_now;
import command.game.GameConfirm;
import command.game.GameConfirmList;
import command.game.GameConfirmView;
import command.game.GameRegist;
import command.game.IndexList;
import command.game.StoreRegist;
import command.library.LibraryDetail;
import command.library.LibraryList;
import command.news.NewsDelete;
import command.news.NewsUpdate;
import command.news.NewsUpdateForm;
import command.news.NewsWrite;
import command.review.MyReviewList;
import command.review.ReviewDelete;
import command.review.ReviewList;
import command.review.ReviewSave;
import command.review.ReviewUpdate;
import command.review.ReviewUpdateForm;
import command.support.SupportSubmit;
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
import dao.RankDao;
import dao.UserDao;
import dto.GameRegiDto;
import dto.GenreDto;

@Controller
public class GameController {

	@Autowired 
	JdbcTemplate template;
	@Autowired
	public void aaa() {
		CommonTemplate.setTemplate(template);
	}
	//게임 일괄 컨펌
	@RequestMapping("ConfirmSelected")
	public String ConfirmSelected(HttpServletRequest req) {
		CommonExecute confirm = new command.game.GameConfirm2();
		confirm.execute(req);
		return "common_alert";
	}
	//관리자 페이지
	@RequestMapping("AdminPage")
	public String AdminPage(HttpServletRequest req) {
		return"adminPage/adminPage";
	}
	//통계 리스트
		@RequestMapping("Rank")
		public String Rank(HttpServletRequest req) {
			CommonExecute rank = new command.rank.Rank();
			rank.execute(req);
			return"rank/rank";
		}
	//뉴스 상세보기
	@RequestMapping("NewsView")  
	public String NewsView(HttpServletRequest req) {
		CommonExecute news = new command.news.NewsView();
		news.execute(req);
		return"news/news_view";
	}
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
		//support
		else if(gubun.equals("sup_submit")){CommonExecute game = new SupportSubmit();game.execute(req);viewPage = "common_alert";}
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
		//유저리스트
		else if(gubun.equals("user_list")) {CommonExecute game = new UserList();game.execute(req);viewPage = "adminPage/user_list";}
		//유저정보수정페이지
		else if(gubun.equals("userinfo2")) {CommonExecute game = new UserInfo2();game.execute(req);viewPage = "adminPage/users_info";}
		//관리자 유저 수정
		else if(gubun.equals("userupdate2")) {CommonExecute game = new UserUpdate2();game.execute(req);viewPage = "common_alert";}
		//관리자 유저 계정 활성화
		else if(gubun.equals("activate")) {CommonExecute game = new UserActivate();game.execute(req);viewPage = "common_alert";}
		//관리자 유저 삭제
		else if(gubun.equals("userdelete2")) {CommonExecute game = new UserDelete2();game.execute(req);viewPage = "common_alert";}
		//구매
		else if(gubun.equals("payment")) {CommonExecute game = new Payment();game.execute(req);viewPage = "payment";}
		//바로구매
		else if(gubun.equals("payment_now")) {CommonExecute game = new Payment_now();game.execute(req);viewPage = "payment_now";}
		//뉴스등록폼
		//여기서 g_code값 받아와야함
		else if(gubun.equals("news_write")) {viewPage = "news/news_write";}
		//뉴스등록
		else if(gubun.equals("news_save")) {CommonExecute game = new NewsWrite();game.execute(req);viewPage = "common_alert";}
		//뉴스수정폼
		else if(gubun.equals("news_updateForm")) {CommonExecute game = new NewsUpdateForm();game.execute(req);viewPage = "news/news_update";}
		//뉴스수정
		else if(gubun.equals("news_update")) {CommonExecute game = new NewsUpdate();game.execute(req);viewPage = "common_alert";}
		//뉴스삭제
		else if(gubun.equals("news_delete")) {CommonExecute game = new NewsDelete();game.execute(req);viewPage = "common_alert";}
		//게임 등록폼
		else if(gubun.equals("gameRegistForm")) {
			GameDao dao = new GameDao();
			String g_code = dao.AutoCode();
			ArrayList<GenreDto> dtos = dao.genreCheckList();
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
			CommonExecute game = new IndexList();
			game.execute(req);
			viewPage = "registration/store_regist";
		//상점 페이지 등록
		} else if(gubun.equals("storeRegist")) {
			CommonExecute game = new StoreRegist();
			game.execute(req);
			viewPage = "common_alert";
		}
		//게임 컨펌 리스트
		else if(gubun.equals("GameConfirmList")) {
			CommonExecute game = new GameConfirmList();
			game.execute(req);
			viewPage = "adminPage/confirm_list";
		//게임 컨펌 상세
		} else if(gubun.equals("GameConfirmView")) {
			CommonExecute game = new GameConfirmView();
			game.execute(req);
			viewPage = "registration/game_regist_confirm";
		//게임 컨펌
		} else if(gubun.equals("gameConfirm")) {
			CommonExecute game = new GameConfirm();
			game.execute(req);
			viewPage = "common_alert";}
		//관리자,게임사 게임 리스트
		else if(gubun.equals("games_list")) {CommonExecute game = new GamesList();game.execute(req);viewPage = "adminPage/games_list";}
		//관리자,게임사 뉴스 리스트
		else if(gubun.equals("news_list")) {CommonExecute game = new NewsList();game.execute(req);viewPage = "adminPage/news_list";}
		//관리자.유저게임리스트
		else if(gubun.equals("usergamelist")) {CommonExecute game = new UserGameList();game.execute(req);viewPage = "adminPage/user_game_list";}
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
		RankDao dao3 = new RankDao();
		int count = 0;
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_id");
		ArrayList<String> lists = dao.GameCodeList(u_id);
		for(String codes : lists) {
			count = dao.AddPurchase(u_id, codes);
			if(count!=0)dao3.rankHit(codes);
		}
		if(count != 0) {out.print(String.valueOf(count));dao.RemoveCartAll(u_id);}
		else out.print("");
	}
	//게임머니로 결제
	@RequestMapping("Game_money_purchase")
	public void Game_money_purchase(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		GameDao dao = new GameDao();
		UserDao dao2 = new UserDao();
		RankDao dao3 = new RankDao();
		int count = 0;
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_id");
		String u_money = request.getParameter("t_u_money");
		String m_money = request.getParameter("t_my_money");
		Double money = Double.parseDouble(m_money) - Double.parseDouble(u_money);
		ArrayList<String> lists = dao.GameCodeList(u_id);
		for(String codes : lists) {
			count = dao.AddPurchase(u_id, codes);
			if(count!=0)dao3.rankHit(codes);
		}
		if(count != 0) {out.print(String.valueOf(count));dao.RemoveCartAll(u_id);dao2.Payment(u_id, money);}
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
		String m_money = request.getParameter("t_my_money");
		Double money = Double.parseDouble(u_money)+Double.parseDouble(m_money);
		UserDao dao = new UserDao();
		int count = dao.Payment(u_id, money);
		if(count == 1) {out.print(String.valueOf(count));}
		else out.print("");
	}
	//실행
	@RequestMapping("exe") 
	public void Exe(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String code = request.getParameter("t_fileName");
		GameDao.EXE(code);
		out.print("1");
	}
	//다운로드
	@RequestMapping("Download")
	public void Download(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		String savePath = "C:\\Users\\JSLHRD\\git\\repository\\prj_YJGames\\src\\main\\webapp\\exe";// 첨부파일경로
		String fileName = request.getParameter("t_fileName");   // 다운로드 받을 첨부파일명
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
		        out = response.getWriter();
		        out.println("<script language='javascript'>alert('file not found');history.back();</script>");
		    }
		    in.close();
		    os.close();
		}catch(Exception e){
			System.out.println(savePath+"첨부 파일 다운 오류~ 파일명:"+fileName);
		}
		System.out.println("Request: " + request);
		System.out.println("Response: " + response);
		out.print("1");
	}
	//지갑으로 바로결제
	@RequestMapping("Card_recharge_now")
	public void Card_recharge_now(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		GameDao dao = new GameDao();
		RankDao dao2 = new RankDao();
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_id");
		String code = request.getParameter("t_pageNo");
		int count = dao.AddPurchase(u_id, code);
		if(count != 0) {out.print(String.valueOf(count));dao2.rankHit(code);}
		else out.print("");
	}
	//게임머니로 바로결제
	@RequestMapping("Game_money_purchase_now")
	public void Game_money_purchase_now(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		GameDao dao = new GameDao();
		UserDao dao2 = new UserDao();
		RankDao dao3 = new RankDao();
		try {out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
		String u_id = request.getParameter("t_id");
		String u_money = request.getParameter("t_u_money");
		String m_money = request.getParameter("t_my_money");
		String code = request.getParameter("t_pageNo");
		Double money = Double.parseDouble(m_money) - Double.parseDouble(u_money);
		int count = dao.AddPurchase(u_id, code);
		if(count != 0) {out.print(String.valueOf(count));dao3.rankHit(code);dao2.Payment(u_id, money);}
		else out.print("");
	}
/*	
		//summernote
		@RequestMapping("SummerNote")
		public void SummerNote(HttpServletRequest request, HttpServletResponse response) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = null;
		    String summerDir = "";
		    int sizeLimit = 10 * 1024 * 1024;
		    summerDir = request.getSession().getServletContext().getRealPath("/") + "/img/summernote/";
		        System.out.println(summerDir);
		        try {
					MultipartRequest multi = null;	
					String str_filename="";  
		        try {
					multi = new MultipartRequest(request, summerDir, sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
					// 첨부하 파일명 알아오기
					Enumeration files = multi.getFileNames();
					String fname = (String)files.nextElement();
					str_filename = multi.getFilesystemName(fname);  

				}catch(Exception e) {
					e.printStackTrace();
				}
				try {
					out = response.getWriter();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				out.println(str_filename); 
				out.close();	 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/
}
