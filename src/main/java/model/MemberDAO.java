package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.MemberDTO;

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
		sql = "insert into member values(?,?,?,?,?)";
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

	public MemberDTO memberLogin(String id, String pw) {
		connect();
		MemberDTO member = null;
		sql = "select mem_nick, mem_age, mem_gen from member where mem_id=? and mem_pw=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if (rs.next()) {
				String nick = rs.getString(1);
				int age = rs.getInt(2);
				String gen = rs.getString(3);
				member = new MemberDTO(id, null, nick, age ,gen);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}
	
	public int checkId(String id) {
		connect();
		int idCheck = 0;
		
		try {
			sql = "select * from member where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next() || id.equals("")) {
				idCheck = 0;
			} else {
				idCheck = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return idCheck;
		
		
	}
	
}
