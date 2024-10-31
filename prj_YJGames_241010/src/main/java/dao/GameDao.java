package dao;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.CartDto;
import dto.GameRegiDto;
import dto.GenreDto;
import dto.HomeDto;
import dto.LibraryDto;
import dto.ReviewDto;
import dto.StoreRegiDto;
import dto.ViewDto;

public class GameDao {
	
	JdbcTemplate temp = CommonTemplate.getTemplate();
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
		String query = "INSERT INTO kyj_purchase_history(u_id,g_code)\r\n" +
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
		try {dto = (ViewDto)temp.queryForObject(query, s_ViewDto);}
		catch(Exception e){System.out.println("GameName() 오류: "+query);}
		return dto;
	}
	//게임 상점 개별 페이지
	public ViewDto StorePageView(int s_page_no){
		String query = "select s.s_page_no, s.s_game_code, s.s_game_name, s.s_info_txt, g.g_grade, \r\n" + 
				"to_char(s.s_date, 'yyyy-MM-dd') as s_date, s.s_sale,\r\n" + 
				"s.s_spec_1, s.s_spec_2, s.s_spec_3, s.s_spec_4, s.s_spec_5,\r\n" + 
				"s.s_img_main, s.s_img_1, s.s_img_2, s.s_img_3, s.s_icon,\r\n" + 
				"s.s_video_1, s.s_video_2, s.s_video_3,\r\n" + 
				"g.g_price, round((g.g_price *((100-s.s_sale)/100)),2) as g_sale_price,g.g_file\r\n" + 
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
	//게임 구매
	public int PurchaseGame(String g_code, String u_id) {
		int result = 0;
		String query = "INSERT INTO KYJ_PURCHASE_HISTORY(G_CODE, U_ID) \r\n" + 
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
	//구매여부 FROM 
	public int Whether_to_purchase(String u_id, String g_code) {
		String query = "SELECT COUNT(u_id) FROM kyj_purchase_history WHERE u_id = ? AND g_code = ?";
		int count = 0;
		try {
		     count = temp.queryForObject(query, new Object[]{u_id, g_code}, Integer.class);
		} catch (Exception e) {
		    System.out.println("Whether_to_cart() 오류: " + query);
		    e.printStackTrace(); // 예외의 스택 트레이스를 출력하여 문제를 더 잘 파악할 수 있도록 합니다.
		}
		return count;
	}
	//장바구니여부
	public int Whether_to_cart(String u_id, String g_code) {
		String query = "SELECT COUNT(u_id) FROM kyj_cart WHERE u_id = ? AND g_code = ?";
		int count = 0;
		try {
		    count = temp.queryForObject(query, new Object[]{u_id, g_code}, Integer.class);
		} catch (Exception e) {
		    System.out.println("Whether_to_cart() 오류: " + query);
		    e.printStackTrace(); // 예외의 스택 트레이스를 출력하여 문제를 더 잘 파악할 수 있도록 합니다.
		}
		return count;
	}
		//라이브러리 게임목록칸
		public ArrayList<LibraryDto> Library_game_List(String u_id, String search) {
			String query = "select s.s_game_name as g_name,s.s_game_code as g_code, s.s_img_main from kyj_purchase_history h, kyj_store_page s\r\n" + 
					"where h.g_code = s.s_game_code  and h.u_id = '"+u_id+"'  AND LOWER(s.s_game_name) LIKE '%"+search+"%'";
			RowMapper<LibraryDto> gameDtos = new BeanPropertyRowMapper<>(LibraryDto.class);
			ArrayList<LibraryDto> dtos = (ArrayList<LibraryDto>) temp.query(query, gameDtos);
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
		//게임 등록(게임 테이블 + 장르 테이블)
		public int RegistGame(GameRegiDto dto) {
			int result = 0;
			String query1 = "insert into kyj_game\r\n" + 
					"(g_code, g_name, g_price, g_file, g_developer, g_grade)\r\n" + 
					"values\r\n" + 
					"('"+dto.getG_code()+"', '"+dto.getG_name()+"', '"+dto.getG_price()+"', '"+dto.getG_file()+"', '"+dto.getG_developer()+"', '"+dto.getG_grade()+"')";
			try {
				result = temp.update(query1);
			} catch (Exception e) {
				System.out.println("RegistGame() 메소드 오류 첫번째" + query1);
			}
			List<String> genreCodes = dto.getGenre_code();
			for(String genre : genreCodes) {
				String query2 = "insert into kyj_genre_join\r\n" + 
						"(genre_code, game_code)\r\n" + 
						"values\r\n" + 
						"('"+genre+"','"+dto.getG_code()+"')";
			try {
					result += temp.update(query2); 
				} catch (Exception e) {System.out.println("RegistGame() 메소드 오류 두번째" + query2);}
			}
					
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
		//장르 리스트 불러오기
		public ArrayList<GenreDto> genreCheckList() {
			String query = "SELECT genre_code, genre_name\r\n" + 
					"FROM kyj_genre\r\n" + 
					"ORDER BY genre_code + 0 ASC";
			RowMapper<GenreDto> genreDtos = new BeanPropertyRowMapper<>(GenreDto.class);
			ArrayList<GenreDto> dtos = (ArrayList<GenreDto>) temp.query(query, genreDtos);
		return dtos;
		}
		//게임 실행
		public static void EXE(String code) {
			 // 현재 사용자의 홈 경로 가져오기
	        String userHome = System.getProperty("user.home");
	        // 다운로드 폴더 경로 설정
	        String downloadDir = userHome + File.separator + "Downloads";
	        // 실행할 파일 이름 설정
	        String fileName = code; // 게임 이름으로 실행할 파일 이름
	        // 파일 객체 생성
	        File file = new File(downloadDir, fileName);
	        // 파일 실행
	        if (file.exists()) {
	            try {
	                Desktop.getDesktop().open(file);
	                System.out.println("File executed: " + file.getAbsolutePath());
	            } catch (IOException e) {
	                e.printStackTrace();
	                System.out.println("Failed to execute the file.");
	            }
	        } else {
	            System.out.println("File does not exist: " + file.getAbsolutePath());
	        }
	    }
	//게임 장르 리스트
	public ArrayList<ViewDto> GameGenreList(String s_page_no){
		String query = "select g.genre_name from kyj_store_page s, kyj_genre_join j, kyj_genre g\r\n" + 
				"where s.s_game_code = j.game_code and j.genre_code = g.genre_code\r\n" + 
				"and s.s_game_code = '"+s_page_no+"'";
		RowMapper<ViewDto> Dtos = new BeanPropertyRowMapper<>(ViewDto.class);
		ArrayList<ViewDto> dtos = (ArrayList<ViewDto>) temp.query(query, Dtos);
		return dtos;
	}
	//뷰페이지 리뷰 1개(good)
	public ReviewDto ViewRe1(String no){
		String query = "SELECT r.r_txt, u.u_name FROM kyj_review r, kyj_store_page s, kyj_user u\r\n" + 
				"WHERE r.g_code = s.s_game_code AND r.u_id = u.u_id AND r.r_recommand = 'g' AND ROWNUM = 1\r\n" + 
				"AND r.g_code = '"+no+"'\r\n" + 
				"order by r.r_date DESC";
		ReviewDto dto = null;
		RowMapper<ReviewDto> Dto =new BeanPropertyRowMapper<>(ReviewDto.class);
		try {dto = (ReviewDto)temp.queryForObject(query, Dto);}
		catch(Exception e){System.out.println("ViewRe1() 오류: "+query);}
		return dto;
	}
	//뷰페이지 리뷰1개(bad)
	public ReviewDto ViewRe2(String no){
		String query = "SELECT r.r_txt, u.u_name FROM kyj_review r, kyj_store_page s, kyj_user u\r\n" + 
				"WHERE r.g_code = s.s_game_code AND r.u_id = u.u_id AND r.r_recommand = 'b' AND ROWNUM = 1\r\n" + 
				"AND r.g_code = '"+no+"'\r\n" + 
				"order by r.r_date DESC";
		ReviewDto dto = null;
		RowMapper<ReviewDto> Dto =new BeanPropertyRowMapper<>(ReviewDto.class);
		try {dto = (ReviewDto)temp.queryForObject(query, Dto);}
		catch(Exception e){System.out.println("ViewRe2() 오류: "+query);}
		return dto;
	}
}
