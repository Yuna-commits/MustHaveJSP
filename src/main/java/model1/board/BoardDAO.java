package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCconnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBCconnect {

	/**
	 * DB 연결
	 * application로 얻은 오라클 접속 정보(web.xml 정의) 이용
	 */
	public BoardDAO(ServletContext application) {
		super(application);
	}

	/**
	 * 게시물 개수 세기
	 * Map<String, Object> map
	 * "field" : {제목, 내용}
	 *   "key" : 검색어
	 */
	public int selectCount(Map<String, Object> map) {
		int result = 0;
		// 정적 쿼리문 : Statement 객체 사용
		String query = "select count(*) from board";
		// 검색 조건이 있는 경우 : field : {제목, 내용}
		if (map.get("keyword") != null) {
			query += " where " + map.get("field") 
					+ " like '%" + map.get("keyword") + "%'";
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			// count(*)는 반드시 결과값 존재
			rs.next();
			result = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생!");
			e.printStackTrace();
		}

		return result;
	}
	
	/**
	 * 게시물 목록 가져오기
	 */
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String query = "select * from board";
		if (map.get("keyword") != null) {
			query += " where " + map.get("field") 
					+ " like '%" + map.get("keyword") + "%'";
		}
		query += " order by num desc";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setName(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostDate(rs.getDate("post_date"));
				dto.setVisitCount(rs.getString("visit_count"));
				
				result.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생!");
			e.printStackTrace();
		}
		
		return result;
	}
	
}
