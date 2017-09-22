package controller.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.SupportPostDto;

public class EditNewsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int count=0;
		req.setCharacterEncoding("UTF-8");
		
		String no = req.getParameter("no");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String postdate = req.getParameter("postdate");
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		SupportPostDto dto = new SupportPostDto();
		dto.setNo(no);
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContent(content);

		count = dao.updateNews(dto);
		dao.close();
		req.setAttribute("SUC_FAIL", count);
		
		req.setAttribute("WHERE","EDT");
		req.getRequestDispatcher("/news/Message.jsp").forward(req, resp);
		
	}//////////////doPost

	
	
	
}/////////////EditController
