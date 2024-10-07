package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.HomeDto;
import dto.ViewDto;

public class GameDao {
	
	JdbcTemplate temp = CommonTemplate.getTemplate();
	
	//게임 상점 개별 페이지
	public ViewDto StorePageView(int s_page_no){
		
		String query = "select s_page_no, s_game_code, s_game_name, s_info_txt, to_char(s_date, 'yyyy-MM-dd') as s_date, s_sale,\r\n" + 
				"s_spec_1, s_spec_2, s_spec_3, s_spec_4, s_spec_5,\r\n" + 
				"s_img_main, s_img_1, s_img_2, s_img_3, s_icon,\r\n" + 
				"s_video_1, s_video_2, s_video_3\r\n" + 
				"from kyj_store_page\r\n" + 
				"where s_page_no = '"+s_page_no+"'";
		
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
	

}
