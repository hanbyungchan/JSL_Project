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
import command.user.UserJoin;
import command.user.UserLogin;
import command.user.UserLogout;
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
			if(gubun.equals("list")) {
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "index";
			} else if(gubun.equals("goStore")){
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "index";
			} else if(gubun.equals("goCommunity")){
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "index";
			} else if(gubun.equals("goSupport")){
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "index";
			} else if(gubun.equals("goEx")){
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "index";
			} else if(gubun.equals("goSignin")){
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "user/user_login";
			} else if(gubun.equals("userjoin_cus")) {
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "user/user_join_customer";
			} else if(gubun.equals("userjoin_com")) {
				CommonExecute game = new IndexList();
				game.execute(req);
				viewPage = "user/user_join_company";
			}else if(gubun.equals("usersave")) {
				CommonExecute game = new UserJoin();
				game.execute(req);
				viewPage = "common_alert";
			} else if(gubun.equals("userlogin")) {
				CommonExecute game = new UserLogin();
				game.execute(req);
				viewPage = "common_alert";
			} else if(gubun.equals("userlogout")) {
				CommonExecute game = new UserLogout();
				game.execute(req);
				viewPage = "common_alert";
			}
			return viewPage;
	}
	
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
