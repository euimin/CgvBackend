package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.EmailDto;



public class WriteEmailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}//////////////doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int index = 0;
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		EmailDto dto = new EmailDto();
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		String inquiry = req.getParameter("inquiry");
		String theater = req.getParameter("theater");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String filename = req.getParameter("filename");
		
		if(filename == "") {
			filename = "선택한 파일이 없습니다.";
		}

		
		dto.setId(id);
		dto.setCategory(inquiry);
		dto.setTheater(theater);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFilename(filename);
		
		index = dao.insertEmail(dto);
		dao.close();
		req.setAttribute("SUC_FAIL", index);	
		req.setAttribute("WHERE","INS");
		
		req.getRequestDispatcher("/email/Message.jsp").forward(req, resp);
	}//////////////////doPost
	
	
	

}/////////////////////////////////////////////////write_Controller
