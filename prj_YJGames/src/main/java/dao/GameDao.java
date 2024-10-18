package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.CartDto;
import dto.GameRegiDto;
import dto.HomeDto;
import dto.ReviewDto;
import dto.ViewDto;

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
	//장바구니 추가
	public int AddCart(String u_id, String g_code) {
		int result = 0;
		String query = "INSERT INTO kyj_cart(u_id,g_code)\r\n" +
				"VALUES ('"+u_id+"', '"+g_code+"')";
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("AddCart() 메소드 오류" + query);}
		return result;
	}
	//게임구매 추가
		public int AddPurchase(String u_id, String g_code) {
			int result = 0;
			String query = "INSERT INTO kyj_purchase_history(u_id,p_code)\r\n" +
					"VALUES ('"+u_id+"', '"+g_code+"')";
			try {result = temp.update(query);} 
			catch (Exception e) {System.out.println("AddPurchase() 메소드 오류" + query);}
			return result;
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
	//장바구니 전체 삭제
	public int RemoveCartAll(String u_id) {
		int result = 0;
		String query = "DELETE from kyj_cart\r\n" + 
				"where u_id = '"+u_id+"'";	
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("RemoveCartAll() 메소드 오류" + query);}
		return result;
	}
	//리뷰 리스트
	public ArrayList<ReviewDto> ReviewList(String step, String code) {
		String query = "select r.u_id, u.u_name, r.g_code, r.r_txt,r.r_recommand, TO_CHAR(r.r_date, 'MM/DD/YYYY') AS r_date\r\n" + 
				"from kyj_review r, kyj_user u\r\n" + 
				"where r.u_id = u.u_id\r\n" +
				"and r.g_code ='"+code+"'\r\n" + 
				""+step+"";
			RowMapper<ReviewDto> reviewDtos = new BeanPropertyRowMapper<>(ReviewDto.class);
			ArrayList<ReviewDto> dtos = (ArrayList<ReviewDto>) temp.query(query, reviewDtos);
			return dtos;
	}
	//리뷰 작성
	public int ReviewSave(ReviewDto dto) {
		int result = 0;
		String query = "INSERT INTO KYJ_REVIEW (U_ID, G_CODE, R_TXT, R_RECOMMAND, R_DATE)\r\n" + 
				"VALUES ('"+dto.getU_id()+"', '"+dto.getG_code()+"', '"+dto.getR_txt()+"', '"+dto.getR_recommand()+"', '"+dto.getR_date()+"')";
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("ReviewSave() 메소드 오류" + query);}
		return result;
	}
	//리뷰 수정
	public int ReviewUpdate(ReviewDto dto) {
		int result = 0;
		String query = "update kyj_review\r\n" + 
				"set r_txt = '"+dto.getR_txt()+"',\r\n" + 
				"r_recommand = '"+dto.getR_recommand()+"',\r\n" + 
				"r_date = '"+dto.getR_date()+"'\r\n" + 
				"where g_code ='"+dto.getG_code()+"'\r\n" + 
				"and u_id='"+dto.getU_id()+"'";
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("ReviewUpdate() 메소드 오류" + query);}
		return result;
	}
	//리뷰 삭제
	public int ReviewDelete(String id, String code) {
		int result = 0;
		String query = "DELETE from kyj_review\r\n" + 
				"where u_id ='"+id+"'\r\n" + 
				"and g_code = '"+code+"'";
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("ReviewDelete() 메소드 오류" + query);}
		return result;
	}	
	//내 리뷰
	public ReviewDto MyReview(String id, String code) {
		ReviewDto dto = null;
		String query = "select r.u_id, u.u_name, r.g_code, r.r_txt,r.r_recommand, TO_CHAR(r.r_date, 'MM/DD/YYYY') AS r_date\r\n" + 
				"from kyj_review r, kyj_user u\r\n" + 
				"where r.u_id = u.u_id\r\n" + 
				"and r.g_code = '"+code+"'\r\n" + 
				"and r.u_id = '"+id+"'";
		RowMapper<ReviewDto> rDto = new BeanPropertyRowMapper<ReviewDto>(ReviewDto.class);
		try {
			dto = (ReviewDto)temp.queryForObject(query, rDto);
		}catch(Exception e) {
			System.out.println("MyReview()메소드 오류"+query);
			e.printStackTrace();
		}
		return dto;
	}
	//내 리뷰 리스트
		public ArrayList<ReviewDto> MyReviewList(String id) {
			String query = "select r.u_id, u.u_name, r.g_code,g.g_name, r.r_txt,r.r_recommand, TO_CHAR(r.r_date, 'MM/DD/YYYY') AS r_date\r\n" + 
					"from kyj_review r, kyj_user u, kyj_game g\r\n" + 
					"where r.u_id = u.u_id\r\n" + 
					"and r.g_code = g.g_code\r\n" + 
					"and r.u_id = '"+id+"'\r\n" + 
					"order by r_date DESC";
				RowMapper<ReviewDto> reviewDtos = new BeanPropertyRowMapper<>(ReviewDto.class);
				ArrayList<ReviewDto> dtos = (ArrayList<ReviewDto>) temp.query(query, reviewDtos);
				return dtos;
		}
	//게임 이름 찾기
			public ViewDto GameName(String code){
				String query = "select s_page_no, s_game_name\r\n" + 
						"from kyj_store_page\r\n" + 
						"where s_game_code = '"+code+"'";
				ViewDto dto = null;
				RowMapper<ViewDto> s_ViewDto =new BeanPropertyRowMapper<>(ViewDto.class);
				
				try {
					dto = (ViewDto)temp.queryForObject(query, s_ViewDto);
				}
				catch(Exception e){
					System.out.println("GameName() 오류: "+query);
				}
				
				return dto;
			}
	//게임 상점 개별 페이지
		public ViewDto StorePageView(int s_page_no){
			String query = "select s.s_page_no, s.s_game_code, s.s_game_name, s.s_info_txt, g.g_grade, \r\n" + 
					"to_char(s.s_date, 'yyyy-MM-dd') as s_date, s.s_sale,\r\n" + 
					"s.s_spec_1, s.s_spec_2, s.s_spec_3, s.s_spec_4, s.s_spec_5,\r\n" + 
					"s.s_img_main, s.s_img_1, s.s_img_2, s.s_img_3, s.s_icon,\r\n" + 
					"s.s_video_1, s.s_video_2, s.s_video_3,\r\n" + 
					"g.g_price, round((g.g_price *((100-s.s_sale)/100)),2) as g_sale_price\r\n" + 
					"from KYJ_STORE_PAGE s, KYJ_GAME g\r\n" + 
					"where s.s_game_code = g.g_code and s.s_page_no = '"+s_page_no+"'";
			ViewDto dto = null;
			RowMapper<ViewDto> s_ViewDto =new BeanPropertyRowMapper<>(ViewDto.class);
			
			try {
				dto = (ViewDto)temp.queryForObject(query, s_ViewDto);
			}
			catch(Exception e){
				System.out.println("StorePageView() 오류: "+query);
			}
			
			return dto;
		}
		//번호 자동 생성
		public String AutoNo() {
			String no = "";
			String query = "select nvl(max(to_number(g_code)),'0') + 1 as no \r\n" + 
					"from kyj_game";
					
			try {
				no = temp.queryForObject(query, String.class);
			} catch (Exception e) {System.out.println("getNo() 메소드 오류" + query);}
					
			return no;
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
		//게임 구매
		public int PurchaseGame(String g_code, String u_id) {
			int result = 0;
			String query = "INSERT INTO KYJ_PURCHASE_HISTORY(P_CODE, U_ID) \r\n" + 
					"VALUES ('"+g_code+"', '"+u_id+"')";
			try {
				result = temp.update(query);
			} catch (Exception e) {System.out.println("PurchaseGame() 메소드 오류" + query);}
				return result;
		}
		//게임코드 리스트 불러오기
		public ArrayList<String> GameCodeList(String u_id) {
			String query = "select g_code\r\n" +
			"from kyj_cart\r\n" +
			"where u_id = '"+u_id+"'";
			 RowMapper<String> gameCodeMapper = (rs, rowNum) -> rs.getString("g_code");
	    ArrayList<String> gameCodes = (ArrayList<String>) temp.query(query, gameCodeMapper);
	    return gameCodes;
		}
		//구매여부
		public String Whether_to_purchase(String u_id, String g_code) {
			String query = "select COUNT(*) as count\r\n" + 
					"from kyj_purchase_history\r\n" + 
					"where u_id = '101'\r\n" + 
					"and p_code ='1'";
			String result = temp.queryForObject(query, new Object[]{u_id, g_code}, String.class);
		    return result;
		}
}
