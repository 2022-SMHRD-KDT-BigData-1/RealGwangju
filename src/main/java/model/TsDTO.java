package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data  //geter setter 메소드 자동으로 생성
@NoArgsConstructor //기본생성자 생성
@AllArgsConstructor // 모든 필드변수를 초기화하는 생성자 생성
public class TsDTO {
		
		private String ts_name;
		private String ts_tel;
		private String ts_time;
		private String ts_ct;
		private String ts_add;
		private int ts_loc;
		private String ts_img;
		private String ts_info;
		private int ts_views;
		private String ts_lat;
		private String ts_lng;
		
		TsDTO(String ts_name, String ts_img){
			this.ts_name = ts_name;
			this.ts_img = ts_img;
		}
		TsDTO(String ts_name, String ts_img, String ts_info){
			this.ts_name = ts_name;
			this.ts_img = ts_img;
			this.ts_info= ts_info;
		}
		
	}
