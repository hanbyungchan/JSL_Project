package dao;

import org.springframework.jdbc.core.JdbcTemplate;

import common.CommonTemplate;

public class RankDao {
	JdbcTemplate temp = CommonTemplate.getTemplate();
	
	
	//게임 구매 시 다운로드 수 +1 리턴값 없음.
	public void rankHit(String codes) {
		String query="update kyj_ranking\r\n" + 
				"set g_downloaded = g_downloaded + 1 \r\n" + 
				"where g_code = '"+codes+"'";
		int result=0;
		try {
			result = temp.update(query);
			
		}
		catch(Exception e) {
			System.out.println("rankHit() 오류: "+query);
		}
		
		
		
	}
	
	//랭킹 테이블의 데이터들 올라가는 hit 함수 만들기.(함
	//게임 등록시 랭킹 테이블에도 자동적으로 등록(함
	//페이지 자체는 DB대로 랭킹 테이블 나열만 하면 됨.(진행중. html와야됨, 관리자 페이지도 와야됨. --241102-- rank페이지 아직 안옴.
	//컨트롤러 구분을 할까 말까 고민중... 일단 다 만들고 나서 내가 작업하던가 하자 이건.(이건 안할끄야
	
	
	
}
