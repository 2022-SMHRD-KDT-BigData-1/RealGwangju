package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data  //geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor //�⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
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
		
		TsDTO(String ts_name, String ts_img){
			this.ts_name = ts_name;
			this.ts_img = ts_img;
		}
		
	}
