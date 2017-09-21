package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.RentalDto;

public class rentalajax extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String address = req.getParameter("address");
		RentalDto dto = new RentalDto();
		BackendDAO dao = new BackendDAO(req.getServletContext());
		dto.setAddress(address);
		List<RentalDto> list =  dao.returncgv(dto);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		
		for(int i =0; i<list.size();i++) {
		out.println("<option value='"+list.get(i).getCgv()+"'>"+list.get(i).getCgv()+"</option>");
		}
		out.close();
		
	}///
	
	
	
	
	

}///////////////////
