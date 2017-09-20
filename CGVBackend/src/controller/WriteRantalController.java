package controller;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.RentalDto;

public class WriteRantalController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int count ;
		
		 req.setCharacterEncoding("UTF-8");
		
		 String theater =req.getParameter("theater");
		 String leasedate  =req.getParameter("leasedate");
		 String hour =req.getParameter("hour");
		 String people =req.getParameter("people");
		 String content =req.getParameter("content");
		 String name =req.getParameter("name");
		 String phone =req.getParameter("phone");
		 String email = req.getParameter("email");
		
		 
		 BackendDAO dao = new BackendDAO(req.getServletContext());
		 RentalDto dto= new RentalDto();
				
		 dto.setTheater(theater);
		 dto.setLeasedate(leasedate);
		 dto.setHour(hour);
		 dto.setPeople(people);
		 dto.setContent(content);
		 dto.setName(name);
		 dto.setPhone(phone);
		 dto.setEmail(email);
		 
		 count = dao.insertRantal(dto);
		 
		 req.setAttribute("SUC_FAIL", count);
		 req.setAttribute("WHERE","INS");
		 
		
		 req.getRequestDispatcher("/rental/Message.jsp").forward(req, resp);
	}
	
	

}/////////////////WriteController
