package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import model.CfDAO;
import model.CfDTO;
import model.ParkDAO;
import model.ParkDTO;
import model.TsDAO;
import model.TsDTO;

@WebServlet("/mapPCon")
public class mapPCon extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ParkDAO p = new ParkDAO();
		ArrayList<ParkDTO> list = p.pAddress();

		// DB에 있는 데이터를 가져왔다! 가정---
		
		System.out.println("주차장 요청이 들어왔다!");
		System.out.println(list.get(0));
		// 데이터를 json 타입으로 바꾼뒤 반환 시켜줘야 함!
		// Gson 라이브러리 필요!
		
		// Gson 객체 만들기 --> 자바의 데이터를 json 타입으로 바꾸어 주는 역할
		Gson gson = new Gson();
		// JsonArray 객체 --> json 타입으로 바뀐 데이터를 저장할 수 있는 역할
		JsonArray jarray = new JsonArray();
		
		for(int i = 0; i<list.size(); i++) {
			jarray.add(gson.toJson(list.get(i)));
			// Gson 객체를 사용한다면 키값을 알아서 지정해줌
			// 키값 --> 해당하는 변수명
		}
		
		response.setContentType("text/plain; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(jarray);
		
		
	}

}
