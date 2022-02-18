package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter 메소드 자동으로 생성
@NoArgsConstructor // 기본생성자 생성
@AllArgsConstructor // 모든 필드변수를 초기화하는 생성자 생성
public class CfDTO {
	private String cf_name;
	
	private String cf_tel;
	private String cf_time;
	private String cf_ct;
	private String cf_add;
	private int cf_loc;
	private String cf_img;
	private String cf_info;
	private int cf_views;
	
	CfDTO(String cf_name, String cf_img){
		this.cf_name = cf_name;
		this.cf_img = cf_img;
	}
}
