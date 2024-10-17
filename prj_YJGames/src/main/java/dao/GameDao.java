package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.CartDto;
import dto.GameRegiDto;
import dto.HomeDto;
import dto.StoreRegiDto;

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
	//장바구니 리스트
	public ArrayList<CartDto> CartList(String id) {
		String query = "select u_id, c.g_code, g.g_name, round((g.g_price *((100-s.s_sale)/100)),2) as g_price2,g.g_price,s.s_sale\r\n" + 
				"from kyj_cart c, kyj_game g, kyj_store_page s\r\n" + 
				"where c.g_code = g.g_code\r\n" + 
				"and c.g_code = s.s_game_code\r\n" + 
				"and c.u_id = '"+id+"'";
		RowMapper<CartDto> cartDtos = new BeanPropertyRowMapper<>(CartDto.class);
		ArrayList<CartDto> dtos = (ArrayList<CartDto>) temp.query(query, cartDtos);
		return dtos;
	}
	//장바구니 삭제
	public int RemoveCart(String u_id, String g_code) {
		int result = 0;
		String query = "DELETE from kyj_cart\r\n" + 
				"where u_id = '"+u_id+"'\r\n" + 
				"and g_code= '"+g_code+"'";		
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("RemoveCart() 메소드 오류" + query);}
		return result;
	}
	//게임 코드 자동 생성
		public String AutoCode() {
			String code = "";
			String query = "select nvl(max(to_number(g_code)),'0') + 1 as no \r\n" + 
					"from kyj_game";
			
			try {
				code = temp.queryForObject(query, String.class);
			} catch (Exception e) {System.out.println("getNo() 메소드 오류" + query);}
			
			return code;
		}
	//게임 등록(게임 테이블 + 장르 테이블)
	public int RegistGame(GameRegiDto dto) {
		int result = 0;
		String query1 = "insert into kyj_game\r\n" + 
				"(g_code, g_name, g_price, g_file, g_developer, g_grade)\r\n" + 
				"values\r\n" + 
				"('"+dto.getG_code()+"', '"+dto.getG_name()+"', '"+dto.getG_price()+"', '"+dto.getG_file()+"', '"+dto.getG_developer()+"', '"+dto.getG_grade()+"')";
		
		String query2 = "insert into kyj_genre_join\r\n" + 
				"(genre_code, game_code)\r\n" + 
				"values\r\n" + 
				"('"+dto.getGenre_code()+"','"+dto.getG_code()+"')";
		
		try {
			result = temp.update(query1);
			result += temp.update(query2); 
		} catch (Exception e) {System.out.println("RegistGame() 메소드 오류" + query1);}
		
		return result;
	}
	//장르 리스트 불러오기
	public ArrayList<GameRegiDto> genreCheckList() {
		String query = "SELECT genre_code, genre_name\r\n" + 
				"FROM kyj_genre\r\n" + 
				"ORDER BY genre_code + 0 ASC";
		
		RowMapper<GameRegiDto> genreDtos = new BeanPropertyRowMapper<>(GameRegiDto.class);
		ArrayList<GameRegiDto> dtos = (ArrayList<GameRegiDto>) temp.query(query, genreDtos);
	return dtos;
	}
	//상점 페이지 번호 자동 생성
	public String AutoNo() {
		String no = "";
		String query = "select nvl(max(to_number(s_page_no)),'0') + 1 as no \r\n" + 
				"from kyj_store_page";
		
		try {
			no = temp.queryForObject(query, String.class);
		} catch (Exception e) {System.out.println("getNo() 메소드 오류" + query);}
		
		return no;
	}
	//게임 목록 불러오기
	public ArrayList<GameRegiDto> GameSelectList(String name) {
		String query = "select g_code, g_name\r\n" + 
				"from kyj_game\r\n" + 
				"where g_developer = '"+name+"' " +
				"and g_code not in (select s_game_code from kyj_store_page)";
		RowMapper<GameRegiDto> GameDtos = new BeanPropertyRowMapper<>(GameRegiDto.class);
		ArrayList<GameRegiDto> dtos = (ArrayList<GameRegiDto>) temp.query(query, GameDtos);
		
		return dtos;
	}
	//상점 페이지 등록
	public int RegistStore(StoreRegiDto dto) {
		int result = 0;
		String query = "insert into kyj_store_page\r\n" + 
				"(s_page_no, s_game_code, s_game_name, s_info_txt, s_date,\r\n" + 
				"s_spec_1, s_spec_2, s_spec_3, s_spec_4, s_spec_5,\r\n" + 
				"s_img_main, s_img_1, s_img_2, s_img_3, s_icon,\r\n" + 
				"s_video_1, s_video_2, s_video_3, s_sale)\r\n" + 
				"values\r\n" + 
				"('"+dto.getS_page_no()+"', '"+dto.getS_game_code()+"', '"+dto.getS_game_name()+"', '"+dto.getS_info_txt()+"', '"+dto.getS_date()+"',\r\n" + 
				"'"+dto.getS_spec_1()+"', '"+dto.getS_spec_2()+"', '"+dto.getS_spec_3()+"', '"+dto.getS_spec_4()+"', '"+dto.getS_spec_5()+"',\r\n" + 
				"'"+dto.getS_img_main()+"','"+dto.getS_img_1()+"','"+dto.getS_img_2()+"','"+dto.getS_img_3()+"','"+dto.getS_icon()+"',\r\n" + 
				"'"+dto.getS_video_1()+"','"+dto.getS_video_2()+"','"+dto.getS_video_3()+"','"+dto.getS_sale()+"')";
		
		try {
			result = temp.update(query);
		} catch (Exception e) {System.out.println("RegistStore() 메소드 오류" + query);}
		
		return result;
	}
}
