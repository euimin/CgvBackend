<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("id") == null){ 
		out.println("<script>");
		out.println("alert('로그인후 이용하세요')");
		out.println("location.replace('"+request.getContextPath()+"/login/Login.jsp');");
		out.println("</script>");
	}	
%>