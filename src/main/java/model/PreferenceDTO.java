package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data  //geter setter 메소드 자동으로 생성
@NoArgsConstructor //기본생성자 생성
@AllArgsConstructor // 모든 필드변수를 초기화하는 생성자 생성
public class PreferenceDTO {
	
	private int mem_num;
	private String mem_id;
	private String mem_like;
	
}
