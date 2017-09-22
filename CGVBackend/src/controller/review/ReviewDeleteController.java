package controller.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;

public class ReviewDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String no=req.getParameter("review_no");
		System.out.println(no);
		if(no != null){
			ReviewDAO dao=new ReviewDAO();
			int sucOrfail=dao.delete(no);
			
			req.setAttribute("suc_fail", sucOrfail);
			req.setAttribute("where", "DLT");
			req.getRequestDispatcher("/review/MessageReview.jsp").forward(req, resp);	
		}
		else{
			ArrayList<String> checkedNo=new ArrayList<String>();
			for(int i=0;i<req.getParameterMap().size();i++){
				if(req.getParameter("checkedNo"+i)!=null)
					checkedNo.add(req.getParameter("checkedNo"+i));
			}
			ReviewDAO dao=new ReviewDAO();
			int sucOrfail=dao.checkDelete(checkedNo);
			
			req.setAttribute("suc_fail", sucOrfail);
			req.setAttribute("where", "DLT");
			req.getRequestDispatcher("/review/MessageReview.jsp").forward(req, resp);	
		}
	}


}
