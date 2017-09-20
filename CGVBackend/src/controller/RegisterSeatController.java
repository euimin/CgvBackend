package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class RegisterSeatController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*SEATNUMBER
		SCREEN_CODE
		SEAT*/
		String seatnumber = req.getParameter("seatnumber");
		String screen_code = req.getParameter("screen_code");
		String seat = req.getParameter("seat");
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		dao.registerSeat(seatnumber, screen_code, seat);
		dao.close();
	}
}
