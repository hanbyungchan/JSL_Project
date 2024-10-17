package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.HomeDto;
import dto.SearchDto;

public class SearchDao {
	
	JdbcTemplate temp = CommonTemplate.getTemplate();
	
	//상점 검색 dao
	public ArrayList<SearchDto> SearchList(String search_txt, String price, String[] genre){//price 이하
		
		String genreTxt="";
		
		for(int i=0; i<genre.length; i++) {
			if(i==0) {
				genreTxt+="'"+genre[i]+"'";
			}
			else if(i!=0) {
				genreTxt+=", '"+genre[i]+"'";
			}
		}
		
		//장르 텍스트 잘 나오나?
		System.out.println("g_text1: "+genreTxt);
		
		//장르검색 query
		String query="select tbl.g_code, tbl.g_name, tbl.g_developer, tbl.g_grade, tbl.s_page_no, tbl.g_price, tbl.s_sale, tbl.g_sale_price, tbl.g_file\r\n" + 
				"from(\r\n" + 
				"select g.g_code, g.g_name, g.g_developer, g.g_grade, s.s_page_no, g.g_price, g.g_file,\r\n" + 
				"s.s_sale, round((g.g_price *((100-s.s_sale)/100)),2) as g_sale_price\r\n" + 
				"from KYJ_STORE_PAGE s, KYJ_GAME g\r\n" + 
				"where s.s_game_code = g.g_code\r\n" + 
				"and (g.g_name like '%"+search_txt+"%' or g.g_developer like '%"+search_txt+"%')\r\n" + 
				"and round((g.g_price *((100-s.s_sale)/100)),2) <= "+price+" --n 달러 이하--\r\n" + 
				"order by to_number('g_code') asc) tbl,\r\n" + 
				"(select game_code, code_count\r\n" + 
				"FROM\r\n" + 
				"(\r\n" + 
				"SELECT game_code, count(*) as code_count\r\n" + 
				"FROM kyj_genre_join\r\n" + 
				"where genre_code in ("+genreTxt+")--검색할 장르를 배열로 받아와서 반복문으로 입력해주기, 장르가 한 개일 때와 여러개일 때 구분해서 if문으로 데이터 재단해주기.--\r\n" + 
				"group by game_code) \r\n" + //장르 갯수에 따라(1개인지, 2개 이상인지) if문으로 판단해서 for문 나눠주기
				"where code_count = "+genre.length+") genre_search --code_count의 값은 장르 배열의 길이로 대입해주기.--\r\n" + 
				"where tbl.g_code = genre_search.game_code\r\n" + 
				"ORDER BY to_number(g_code) asc";
		if(genre.length==0) {////장르검색 아닌 경우의 query
			query="select g.g_code, g.g_name, g.g_developer, g.g_grade, s.s_page_no, g.g_price, g.g_file,\r\n" + 
					"s.s_sale, round((g.g_price *((100-s.s_sale)/100)),2) as g_sale_price\r\n" + 
					"from KYJ_STORE_PAGE s, KYJ_GAME g\r\n" + 
					"where s.s_game_code = g.g_code\r\n" + 
					"and (g.g_name like '%"+search_txt+"%' or g.g_developer like '%"+search_txt+"%')\r\n" + 
					"and round((g.g_price *((100-s.s_sale)/100)),2) <= "+price+" --n 달러 이하--\r\n" + 
					"order by to_number('g_code') asc";
		}
		System.out.println("query: "+query);
		RowMapper<SearchDto> searchDtos = new BeanPropertyRowMapper<>(SearchDto.class);
		ArrayList<SearchDto> dtos = (ArrayList<SearchDto>) temp.query(query, searchDtos);
		
		return dtos;
	}
	
	
}
