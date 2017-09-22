package controller.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.SupportPostDto;

public class NewsViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//컨텐츠 뷰 읽어오기.
		
		String no = req.getParameter("no");
		
		SupportPostDto dto = new SupportPostDto();
		BackendDAO dao = new BackendDAO(req.getServletContext());
		
		dto.setCategory(no);
		
		List list = dao.ContentView(no);
		
		req.setAttribute("list",list);
		dao.close();
		req.getRequestDispatcher("/news/ContentView.jsp").forward(req, resp);
	}/////////////////
	
	
	

}
