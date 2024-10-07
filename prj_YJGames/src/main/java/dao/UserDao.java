package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.UserDto;

public class UserDao {
	JdbcTemplate temp = CommonTemplate.getTemplate();
	
	//등록
	public int UserSave(UserDto dto) {
		int result = 0;
		String query = "insert into kyj_user\r\n" + 
				"(u_id, u_name, u_password, u_birth, u_gender, u_email_1, u_email_2, u_level)\r\n" + 
				"values\r\n" + 
				"('"+dto.getU_id()+"','"+dto.getU_name()+"','"+dto.getU_password()+"','"+dto.getU_birth()+"','"+dto.getU_gender()+"','"+dto.getU_email_1()+"','"+dto.getU_email_2()+"','"+dto.getU_level()+"')";
		
		try {
			result = temp.update(query);
		} catch (Exception e) {
			System.out.println("UserSave() 메소드 오류" + query);
		}
		
		return result;
	}
	
	//로그인
	public UserDto UserLogin(String id, String pw) {
		UserDto dto = null;
		String query = "select u_name\r\n" + 
				"from kyj_user\r\n" + 
				"where u_id = 'abc123'\r\n" + 
				"and u_password = '1234'\r\n" + 
				"and u_exit_date is null";
		
		RowMapper<UserDto> UserDtos = new BeanPropertyRowMapper<>(UserDto.class);
		try {
		dto = (UserDto)temp.queryForObject(query, UserDtos); 
		} catch (Exception e) {
			System.out.println("UserLogin() 메소드 오류" + query);
		}
		
		return dto;
	}
	
	//중복검사
	public int userCheckId(String id) {
		int count = 0;
		String query = "select count(*) as count " + 
				"from kyj_user " + 
				"where u_id = '"+id+"'";
		
		 try {
		        count = temp.queryForObject(query, Integer.class);
		    } catch (Exception e) {
		        System.out.println("userCheckId() 메소드 오류: " + query);
		    }
		
		return count;
	}
	
	//내 정보
	
	
	//수정
	
	
	//탈퇴
}
