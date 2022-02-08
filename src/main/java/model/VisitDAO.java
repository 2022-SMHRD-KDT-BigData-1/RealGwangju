package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class VisitDAO {
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

	public TsDTO selectTsInfo(String ts_name) {
		connect();
		TsDTO ts = null;
		sql = "select ts_tel, ts_time, ts_ct, ts_add, ts_loc, ts_img, ts_info from ts where ts_name=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ts_name);
			rs = psmt.executeQuery();
			if(rs.next()) {
				ts = new TsDTO(
							ts_name,
							rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getInt(5),
							rs.getString(6),
							rs.getString(7)
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return ts;
	}
}

