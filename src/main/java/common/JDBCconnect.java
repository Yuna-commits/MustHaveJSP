package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBCconnect {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;

	public JDBCconnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";

			conn = DriverManager.getConnection(url, "musthave", "1234");

			System.out.println("DB 연결 성공!! (기본 생성자)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public JDBCconnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공!! (인수 생성자 1)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public JDBCconnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			conn = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공!! (인수 생성자 2)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결 해제
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}

			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
