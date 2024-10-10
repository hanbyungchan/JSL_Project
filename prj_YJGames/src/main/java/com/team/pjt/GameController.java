package com.team.pjt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.game.IndexList;
import command.user.UserDelete;
import command.user.UserInfo;
import command.user.UserJoin;
import command.user.UserLogin;
import command.user.UserLogout;
import command.user.UserUpdate;
import common.CommonExecute;
import common.CommonTemplate;
import dao.UserDao;

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
			if(gubun.equals("list")) {
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "index";
			}
			//홈페이지2
			else if(gubun.equals("goStore")){
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "index";
			}
			//qna,faq
			else if(gubun.equals("support")){viewPage = "support/support";}
			//로그인창
			else if(gubun.equals("goSignin")){viewPage = "user/user_login";} 
			//회원가입창(개인)
			else if(gubun.equals("userjoin_cus")) {viewPage = "user/user_join_customer";}
			//회원가입창(기업)
			else if(gubun.equals("userjoin_com")) {viewPage = "user/user_join_company";}
			//내정보
			else if(gubun.equals("userinfo")) {
				CommonExecute game = new UserInfo();
				game.execute(req);
				viewPage = "user/user_myinfo";}
			//장바구니
			else if(gubun.equals("cart")) {viewPage = "cart";}
			//회원가입
			else if(gubun.equals("usersave")) {
				CommonExecute game = new UserJoin();
				game.execute(req);
				viewPage = "common_alert";
			}
			//로그인
			else if(gubun.equals("userlogin")) {
				CommonExecute game = new UserLogin();
				game.execute(req);
				viewPage = "common_alert";
			}
			//로그아웃
			else if(gubun.equals("userlogout")) {
				CommonExecute game = new UserLogout();
				game.execute(req);
				viewPage = "common_alert";
			}
			//유저수정
			else if(gubun.equals("userupdate")) {
				CommonExecute game = new UserUpdate();
				game.execute(req);
				viewPage = "common_alert";
			}
			//유저삭제
			else if(gubun.equals("userdelete")) {
				CommonExecute game = new UserDelete();
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
	
	
}
