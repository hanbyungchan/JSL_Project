package dao;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.StudentDto;

public class StudentDao {
	
	JdbcTemplate temp = CommonTemplate.getTmplate();
	
	
	public int confirm(String syear, String sclass, String no) {
		int result=0;
		String query="SELECT COUNT(*) as result\r\n" + 
				"FROM student_남승현\r\n" + 
				"WHERE syear = '"+syear+"' and sclass ='"+sclass+"' and no ='"+no+"'";
		
		result = temp.queryForObject(query, Integer.class);
		
		
		//1이면 중복, 0이면 중복x
		return result;
	}
	
	
	public int insertStudent(String syear, String sclass, String no, String name, int kor, int eng, int math) {
		String query="insert into student_남승현\r\n" + 
				"(syear, sclass, no, name, kor, eng, math)\r\n" + 
				"values\r\n" + 
				"('"+syear+"', '"+sclass+"', '"+no+"', '"+name+"', "+kor+", "+eng+", "+math+")\r\n";
		
		int result =0;
		try {
			result = temp.update(query);
			
		}
		catch(Exception e) {
			System.out.println("updateStudentInfo() 오류: "+query);
		}
		
		//성공시1, 실패시0
		return result;
	}
	
	public int deletStudentInfo(String syear, String sclass, String no) {
		
		String query="delete from student_남승현\r\n" + 
				"where syear ='"+syear+"' and sclass='"+sclass+"' and no ='"+no+"'";
		int result=0;
		
		try {
			result = temp.update(query);
		}
		catch(Exception e) {
			System.out.println("deletStudentInfo() 오류: "+query);
		}
		
		
		return result;
	}
	
	public int updateStudentInfo(StudentDto dto) {
		String query="update student_남승현\r\n" + 
				"set name='"+dto.getName()+"', kor="+dto.getKor()+", eng="+dto.getEng()+", math="+dto.getMath()+"\r\n" + 
				"where syear='"+dto.getSyear()+"' and sclass='"+dto.getSclass()+"' and no='"+dto.getNo()+"'";
		
		int result =0;
		try {
			result = temp.update(query);
			
		}
		catch(Exception e) {
			System.out.println("updateStudentInfo() 오류: "+query);
		}
		
		//성공시1, 실패시0
		return result;
	}
	
	public StudentDto getStudentDetailInfo(String t_year, String t_class, String t_no){
		
		String query="select syear, sclass, no, name, kor, eng, math\r\n" + 
				"from student_남승현\r\n" + 
				"where syear='"+t_year+"'\r\n" + 
				"and sclass='"+t_class+"'\r\n" + 
				"and no='"+t_no+"'";
		
		StudentDto dto = null;
		RowMapper<StudentDto> studentDto =new BeanPropertyRowMapper<>(StudentDto.class);
		
		try {
		dto = (StudentDto)temp.queryForObject(query, studentDto);
		}
		catch(Exception e){
			System.out.println("getMemberView() 오류: "+query);
		}
		
		
		return dto;
	}
	
	public ArrayList<StudentDto> getStudentList(){
		
		
		String query="select syear, sclass, no, name, kor, eng, math\r\n" + 
				"from student_남승현\r\n" + 
				"order by syear, sclass, no asc";
		
		
		
		//System.out.println("query: "+ query);
		
		RowMapper<StudentDto> studentDtos =new BeanPropertyRowMapper<>(StudentDto.class);
		ArrayList<StudentDto> dtos = (ArrayList<StudentDto>)temp.query(query, studentDtos);
		
		
		
		return dtos;
	}
	
	
	/*
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public ArrayList<StudentDto> getStudentList_ori(String s_select, String s_search, String s_syear, String s_sclass){
		ArrayList<StudentDto> dtos =  new ArrayList<StudentDto>();
		String query="select syear, sclass, no, name, kor, eng, math\r\n" + 
				"from student_남승현\r\n" + 
				"where syear like '%"+s_syear+"%' and sclass like '%"+s_sclass+"%' and no like '%"+s_search+"%'" +
				"order by syear, sclass, no asc";
	
		
		
		if(s_select.equals("s_sName")) {
			query="select syear, sclass, no, name, kor, eng, math\r\n" + 
					"from student_남승현\r\n" + 
					"where syear like '%"+s_syear+"%' and sclass like '%"+s_sclass+"%' and no name '%"+s_search+"%'" +
					"order by syear, sclass, no asc";
		}
		
		
		try {
			con = DBConnection.getConnection();	//구축해둔 커넥션으로 연결
			ps = con.prepareStatement(query);	//쿼리문 삽입 후 실행
			rs = ps.executeQuery();				//쿼리문에 따라 선별한 데이터 rs에 저장
			while(rs.next()) {
				String syear = rs.getString("syear");
				String sclass = rs.getString("sclass");
				String no = rs.getString("no");
				String name = rs.getString("name");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int math = rs.getInt("math");
				
				StudentDto dto = new StudentDto(syear, sclass, no, name, kor, eng, math);
				dtos.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("getStudentList() 메소드 오류");
			System.out.println("query: "+query);
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		
		
		
		return dtos;
	}
	
	public StudentDto getStudentDetailInfo(String t_year, String t_class, String t_no){
		
		StudentDto dto = new StudentDto();
		String query="select syear, sclass, no, name, kor, eng, math\r\n" + 
				"from student_남승현\r\n" + 
				"where syear='"+t_year+"'\r\n" + 
				"and sclass='"+t_class+"'\r\n" + 
				"and no='"+t_no+"'";
		
		try {
			con = DBConnection.getConnection();	//구축해둔 커넥션으로 연결
			ps = con.prepareStatement(query);	//쿼리문 삽입 후 실행
			rs = ps.executeQuery();				//쿼리문에 따라 선별한 데이터 rs에 저장
			while(rs.next()) {
				String syear = rs.getString("syear");
				String sclass = rs.getString("sclass");
				String no = rs.getString("no");
				String name = rs.getString("name");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int math = rs.getInt("math");
				
				dto = new StudentDto(syear, sclass, no, name, kor, eng, math);
				
				
			}
			
		} catch (SQLException e) {
			System.out.println("getStudentDetailInfo() 메소드 오류");
			System.out.println("query: "+query);
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		
		
		return dto;
	}
	
	public int insertStudent(String syear, String sclass, String no, String name, int kor, int eng, int math) {
		int result=0;
		String query="insert into student_남승현\r\n" + 
				"(syear, sclass, no, name, kor, eng, math)\r\n" + 
				"values\r\n" + 
				"('"+syear+"', '"+sclass+"', '"+no+"', '"+name+"', "+kor+", "+eng+", "+math+")\r\n";
		
		try {
			con = DBConnection.getConnection();	//구축해둔 커넥션으로 연결
			ps = con.prepareStatement(query);	//쿼리문 삽입 후 실행
			result = ps.executeUpdate();		//삽입된 행 수를 int로 리턴
			
			
			
		}
		catch(Exception e) {
			System.out.println("insertStudent() 오류\rquery: "+query);
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		
		
		
		return result;
	}
	
	public int updateStudentInfo(StudentDto dto) {
		int result=0;
		String query="update student_남승현\r\n" + 
				"set name='"+dto.getName()+"', kor="+dto.getKor()+", eng="+dto.getEng()+", math="+dto.getMath()+"\r\n" + 
				"where syear='"+dto.getSyear()+"' and sclass='"+dto.getSclass()+"' and no='"+dto.getNo()+"'";
		
		try {
			con = DBConnection.getConnection();	//구축해둔 커넥션으로 연결
			ps = con.prepareStatement(query);	//쿼리문 삽입 후 실행
			result = ps.executeUpdate();		//삽입된 행 수를 int로 리턴
			
			
			
		}
		catch(Exception e) {
			System.out.println("updateStudentInfo() 오류\rquery: "+query);
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		
		//성공시1, 실패시0
		return result;
	}
	
	public int deletStudentInfo(String syear, String sclass, String no) {
		int result=0;
		String query="delete from student_남승현\r\n" + 
				"where syear ='"+syear+"' and sclass='"+sclass+"' and no ='"+no+"'";
		
		try {
			con = DBConnection.getConnection();	//구축해둔 커넥션으로 연결
			ps = con.prepareStatement(query);	//쿼리문 삽입 후 실행
			result = ps.executeUpdate();		//삽입된 행 수를 int로 리턴
			
			
			
		}
		catch(Exception e) {
			System.out.println("deletStudentInfo() 오류\rquery: "+query);
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		
		return result;
	}
	
	*/
	
}
