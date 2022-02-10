package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter 메소드 자동으로 생성
@NoArgsConstructor // 기본생성자 생성
@AllArgsConstructor // 모든 필드변수를 초기화하는 생성자 생성
public class ResDTO {
	private String res_name;
	private String res_tel;
	private String res_time;
	private String res_ct;
	private String res_add;
	private int res_loc;
	private String res_img;
	private String res_info;
	private int res_views;

	ResDTO(String res_name, String res_img){
		this.res_name = res_name;
		this.res_img = res_img;
	}
}
