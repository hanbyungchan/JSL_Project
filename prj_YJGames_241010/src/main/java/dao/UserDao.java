package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.SupportDto;
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
	public UserDto UserLogin(String u_id, String u_password) {
		UserDto dto = null;
		String query = "select u_id,u_name,u_level,u_money\r\n" + 
				"from kyj_user\r\n" + 
				"where u_id = '"+u_id+"'\r\n" + 
				"and u_password = '"+u_password+"'\r\n" + 
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
	public UserDto UserInfo(String id){
		UserDto dto = null;
		String query = "select u_id,u_name,u_password,TO_CHAR(u_birth, 'YYYYMMDD') AS u_birth,u_gender,u_email_1,u_email_2,u_money,u_level,u_exit_date\r\n" + 
				"from kyj_user\r\n" + 
				"where u_id = '"+id+"'";
		RowMapper<UserDto> uDto = new BeanPropertyRowMapper<UserDto>(UserDto.class);
		try {
			dto = (UserDto)temp.queryForObject(query, uDto);
		}catch(Exception e) {
			System.out.println("UserInfo()메소드 오류"+query);
			e.printStackTrace();
		}
		return dto;
	}	
	
	//수정
	public int UserUpdate(UserDto dto, String cur_pw) {
		int result = 0;
		String query = "UPDATE kyj_user\r\n" + 
				"set u_name = '"+dto.getU_name()+"',\r\n" + 
				"u_email_1 = '"+dto.getU_email_1()+"',\r\n" + 
				"u_email_2 = '"+dto.getU_email_2()+"',\r\n" + 
				"u_gender = '"+dto.getU_gender()+"',\r\n" + 
				"u_level = '"+dto.getU_level()+"',\r\n" + 
				"u_password  = '"+dto.getU_password()+"'\r\n" + 
				"where u_id = '"+dto.getU_id()+"'\r\n" +
				"and u_password = '"+cur_pw+"'";		
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("UserUpdate() 메소드 오류" + query);}
		return result;
	}
	//수정2
		public int UserUpdate2(UserDto dto) {
			int result = 0;
			String query = "UPDATE kyj_user\r\n" + 
					"set u_name = '"+dto.getU_name()+"',\r\n" + 
					"u_birth = '"+dto.getU_birth()+"',\r\n" + 
					"u_email_1 = '"+dto.getU_email_1()+"',\r\n" + 
					"u_email_2 = '"+dto.getU_email_2()+"',\r\n" + 
					"u_gender = '"+dto.getU_gender()+"',\r\n" + 
					"u_money  = '"+dto.getU_money()+"'\r\n" + 
					"where u_id = '"+dto.getU_id()+"'";	
			try {result = temp.update(query);} 
			catch (Exception e) {System.out.println("UserUpdate() 메소드 오류" + query);}
			return result;
		}
	//탈퇴
	public int UserDelete(String id, String u_exit_date) {
		int result = 0;
		String query = "UPDATE kyj_user\r\n" + 
				"set u_exit_date = '"+u_exit_date+"'\r\n" + 
				"where u_id = '"+id+"'";	
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("UserDelete() 메소드 오류" + query);}
		return result;
	}
	// 비밀번호 암호화
    public String encryptSHA256(String value) throws NoSuchAlgorithmException{
        String encryptData ="";
        
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        sha.update(value.getBytes());
 
        byte[] digest = sha.digest();
        for (int i=0; i<digest.length; i++) {
            encryptData += Integer.toHexString(digest[i] &0xFF).toUpperCase();
        }
        
        return encryptData;
    }
    //카드 충전,결제
    public int Payment(String id, Double money) {
    int result = 0;
	String query = "UPDATE KYJ_USER \r\n" + 
			"SET U_MONEY = '"+money+"'\r\n" + 
			"where u_id = '"+id+"'";		
	try {result = temp.update(query);} 
	catch (Exception e) {System.out.println("Card_recharge() 메소드 오류" + query);}
	return result;
	}
    //문의사항 코드자동생성
  //상점 페이지 번호 자동 생성
  		public String AutoCode_sup() {
  			String no = "";
  			String query = "select nvl(max(to_number(S_CODE)),'0') + 1 as s_code\r\n" + 
  					"from KYJ_SUPPORT";
  			try {
  				no = temp.queryForObject(query, String.class);
  			} catch (Exception e) {System.out.println("AutoCode_sup() 메소드 오류" + query);}
  			
  			return no;
  		}
    //문의사항 등록
	public int SupportSubmit(SupportDto dto) {
		int result = 0;
		String query = "INSERT INTO KYJ_SUPPORT (S_CODE, S_TXT, S_TYPE, S_TITLE, U_ID, S_DATE) "
				+ "VALUES ('"+dto.getS_code()+"', '"+dto.getS_txt()+"', '"+dto.getS_type()+"', '"+dto.getS_title()+"', '"+dto.getU_id()+"','"+dto.getS_date()+"')";
		try {
			result = temp.update(query);
		} catch (Exception e) {
			System.out.println("SupportSubmit() 메소드 오류" + query);
		}
		return result;
	}
	//유저리스트
		public ArrayList<UserDto> UserList() {
			String query = "select u_id,u_name,u_email_1,u_email_2,u_level,u_exit_date\r\n" + 
					"from kyj_user\r\n" + 
					"order by u_id";
			RowMapper<UserDto> Dtos = new BeanPropertyRowMapper<>(UserDto.class);
			ArrayList<UserDto> dtos = (ArrayList<UserDto>) temp.query(query, Dtos);
			return dtos;
		}
	//계정활성화
	public int UserActivate(String u_id) {
		int result = 0;
		String query = "UPDATE kyj_user\r\n" + 
				"set u_exit_date = ''\r\n" + 
				"where u_id = '"+u_id+"'";	
		try {result = temp.update(query);} 
		catch (Exception e) {System.out.println("UserActivate() 메소드 오류" + query);}
		return result;
	}
}
