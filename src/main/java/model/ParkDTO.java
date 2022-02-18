package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter 메소드 자동으로 생성
@NoArgsConstructor // 기본생성자 생성
@AllArgsConstructor // 모든 필드변수를 초기화하는 생성자 생성
public class ParkDTO {
	private String p_name;
	private String p_tel;
	private String p_ct;
	private String p_add;
	private int p_loc;
	private int p_views;
	
	ParkDTO(String p_name){
		this.p_name = p_name;
	}
}
