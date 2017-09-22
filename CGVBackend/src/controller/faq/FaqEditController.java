package controller.faq;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.SupportPostDto;

public class FaqEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BackendDAO dao=new BackendDAO(req.getServletContext());
		SupportPostDto dto=dao.selectFaqOne(req.getParameter("no"));
		req.setAttribute("category", dto.getCategory());
		req.setAttribute("dto", dto);
		dao.close();
		req.getRequestDispatcher("/faq/FaqEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int sucOrfail;
		
		String no=req.getParameter("no");
		String category=req.getParameter("category");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		SupportPostDto dto = new SupportPostDto(
				no,
				category,
				title,
				null,
				null,
				content
				);
		
		BackendDAO dao=new BackendDAO(req.getServletContext());
		sucOrfail=dao.update(dto);
		
		req.setAttribute("no", no);
		req.setAttribute("suc_fail", sucOrfail);
		req.setAttribute("where", "EDT");
		dao.close();
		req.getRequestDispatcher("/faq/Message.jsp").forward(req, resp);
	
	}

}
