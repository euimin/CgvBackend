package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.TheaterDto;

public class EditTheaterController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		TheaterDto dto = new TheaterDto();
		dto.setTheater_code(req.getParameter("theater_code"));
		dto.setName(req.getParameter("name"));
		dto.setParkinginfo(req.getParameter("parkinginfo"));
		dto.setRegion(req.getParameter("region"));
		dto.setTransportationinfo(req.getParameter("transportationinfo"));
		dto.setAddr1(req.getParameter("addr1"));
		dto.setAddr2(req.getParameter("addr2"));
		dto.setRoadaddr1(req.getParameter("roadaddr1"));
		dto.setRoadaddr2(req.getParameter("roadaddr2"));
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		int affected = dao.editTheater(dto);
		dao.close();
		if(affected==1) {
			req.setAttribute("editSucceed", "수정 완료");
			req.getRequestDispatcher("/theaters/TheaterDetail.jsp").forward(req, resp);
			//resp.sendRedirect(req.getContextPath()+"/theaters/Theaters.jsp");
		}
		else {
			req.setAttribute("dto", dto);
			req.setAttribute("editError", "수정 실패:다시 확인하세요");
			req.getRequestDispatcher("/theaters/TheaterDetail.jsp").forward(req, resp);
		}
	}	
}
