package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.HomeDto;

public class GameDao {
	
	JdbcTemplate temp = CommonTemplate.getTemplate();
	//홈페이지, 이름 검색페이지
	public ArrayList<HomeDto> GameList(String search) {
		String query = "select * from(\r\n" + 
				"select rownum rnum, tbl.*\r\n" + 
				"from (SELECT s.s_list_no,g_name, g.g_price,s.s_sale,s.s_attach\r\n" + 
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
					"from (SELECT s.s_list_no,g_name, g.g_price,s.s_sale,s.s_attach\r\n" + 
					"from kyj_game g, kyj_store_page s\r\n" + 
					"where g.g_code = s.s_game_code\r\n" + 
					"and g.g_genre  like '%"+search+"%') tbl)";
			RowMapper<HomeDto> gameDtos = new BeanPropertyRowMapper<>(HomeDto.class);
			ArrayList<HomeDto> dtos = (ArrayList<HomeDto>) temp.query(query, gameDtos);
			return dtos;
		}
}
