package controller.faq;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class FaqDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no=req.getParameter("no");
		if(no != null){
			BackendDAO dao=new BackendDAO(req.getServletContext());
			int sucOrfail=dao.delete(no);
			
			req.setAttribute("suc_fail", sucOrfail);
			req.setAttribute("where", "DLT");
			dao.close();
			req.getRequestDispatcher("/faq/Message.jsp").forward(req, resp);	
		}
		else{
			ArrayList checkedNo=new ArrayList();
			for(int i=0;i<req.getParameterMap().size();i++){
				if(req.getParameter("checkedNo"+i)!=null)
					checkedNo.add(req.getParameter("checkedNo"+i));
			}
			BackendDAO dao=new BackendDAO(req.getServletContext());
			int sucOrfail=dao.checkDelete(checkedNo);
			
			req.setAttribute("suc_fail", sucOrfail);
			req.setAttribute("where", "DLT");
			dao.close();
			req.getRequestDispatcher("/faq/Message.jsp").forward(req, resp);	
		}
	}
	
}
