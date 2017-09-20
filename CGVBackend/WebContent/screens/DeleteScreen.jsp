<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("Deletepage");
	String theater_code = request.getParameter("theater_code");
	String theater_name = request.getParameter("theater_name");
	String screen_code = request.getParameter("screen_code");
	BackendDAO dao = new BackendDAO(application);
	dao.deleteSeat(screen_code);
	int affected = dao.deleteScreen(screen_code);
	dao.close();
	if(affected==1){
		response.sendRedirect(request.getContextPath()+"/screens/Screens.jsp?theater_code="+theater_code
				+"&theater_name="+theater_name);
	}
	else{
		%>
		<script>
			alert("삭제 실패");
			history.back();
		</script>
		<%
	}
%>