package model;

import java.io.File;
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

	public int writeReview(String visit_name, String nick, String title, String content, String reviewImg) {
		connect();
		try {
			sql = "insert into review(re_num, visit_name, mem_nick, re_title, re_content, re_img) values(review_re_num_seq.nextval,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, visit_name);
			psmt.setString(2, nick);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setString(5, reviewImg);
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

	public ArrayList<ReviewDTO> selectRecentReviews() {
		connect();
		ArrayList<ReviewDTO> recentReviews = new ArrayList<ReviewDTO>();
		sql = "select visit_name, mem_nick, re_title, re_content, re_img, re_date, re_num from review where rownum < 3";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				recentReviews.add(new ReviewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(recentReviews.toString());
		return recentReviews;
	}
	public ReviewDTO selectReview(int re_num) {
		connect();
		ReviewDTO review = null;
		sql = "select visit_name, mem_nick, re_title, re_content, re_img, re_date, re_num from review where re_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, re_num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				review = new ReviewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), re_num);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return review;
	}
	public ReviewDTO selectMyReview(String visit_name, String mem_nick) {
		connect();
		ReviewDTO myReview = null;
		sql = "select re_title, re_content, re_img, re_date, re_num from review where mem_nick=? and visit_name=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, visit_name);
			psmt.setString(2, mem_nick);
			rs = psmt.executeQuery();
			if (rs.next()) {
				myReview = new ReviewDTO(visit_name, mem_nick, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
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
		sql = "select mem_nick, re_title, re_content, re_img, re_date, re_num from review where visit_name=? order by re_num desc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, visit_name);
			rs = psmt.executeQuery();
			while (rs.next()) {
				reviewList.add(new ReviewDTO(visit_name, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return reviewList;
	}
	
//	public ArrayList<ReviewDTO> selectAllReview() {
//		connect();
//		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
//		sql = "select visit_name, mem_nick, re_title, re_content, re_img, re_date ,re_num from review order by re_num desc";
//		try {
//			psmt = conn.prepareStatement(sql);
//			rs = psmt.executeQuery();
//			while (rs.next()) {
//				reviewList.add(new ReviewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
////		System.out.println(reviewList.toString());
//		return reviewList;
//	}
	public ArrayList<ReviewDTO> selectAllReview(int page) {
		connect();
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		int startNum = (page - 1) * 9 + 1;
		int endNum = page * 9;
//		sql = "select visit_name, mem_nick, re_title, re_content, re_img, re_date ,re_num, rownum as row_num from review where row_num between "+startNum+" and "+endNum+" order by re_num desc";
//		sql = "select * from (select review.*, rownum as row_num from review) where row_num between "+startNum+" and "+endNum+" order by re_num desc";
		sql = "select * from (select review.*, rownum as row_num from review order by re_num desc) where row_num between "+startNum+" and "+endNum;
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				reviewList.add(new ReviewDTO(rs.getString("visit_name"), rs.getString("mem_nick"), rs.getString("re_title"), rs.getString("re_content"), rs.getString("re_img"), rs.getString("re_date"), rs.getInt("re_num")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
//		System.out.println(reviewList.toString());
		return reviewList;
	}
	public int getReviewCount() {
		connect();
		int reviewCount = 0;
		sql = "select count(*) as count from review";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				reviewCount = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return reviewCount;
	}
}
