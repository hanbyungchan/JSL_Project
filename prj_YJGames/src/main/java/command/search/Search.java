package command.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.SearchDao;
import dto.GenreDto;
import dto.SearchDto;

public class Search implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		SearchDao dao = new SearchDao();
		SearchDto dto = new SearchDto();
		GenreDto genreDto = new GenreDto();
		ArrayList<SearchDto> dtos = new ArrayList<SearchDto>();
		ArrayList<GenreDto> genreDtos = new ArrayList<GenreDto>();
		
		//게임 제목과 개발사명 검색
		String search_txt = req.getParameter("t_search");
		if(search_txt==null) search_txt="";
		
		//이건 검색할 가격임
		String price = req.getParameter("t_price");
		if(price==null) price ="9999";
		
		//체크된 장르 값만 넘어옴
		String[] g_arr = req.getParameterValues("t_genre");
		if(g_arr==null) {
			g_arr = new String[] {};
		}
		//null일 경우 아예 동작 안 함
		/*
		 * for(int i=0; i<g_arr.length; i++) { System.out.println(i+"번째 값: "+g_arr[i]);
		 * }
		 */
		//페이징 어케해. 마이 바티스에서 어떻게 적용시키지?
		
		genreDtos = dao.getGenreList();
		dtos = dao.SearchList(search_txt, price, g_arr);
		
		
		//search 페이지에서 정보 받아오고 dao 가서 select 만들기
		
		req.setAttribute("price", price);
		req.setAttribute("genreList", g_arr);
		req.setAttribute("dtos", dtos);
		req.setAttribute("genreDtos", genreDtos);
		
		
		
		
	}

}
