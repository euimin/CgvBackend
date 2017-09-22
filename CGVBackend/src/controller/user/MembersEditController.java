package controller.user;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.MembersDTO;


public class MembersEditController extends HttpServlet {
	
	@Override
	protected void service(
			HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		//요청분석]
		
		if(req.getMethod().toUpperCase().equals("GET")){ //수정폼으로 이동
			String id = req.getParameter("id");
			//모델 호출 및 결과 값 받기]
			BackendDAO dao = new BackendDAO(req.getServletContext());
			MembersDTO dto= dao.membersSelectOne(id);
			dao.close();
			//리퀘스트 영역에 저장]
			req.setAttribute("dto", dto);
			//포워드]
			req.getRequestDispatcher("/user/Edit.jsp").forward(req, resp);	
		}
		
		else{
			//모델 호출 및 결과 값 받기]
			BackendDAO dao = new BackendDAO(req.getServletContext());
			MembersDTO dto = new MembersDTO();
			
			dto.setId(req.getParameter("id"));
			dto.setEmail(req.getParameter("email"));
			dto.setPassword(req.getParameter("password"));
			dto.setPhone(req.getParameter("phone"));
			
			int affected=dao.membersUpdate(dto);
			dto=dao.membersSelectOne(req.getParameter("id"));
			dao.close();
			
			if(affected==1){
				//리퀘스트 영역에 저장]
				req.setAttribute("dto", dto);
				//포워드]
				req.getRequestDispatcher("/user/View.jsp").forward(req, resp);
			}
			else{
				req.setAttribute("Error", "수정에러");
				req.getRequestDispatcher("/user/Edit.jsp").forward(req, resp);
			}
		}
		
	}		
}