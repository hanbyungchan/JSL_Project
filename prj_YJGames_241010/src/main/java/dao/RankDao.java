package dao;

import org.springframework.jdbc.core.JdbcTemplate;

import common.CommonTemplate;

public class RankDao {
	JdbcTemplate temp = CommonTemplate.getTemplate();
	
	//랭킹 테이블의 데이터들 올라가는 hit 함수 만들기.
	//게임 등록시 랭킹 테이블에도 자동적으로 등록
	//페이지 자체는 DB대로 랭킹 테이블 나열만 하면 됨.
	//컨트롤러 구분을 할까 말까 고민중... 일단 다 만들고 나서 내가 작업하던가 하자 이건.
	
	
	
}
