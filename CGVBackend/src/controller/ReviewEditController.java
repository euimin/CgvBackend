package controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewDto;

public class ReviewEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String no=req.getParameter("review_no");
		String feedback=req.getParameter("feedback");
		String content=req.getParameter("content");		
		
		ReviewDAO dao=new ReviewDAO();
		
		ReviewDto dto=new ReviewDto(
				no,
				null,
				null,
				feedback,
				content,
				null,
				null,
				null,
				null,
				pointFunc(req)==null? null:pointFunc(req)[0],
				pointFunc(req)==null? null:pointFunc(req)[1],
				pointFunc(req)==null? null:pointFunc(req)[2],
				pointFunc(req)==null? null:pointFunc(req)[3],
				pointFunc(req)==null? null:pointFunc(req)[4]				
				);
		
		int sucOrfail=dao.update(dto);

		req.setAttribute("no", no);
		req.setAttribute("suc_fail", sucOrfail);
		req.setAttribute("where", "EDT");
		req.getRequestDispatcher("/review/MessageReview.jsp").forward(req, resp);
	}
	
	
	public String[] pointFunc(HttpServletRequest req) {
		String[] newPoints=req.getParameterValues("point");
		if(newPoints==null) return newPoints;
		else {
			String pointString=String.join(",", newPoints);
			String[] newNewPoints={"d","d","d","d","d"};
			if(pointString.contains("directionpoint")) newNewPoints[0]="u";
			if(pointString.contains("storypoint")) newNewPoints[1]="u";
			if(pointString.contains("visualpoint")) newNewPoints[2]="u";
			if(pointString.contains("actingpoint")) newNewPoints[3]="u";
			if(pointString.contains("soundtrackpoint")) newNewPoints[4]="u";
			return newNewPoints;
		}
	}

}
