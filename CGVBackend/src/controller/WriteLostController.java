package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.LostDto;

public class WriteLostController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		int index =0;
		String id =  req.getParameter("id");
		String place = req.getParameter("place");
		String lostdate =  req.getParameter("lostdate");
		String hour =  req.getParameter("hour");
		String minute =  req.getParameter("minute");
		String type =  req.getParameter("type");
		String color =  req.getParameter("color");
		String title =  req.getParameter("title");
		String content =  req.getParameter("content");
				
		LostDto dto = new LostDto();
		BackendDAO dao = new BackendDAO(req.getServletContext());
		
		dto.setId(id);
		dto.setPlace(place);
		dto.setLostdate(lostdate);
		dto.setHour(hour);
		dto.setMinute(minute);
		dto.setType(type);
		dto.setColor(color);
		dto.setTitle(title);
		dto.setContent(content);
		index = dao.insertLost(dto);
		dao.close();
		
		req.setAttribute("SUC_FAIL", index);	
		req.setAttribute("WHERE","INS");
		req.getRequestDispatcher("/lost/Message.jsp").forward(req, resp);
	}
	
	
	

}///////////////
