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
		String query="select n_no, n_title, n_content, n_attach, n_uploader, n_upload_date, n_update_date, g_code\r\n" + 
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

}
