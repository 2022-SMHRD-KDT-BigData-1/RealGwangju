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
//	private String sql;

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
		try {
			String plusViewsSql = "update ts set ts_views = ts_views+1 where ts_name=?";
			psmt = conn.prepareStatement(plusViewsSql);
			psmt.setString(1, ts_name);
			rs = psmt.executeQuery();
			if (rs.next()) {
				String getTsInfoSql = "select ts_tel, ts_time, ts_ct, ts_add, ts_loc, ts_img, ts_info, ts_views from ts where ts_name=?";
				psmt = conn.prepareStatement(getTsInfoSql);
				psmt.setString(1, ts_name);
				rs = psmt.executeQuery();
				if (rs.next()) {
					ts = new TsDTO(ts_name, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return ts;
	}

	public ArrayList<TsDTO> selectRank10() {
		connect();
		ArrayList<TsDTO> tsRank10 = new ArrayList<TsDTO>();
		try {
			String getTsInfoSql = "select ts_name, ts_img from (select ts_name, ts_img from ts order by  ts_views desc) where ROWNUM <=10";
			
			psmt = conn.prepareStatement(getTsInfoSql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				tsRank10.add(
						new TsDTO(rs.getString("ts_name"), rs.getString("ts_img"))
						);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return tsRank10;
	}


}
