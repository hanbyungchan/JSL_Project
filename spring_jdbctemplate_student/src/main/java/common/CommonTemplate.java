package common;

import org.springframework.jdbc.core.JdbcTemplate;

public class CommonTemplate {
	public static JdbcTemplate tmplate;

	public static JdbcTemplate getTmplate() {
		return tmplate;
	}

	public static void setTmplate(JdbcTemplate tmplate) {
		CommonTemplate.tmplate = tmplate;
	}
	
	
	
	
}
