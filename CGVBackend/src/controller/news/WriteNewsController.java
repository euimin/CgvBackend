package controller.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import model.BackendDAO;
import model.SupportPostDto;

public class WriteNewsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int count;
		req.setCharacterEncoding("UTF-8");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		SupportPostDto dto = new SupportPostDto();
		
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);
		
		 count = dao.insertNews(dto);
		 dao.close();
		
		 
		 	req.setAttribute("SUC_FAIL", count);	
			req.setAttribute("WHERE","INS");
			req.getRequestDispatcher("/news/Message.jsp").forward(req, resp);
		
	}////////////////////

	

	
	
}
