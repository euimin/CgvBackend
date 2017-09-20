package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class LoginController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		BackendDAO dao = new BackendDAO(req.getServletContext());
		boolean loginSucceed = dao.login(id, password);
		dao.close();
		if(loginSucceed){
			req.getSession().setAttribute("id", id);
			req.getSession().setAttribute("password", password);
			req.getRequestDispatcher("/First.jsp").forward(req, resp);
		}
		else{
			req.setAttribute("error", "아이디와 비밀번호가 일치하지 않습니다.");
			req.getRequestDispatcher(req.getContextPath()+"/login/Login.jsp").forward(req, resp);
		}
	}
}
