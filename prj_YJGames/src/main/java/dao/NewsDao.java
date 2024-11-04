package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.NewsDto;

public class NewsDao {
	
	JdbcTemplate temp = CommonTemplate.getTemplate();
	
	//뉴스 상세보기
	public NewsDto getNewsView(String n_no){
		String query="select n_no, n_title, n_content, n_attach, n_uploader, TO_CHAR(n_upload_date, 'MM-DD-YYYY') AS n_upload_date, TO_CHAR(n_update_date, 'MM-DD-YYYY') AS n_update_date, g_code\r\n" + 
				"from kyj_news\r\n" + 
				"where n_no = '"+n_no+"'";
		NewsDto dto = new NewsDto();
		
		
		RowMapper<NewsDto> rDto = new BeanPropertyRowMapper<NewsDto>(NewsDto.class);
		try {
			dto = (NewsDto)temp.queryForObject(query, rDto);
		}
		catch(Exception e) {
			System.out.println("getNewsView()메소드 오류: "+query);
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	//업로더(특정 게임)별 뉴스 dtos
	public ArrayList<NewsDto> getUploaderNewsList(String g_code){
		String query="select n_no, n_title, n_content, n_attach, n_uploader, n_upload_date, n_update_date, g_code\r\n" + 
				"from kyj_news\r\n" + 
				"where g_code = '"+g_code+"'";
		
		RowMapper<NewsDto> newsDtos = new BeanPropertyRowMapper<>(NewsDto.class);
		ArrayList<NewsDto> dtos = (ArrayList<NewsDto>) temp.query(query, newsDtos);
		
		return dtos;
	}
	
	//전체 뉴스 dtos 
	public ArrayList<NewsDto> getAllNewsList(){
		String query="select n_no, n_title, n_content, n_attach, n_uploader, n_upload_date, n_update_date, g_code\r\n" + 
				"from kyj_news";
		
		RowMapper<NewsDto> newsDtos = new BeanPropertyRowMapper<>(NewsDto.class);
		ArrayList<NewsDto> dtos = (ArrayList<NewsDto>) temp.query(query, newsDtos);
		
		return dtos;
	}
	//특정 게임 뉴스 dtos
		public ArrayList<NewsDto> getParticularNewsList(String g_code) {
			String query="select n_no, n_title, n_content, n_attach, n_uploader, n_upload_date, n_update_date, g_code\r\n" + 
					"from kyj_news\r\n" + 
					"where g_code = '"+g_code+"'";
			
			RowMapper<NewsDto> newsDtos = new BeanPropertyRowMapper<>(NewsDto.class);
			ArrayList<NewsDto> dtos = (ArrayList<NewsDto>) temp.query(query, newsDtos);
			return dtos;
		}
	//news넘버 생성
	public String AutoCode() {
		String code = "";
		String query = "select nvl(max(to_number(n_no)),'0') + 1 as n_no\r\n" + 
			"from kyj_news";
		try {
			code = temp.queryForObject(query, String.class);
		} catch (Exception e) {System.out.println("AutoCode() 메소드 오류" + query);}
		return code;
	}
	//news생성
		public int NewsSave(NewsDto dto) {
			int result = 0;
			String query = "INSERT INTO KYJ_NEWS (N_NO, N_TITLE, N_CONTENT, N_ATTACH, N_UPLOADER, N_UPLOAD_DATE, G_CODE)\r\n" + 
					"VALUES ('"+dto.getN_no()+"', '"+dto.getN_title()+"', '"+dto.getN_content()+"', '"+dto.getN_attach()+"','"+dto.getN_uploader()+"', '"+dto.getN_upload_date()+"','"+dto.getG_code()+"')";
			
			try {result = temp.update(query);} 
			catch (Exception e) {System.out.println("NewsSave() 메소드 오류" + query);}
			return result;
		}
	//news업데이트
	public int NewsUpdate(NewsDto dto) {
		int result = 0;
		String query = "UPDATE KYJ_NEWS\n" + 
				"SET N_TITLE = '"+dto.getN_title()+"',\n" + 
				"N_CONTENT = '"+dto.getN_content()+"', \n" + 
				"N_ATTACH = '"+dto.getN_attach()+"', \n" + 
				"N_UPDATE_DATE = TO_DATE('"+dto.getN_update_date()+"')\n" + 
				"where n_no = '"+dto.getN_no()+"'";
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("NewsUpdate() 메소드 오류" + query);}
		return result;
	}
	//news삭제
	public int NewsDelete(String no) {
		int result = 0;
		String query = "DELETE from kyj_news\r\n" + 
				"where n_no ='"+no+"'";
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("NewsDelete() 메소드 오류" + query);}
		return result;
	}	
}
