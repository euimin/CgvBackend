package controller.reserve;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReserveDAO;


public class ReserveDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String code=req.getParameter("code");
		if(code != null){
			ReserveDAO dao=new ReserveDAO(req.getServletContext());
			int sucOrfail=dao.deleteReserve(code);
			
			req.setAttribute("suc_fail", sucOrfail);
			req.setAttribute("where", "DLT");
			dao.close();
			req.getRequestDispatcher("/reserve/ReserveMessage.jsp").forward(req, resp);	
		}
		else{
			ArrayList checkedCode=new ArrayList();
			for(int i=0;i<req.getParameterMap().size();i++){
				if(req.getParameter("checkedCode"+i)!=null)
					checkedCode.add(req.getParameter("checkedCode"+i));
			}
			ReserveDAO dao=new ReserveDAO(req.getServletContext());
			int sucOrfail=dao.checkReserveDelete(checkedCode);
			
			req.setAttribute("suc_fail", sucOrfail);
			req.setAttribute("where", "DLT");
			dao.close();
			req.getRequestDispatcher("/reserve/ReserveMessage.jsp").forward(req, resp);	
		}
		
	}
	
}
