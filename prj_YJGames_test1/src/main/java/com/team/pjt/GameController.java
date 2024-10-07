package com.team.pjt;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.game.IndexList;
import command.game.ViewPage;
import common.CommonExecute;
import common.CommonTemplate;

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
			}else if(gubun.equals("join")) {
//				CommonExecute game = new IndexList();
//				game.execute(req);
				viewPage = "join";
			}else if(gubun.equals("login")) {
//				CommonExecute game = new IndexList();
//				game.execute(req);
				viewPage = "login";
			}else if(gubun.equals("support")) {
//				CommonExecute game = new IndexList();
//				game.execute(req);
				viewPage = "support";
			}else if(gubun.equals("test112")) {
				CommonExecute game = new ViewPage();
				game.execute(req);
				viewPage = "viewtest";
			}
			else if(gubun.equals("testVideo")) {
				viewPage = "video_test";
			}
			return viewPage;
		
	
	}
	
}