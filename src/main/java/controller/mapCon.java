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

import model.TsDAO;
import model.TsDTO;

@WebServlet("/mapCon")
public class mapCon extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("��û�� ���Դ�!");
		
		
		TsDTO ts1 = new TsDTO("Ȧ", "00", "�ää�", "����", "��������", 0, "��������", "������������", 0);
		TsDTO ts2 = new TsDTO("Ȧs", "001", "�ää�dx", "����sx", "������d��", 0, "������d��", "������������", 0);
		TsDTO ts3 = new TsDTO("Ȧd", "002", "�ä�c��", "����d", "������sfds��", 0, "��efd������", "������������", 0);
		
		
		TsDAO ts = new TsDAO();
		ArrayList<TsDTO> list = ts.tsAddress();
		ArrayList<TsDTO> list2 = new ArrayList<TsDTO>();
		list2.add(ts1);
		list2.add(ts2);
		list2.add(ts3);

		// DB�� �ִ� �����͸� �����Դ�! ����---
		
		System.out.println("��û�� ���Դ�!");
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
