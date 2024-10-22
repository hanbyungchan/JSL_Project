package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("oracle드라이브가 없습니다.");
		}
		String db_url = "jdbc:oracle:thin:@jsl-704:1521:xe";
		String db_user = "track16";
		String db_passward = "1234";
		try {
			con = DriverManager.getConnection(db_url, db_user, db_passward);
		} catch (SQLException e) {
			System.out.println("DB계정 설정 오류~~~~~");
		}
		return con;
	}
	public static void closeDB(Connection con,
						PreparedStatement ps,
						ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
