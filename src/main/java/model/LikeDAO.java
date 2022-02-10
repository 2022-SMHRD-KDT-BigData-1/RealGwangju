package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LikeDAO {
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
			e.printStackTrace();
		} catch (SQLException e) {
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

	public int like(String id, String ts_name) {
		connect();
		System.out.println(id + ", " + ts_name);
//		sql = "insert into visit_like values(?,?)";
		try {
			sql = "insert into visit_like values(visit_like_visit_num_seq.nextval,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, ts_name);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int like_duplicate_check(String id, String ts_name) {
		connect();
		try {
			sql = "select mem_like from visit_like where mem_id=? and mem_like=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, ts_name);
			
			rs = psmt.executeQuery();
			cnt=0;
			if(rs.next()) {
				cnt=1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<String> selectLikeList(String id) {
		connect();
		ArrayList<String> likeList = new ArrayList<String>();
		sql = "select mem_like from visit_like where mem_id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				likeList.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return likeList;
	}

	public int deleteLikeList(String id, String[] delete_ts_nameList) {
		connect();
		cnt = 0;
		try {
			for (int i = 0; i < delete_ts_nameList.length; i++) {
				sql = "delete from visit_like where mem_id=? and mem_like=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, delete_ts_nameList[i]);
				cnt = psmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
