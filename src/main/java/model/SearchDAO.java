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

	public int countPopularSearchWord(String word) {
		cnt = 0;
		connect();
		try {
			// 이미 검색어가 디비에 있으면 +1 없으면 추가
			sql = "select word from popularSearchWord where word=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, word);
			cnt = psmt.executeUpdate();
			if (cnt > 0) {
				cnt = 0;
				sql = "update popularSearchWord set word_count=word_count+1 where word=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, word);
				cnt = psmt.executeUpdate();

			} else {
				cnt = 0;
				sql = "insert into popularSearchWord (word) values(?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, word);
				cnt = psmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<String> selectPopularSearchWord() {
		connect();
		ArrayList<String> searchedPopularWordList = new ArrayList<String>();
		try {
			sql = "select word from popularSearchWord where rownum < 11 order by word_count desc";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				searchedPopularWordList.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return searchedPopularWordList;
	}

	public ArrayList<TsDTO> seeMore_ts(String search_word, int page) {
		connect();
		ArrayList<TsDTO> searchedTsList = new ArrayList<TsDTO>();
		int startNum = (page - 1) * 9 + 1;
		int endNum = page * 9;
		sql = "select ts_name, ts_img from (" + "select ts_name, ts_img, ROWNUM as ROW_NUM from TS" + " where ts_name like ? or ts_info like ?" + ") where ROW_NUM between " + startNum + " and " + endNum;
		try {
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
		System.out.println(searchedTsList.size());
		return searchedTsList;
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

	public ArrayList<ResDTO> seeMore_res(String search_word, int page) {
		connect();
		ArrayList<ResDTO> searchedResList = new ArrayList<ResDTO>();
		int startNum = (page - 1) * 9 + 1;
		int endNum = page * 9;
		sql = "select res_name, res_img from (" + "select res_name, res_img, ROWNUM as ROW_NUM from res" + " where res_name like ? or res_info like ?" + ") where ROW_NUM between " + startNum + " and " + endNum;
		try {
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
		System.out.println(searchedResList.size());
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

	public ArrayList<CfDTO> seeMore_cf(String search_word, int page) {
		connect();
		ArrayList<CfDTO> searchedCfList = new ArrayList<CfDTO>();
		int startNum = (page - 1) * 9 + 1;
		int endNum = page * 9;
		sql = "select cf_name, cf_img from (" + "select cf_name, cf_img, ROWNUM as ROW_NUM from cf" + " where cf_name like ?" + ") where ROW_NUM between " + startNum + " and " + endNum;
		try {
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
		System.out.println(searchedCfList.size());
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

	public ArrayList<AccDTO> seeMore_accom(String search_word, int page) {
		connect();
		ArrayList<AccDTO> searchedAccomList = new ArrayList<AccDTO>();
		int startNum = (page - 1) * 9 + 1;
		int endNum = page * 9;
		sql = "select accom_name, accom_img from (" + "select accom_name, accom_img, ROWNUM as ROW_NUM from accom" + " where accom_name like ?" + ") where ROW_NUM between " + startNum + " and " + endNum;
		try {
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
		System.out.println(searchedAccomList.size());
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

	public ArrayList<ParkDTO> seeMore_p(String search_word, int page) {
		connect();
		ArrayList<ParkDTO> searchedParkList = new ArrayList<ParkDTO>();
		int startNum = (page - 1) * 9 + 1;
		int endNum = page * 9;
		sql = "select p_name from (" + "select p_name, ROWNUM as ROW_NUM from p" + " where p_name like ?" + ") where ROW_NUM between " + startNum + " and " + endNum;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + search_word + "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				searchedParkList.add(new ParkDTO(rs.getString("p_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(searchedParkList.size());
		return searchedParkList;
	}

//	public ArrayList<TsDTO> searchAllVisitList(String visit_kind) {
//		connect();
//		if(visit_kind.equals("ts")){
//			ArrayList<TsDTO> allTsList = new ArrayList<TsDTO>();
//			sql = "select ts_name, ts_img from ts";
//			
//		}
//		try {
//			psmt = conn.prepareStatement(sql);
//			rs = psmt.executeQuery();
//			while (rs.next()) {
//				allTsList.add(new TsDTO(rs.getString(1), rs.getString(2)));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return allTsList;
//	}
//	
	public int getVisitCount(String visit_kind) {
		connect();
		int visit_count = 0;
		if (visit_kind.equals("ts")) {
			sql = "select count(*) as count from ts";
		} else if (visit_kind.equals("res")) {
			sql = "select count(*) as count from res";
		} else if (visit_kind.equals("cf")) {
			sql = "select count(*) as count from cf";
		} else if (visit_kind.equals("acc")) {
			sql = "select count(*) as count from accom";
		} else if (visit_kind.equals("p")) {
			sql = "select count(*) as count from p";
		}
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				visit_count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
//		System.out.println("visit_kind : " + visit_kind + "     visit_count : " + visit_count);
		return visit_count;
	}

}