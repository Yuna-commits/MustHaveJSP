package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnectionPool {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;

	public DBConnectionPool() {
		try {
			// 1. Connection Pool (DataSource) 얻기
			Context initialContext = new InitialContext();
			Context context = (Context) initialContext.lookup("java:comp/env");
			DataSource dataSource = (DataSource) context.lookup("dbcp_myoracle");

			// 2. Connection Pool을 통해 연결 얻기
			conn = dataSource.getConnection();

			System.out.println("DB Connection Pool 연결 성공!!");

		} catch (Exception e) {
			System.out.println("DB Connection Pool 연결 실패!!");
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

			System.out.println("DB Connection Pool 자원 반납");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
