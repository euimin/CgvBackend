package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.MembersDTO;



//1]HttpServlet 상속 받는다
public class MembersDeleteController extends HttpServlet {
	//2]service()혹은 doGet() 혹은 doPost()오버라이딩
	@Override
	protected void service(
			HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		//3]요청분석
		String id = req.getParameter("id");
		//4]모델 호출 및 결과값 받기
		BackendDAO dao = new BackendDAO(req.getServletContext());
		MembersDTO dto = dao.membersSelectOne(id);

		int affected=dao.membersDelete(dto);
		dao.close();
		
		//5]필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);
		//6]뷰 선택후 포워딩
		req.getRequestDispatcher("/user/members.List.cgv").forward(req, resp);
		

		

		
	}/////////////////////service()
	
	
}
