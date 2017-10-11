package controller.show_times;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.ShowTimeDTO;


public class ShowtimeWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BackendDAO dao = new BackendDAO(req.getServletContext());
		
		List list = dao.selectTitles();
		List regionList = dao.selectRegions();
		
		req.setAttribute("list", list);
		req.setAttribute("regionList", regionList);
		dao.close();
		
		req.getRequestDispatcher("/show-times/ShowTimesWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		String region = req.getParameter("region");
		String submit = req.getParameter("submit");
		
		if(submit != null) {
			int sucOrfail;
			
			String title = req.getParameter("title");
			String screeningdate  = req.getParameter("screeningdate");
			region = req.getParameter("region");
			String name  = req.getParameter("theatername");
			String no = req.getParameter("no");
			String time = req.getParameter("time");
			
			ShowTimeDTO dto = new ShowTimeDTO(
					null,
					null,
					null,
					screeningdate,
					time,
					title,
					null,
					null,
					null,
					null,
					no,
					null,
					region,
					name
					);
			
			System.out.println("상영일: "+dto.getScreeningdate());
			System.out.println("상영시간: "+dto.getTime());
			System.out.println("제목: "+dto.getTitle());
			System.out.println("상영관 번호: "+dto.getNo());
			System.out.println("지역: "+dto.getRegion());
			System.out.println("극장 이름: "+dto.getName());
			BackendDAO dao=new BackendDAO(req.getServletContext());
			sucOrfail=dao.insertShowTime(dto);
			dao.close();
			
			req.setAttribute("suc_fail", sucOrfail);
			req.setAttribute("where", "INS");
			
			req.getRequestDispatcher("/show-times/Message.jsp").forward(req, resp);
		}
		else {
		if(region != null) {
		
		BackendDAO dao=new BackendDAO(req.getServletContext());
		List<ShowTimeDTO> list=dao.selectTheaterList(region);
		dao.close();
		PrintWriter out=resp.getWriter();
		out.println("<select name='theatername' onchange='mul();'>");
		out.println("<option>극장이름</option> ");
		for(ShowTimeDTO dto: list) {
				out.println("<option>"+dto.getName()+"</option> ");
		}
		out.println("</select>");
		}
			
		else {
			//
			System.out.println("지역을 택하면 들어온다.");
			//
			String theatername = req.getParameter("name");
			String no = req.getParameter("no");
			
			if(no == null) {
			System.out.println(theatername);
			BackendDAO dao=new BackendDAO(req.getServletContext());
			List<ShowTimeDTO> list=dao.selectNumberList(theatername);
			dao.close();
			for(ShowTimeDTO dto: list) {
				System.out.println(dto.getNo());
			}
			
			PrintWriter out=resp.getWriter();
			out.println("<select name='theatername' id='theatername' onchange='div();'>");
			out.println("<option>번호</option>");
			for(ShowTimeDTO dto: list) {
					out.println("<option>"+dto.getNo()+"</option> ");
			}
			out.println("</select>");
			}////////////if
			
			else {
				//
				System.out.println("번호를 택하면 들어온다.");
				//
				BackendDAO dao=new BackendDAO(req.getServletContext());
				List<ShowTimeDTO> list=dao.selectTimeList(no,theatername);		
				dao.close();
				PrintWriter out=resp.getWriter();
				out.println("<select name='time' id='time'>");
				out.println("<option>이미 등록된 상영시간</option>");
				for(ShowTimeDTO dto: list) {
					System.out.println(dto.getTime());
						out.println("<option>"+dto.getTime()+"</option>");
				}
				out.println("</select>");
				}/////else
			}////////////else
			
			
		}////////////////doPost
	}
	
}
