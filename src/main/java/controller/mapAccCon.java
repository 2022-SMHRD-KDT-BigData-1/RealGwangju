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

import model.AccDAO;
import model.AccDTO;
import model.TsDAO;
import model.TsDTO;

@WebServlet("/mapAccCon")
public class mapAccCon extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		AccDAO acc = new AccDAO();
		ArrayList<AccDTO> list = acc.accAddress();

		// DB�� �ִ� �����͸� �����Դ�! ����---
		
		System.out.println("���� ��û�� ���Դ�!");
		System.out.println(list.get(0));
		// �����͸� json Ÿ������ �ٲ۵� ��ȯ ������� ��!
		// Gson ���̺귯�� �ʿ�!
		
		// Gson ��ü ����� --> �ڹ��� �����͸� json Ÿ������ �ٲپ� �ִ� ����
		Gson gson = new Gson();
		// JsonArray ��ü --> json Ÿ������ �ٲ� �����͸� ������ �� �ִ� ����
		JsonArray jarray = new JsonArray();
		
		for(int i = 0; i<list.size(); i++) {
			jarray.add(gson.toJson(list.get(i)));
			// Gson ��ü�� ����Ѵٸ� Ű���� �˾Ƽ� ��������
			// Ű�� --> �ش��ϴ� ������
		}
		
		response.setContentType("text/plain; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(jarray);
		
	}

}
