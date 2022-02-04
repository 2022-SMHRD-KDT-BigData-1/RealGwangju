package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MemberDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;

	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_3_0115";
			String password = "smhrd3";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// OracleDriver 클래스가 해당 위치에 없는경우(ojdbc6.jar 미포함)
			// 해결방안: WEB-INF->lib->ojdbc6.jar 저장

			// 2. OracleDriver 경로가 오타인경우
			e.printStackTrace();
		} catch (SQLException e) {
			// DB연결 정보가 정확하지 않을 경우

			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int memberJoin(MemberDTO member) {

		connect();

		sql = "insert into web_member values(?,?,?,?,?)";
		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getMem_id());
			psmt.setString(2, member.getMem_pw());
			psmt.setString(3, member.getMem_nick());
			psmt.setInt(4, member.getMem_age());
			psmt.setString(5, member.getMem_gen());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int memberLogin(String id, String pw) {

		connect();

		sql = "select mem_pw from member where mem_id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).contentEquals(pw)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디 없음
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return -2; // DB오류
	}
	
}
