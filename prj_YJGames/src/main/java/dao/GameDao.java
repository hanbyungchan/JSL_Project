package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.HomeDto;

public class GameDao {
	
	JdbcTemplate temp = CommonTemplate.getTemplate();
	//이름 검색페이지
	public ArrayList<HomeDto> GameList(String search) {
		String query = "select * from(\r\n" + 
				"select rownum rnum, tbl.*\r\n" + 
				"from (SELECT s.s_page_no,g_name, g.g_price, round((g.g_price *((100-s.s_sale)/100)),2) as g_price2 ,s.s_sale,s.s_img_main,s.s_img_1,s.s_img_2,s.s_img_3\r\n" + 
				"from kyj_game g, kyj_store_page s\r\n" + 
				"where g.g_code = s.s_game_code\r\n" + 
				"and g.g_name  like '%"+search+"%') tbl)";
		RowMapper<HomeDto> gameDtos = new BeanPropertyRowMapper<>(HomeDto.class);
		ArrayList<HomeDto> dtos = (ArrayList<HomeDto>) temp.query(query, gameDtos);
		return dtos;
	}
	//테마별 리스트
	public ArrayList<HomeDto> GenreList(String search) {
		String query = "select * from(\r\n" + 
				"select rownum rnum, tbl.*\r\n" + 
				"from (SELECT s.s_page_no,g_name, g.g_price, round((g.g_price *((100-s.s_sale)/100)),2) as g_price2 ,s.s_sale,s.s_img_main,s.s_img_1,s.s_img_2,s.s_img_3\r\n" + 
				"from kyj_game g, kyj_store_page s\r\n" + 
				"where g.g_code = s.s_game_code\r\n" + 
				"and g.g_genre  like '%"+search+"%'\r\n" +
				"order by s.s_sale DESC) tbl)";
		RowMapper<HomeDto> gameDtos = new BeanPropertyRowMapper<>(HomeDto.class);
		ArrayList<HomeDto> dtos = (ArrayList<HomeDto>) temp.query(query, gameDtos);
		return dtos;
	}
	//최신게임 리스트
	public ArrayList<HomeDto> NewList() {
		String query = "select * from(\r\n" + 
				"select rownum rnum, tbl.*\r\n" + 
				"from (SELECT s.s_page_no,g_name, g.g_price, round((g.g_price *((100-s.s_sale)/100)),2) as g_price2 ,s.s_sale,s.s_img_main,s.s_img_1,s.s_img_2,s.s_img_3\r\n" + 
				"from kyj_game g, kyj_store_page s\r\n" + 
				"where g.g_code = s.s_game_code\r\n" +
				"order by s.s_date DESC)tbl)\r\n" +
				"where rnum >=1 and rnum <=7";
		RowMapper<HomeDto> gameDtos = new BeanPropertyRowMapper<>(HomeDto.class);
		ArrayList<HomeDto> dtos = (ArrayList<HomeDto>) temp.query(query, gameDtos);
		return dtos;
	}
	//할인율 높은 순서1
	public ArrayList<HomeDto> SaleList1() {
		String query = "select * from(\r\n" + 
				"select rownum rnum, tbl.*\r\n" + 
				"from (SELECT s.s_page_no,g_name, g.g_price, round((g.g_price *((100-s.s_sale)/100)),2) as g_price2 ,s.s_sale,s.s_img_main,s.s_img_1,s.s_img_2,s.s_img_3\r\n" +  
				"from kyj_game g, kyj_store_page s\r\n" + 
				"where g.g_code = s.s_game_code\r\n" +
				"order by s.s_sale DESC)tbl)\r\n" +
				"where rnum >=1 and rnum <=3";
		RowMapper<HomeDto> gameDtos = new BeanPropertyRowMapper<>(HomeDto.class);
		ArrayList<HomeDto> dtos = (ArrayList<HomeDto>) temp.query(query, gameDtos);
		return dtos;
	}
	//할인율 높은 순서2
	public ArrayList<HomeDto> SaleList2() {
		String query = "select * from(\r\n" + 
				"select rownum rnum, tbl.*\r\n" + 
				"from (SELECT s.s_page_no,g_name, g.g_price, round((g.g_price *((100-s.s_sale)/100)),2) as g_price2 ,s.s_sale,s.s_img_main,s.s_img_1,s.s_img_2,s.s_img_3\r\n" + 
				"from kyj_game g, kyj_store_page s\r\n" + 
				"where g.g_code = s.s_game_code\r\n" +
				"order by s.s_sale DESC)tbl)\r\n" +
				"where rnum >=4 and rnum <=7";
		RowMapper<HomeDto> gameDtos = new BeanPropertyRowMapper<>(HomeDto.class);
		ArrayList<HomeDto> dtos = (ArrayList<HomeDto>) temp.query(query, gameDtos);
		return dtos;
	}
}
