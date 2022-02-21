package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchDAO {
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

	public ArrayList<TsDTO> search_ts(String search_word) {
		connect();
		ArrayList<TsDTO> searchedTsList = new ArrayList<TsDTO>();
		try {
			sql = "select ts_name, ts_img from ts where ts_name like ? or ts_info like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + search_word + "%");
			psmt.setString(2, "%" + search_word + "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				searchedTsList.add(new TsDTO(rs.getString("ts_name"), rs.getString("ts_img")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return searchedTsList;
	}

	public ArrayList<ResDTO> search_res(String search_word) {
		connect();
		ArrayList<ResDTO> searchedResList = new ArrayList<ResDTO>();
		try {
			sql = "select res_name, res_img from res where res_name like ? or res_info like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + search_word + "%");
			psmt.setString(2, "%" + search_word + "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				searchedResList.add(new ResDTO(rs.getString("res_name"), rs.getString("res_img")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return searchedResList;
	}

	public ArrayList<CfDTO> search_cf(String search_word) {
		connect();
		ArrayList<CfDTO> searchedCfList = new ArrayList<CfDTO>();
		try {
			sql = "select cf_name, cf_img from cf where cf_name like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + search_word + "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				searchedCfList.add(new CfDTO(rs.getString("cf_name"), rs.getString("cf_img")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return searchedCfList;
	}

	public ArrayList<AccDTO> search_accom(String search_word) {
		connect();
		ArrayList<AccDTO> searchedAccomList = new ArrayList<AccDTO>();
		try {
			sql = "select accom_name, accom_img from accom where accom_name like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + search_word + "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				searchedAccomList.add(new AccDTO(rs.getString("accom_name"), rs.getString("accom_img")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return searchedAccomList;
	}

	public ArrayList<ParkDTO> search_p(String search_word) {
		connect();
		ArrayList<ParkDTO> searchedPList = new ArrayList<ParkDTO>();
		try {
			sql = "select p_name from p where p_name like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + search_word + "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				searchedPList.add(new ParkDTO(rs.getString("p_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return searchedPList;
	}
}