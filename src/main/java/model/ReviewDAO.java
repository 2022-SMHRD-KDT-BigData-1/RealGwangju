package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDAO {
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

	public int writeReview(String visit_name, String nick, String title, String content) {
		connect();
		try {
			sql = "insert into review(re_num, visit_name, mem_nick, re_title, re_content) values(review_re_num_seq.nextval,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, visit_name);
			psmt.setString(2, nick);
			psmt.setString(3, title);
			psmt.setString(4, content);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int deleteReview(String visit_name, String mem_nick) {
		connect();
		try {
			sql = "delete from review where visit_name=? and mem_nick=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, visit_name);
			psmt.setString(2, mem_nick);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ReviewDTO selectMyReview(String visit_name, String mem_nick) {
		connect();
		ReviewDTO myReview = null;
		sql = "select re_title, re_content, re_date from review where mem_nick=? and visit_name=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, visit_name);
			psmt.setString(2, mem_nick);
			rs = psmt.executeQuery();
			if (rs.next()) {
				myReview = new ReviewDTO(visit_name, mem_nick, rs.getString(1), rs.getString(2), rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return myReview;
	}

	public ArrayList<ReviewDTO> selectAllReview(String visit_name) {
		connect();
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		sql = "select mem_nick, re_title, re_content, re_date from review where visit_name=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, visit_name);
			rs = psmt.executeQuery();
			if (rs.next()) {
				reviewList.add(new ReviewDTO(visit_name, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return reviewList;
	}
}
