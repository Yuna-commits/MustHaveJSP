package membership;

import common.JDBCconnect;

public class MemberDAO extends JDBCconnect {

	// DB 연결
	public MemberDAO(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}

	// 명시한 아이디/패스워드와 일치하는 회원 정보 DTO 반환
	public MemberDTO getMemberDTO(String id, String password) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id = ? and password = ?";

		try {
			pstmt = conn.prepareStatement(query);
			// 쿼리 인파라미터 설정
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setRegDate(rs.getString("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
