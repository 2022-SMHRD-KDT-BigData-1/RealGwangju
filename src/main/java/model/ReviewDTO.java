package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data  //geter setter 메소드 자동으로 생성
@NoArgsConstructor //기본생성자 생성
@AllArgsConstructor // 모든 필드변수를 초기화하는 생성자 생성
public class ReviewDTO {
	private String visit_name;
	private String mem_nick;
	private String re_title;
	private String re_content;
	private String re_img;
	private String re_date;
	private int re_num;
}
