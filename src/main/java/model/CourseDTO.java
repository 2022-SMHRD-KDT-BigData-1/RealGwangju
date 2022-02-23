package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter 메소드 자동으로 생성
@NoArgsConstructor // 기본생성자 생성
@AllArgsConstructor // 모든 필드변수를 초기화하는 생성자 생성
public class CourseDTO {
	private int theme_num;
	private String theme_name;
	private String theme_ct;
	private String theme_course;
	private String theme_dis;
	private String theme_img;
	
	CourseDTO(String acc_name, String acc_img){
		this.theme_name = acc_name;
		this.theme_img = acc_img;
	}
}
