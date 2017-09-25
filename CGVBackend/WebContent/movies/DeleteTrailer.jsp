<%@page import="model.MovieDto"%>
<%@page import="model.FileUtils"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String no = request.getParameter("no");
	BackendDAO dao = new BackendDAO(application);
	int affected = dao.deleteTrailer(no);
	dao.close();
	if(affected==1){
		String movie_code = new String(request.getParameter("movie_code").getBytes("utf-8"), "8859_1");
		String movie_title = new String(request.getParameter("movie_title").getBytes("utf-8"), "8859_1");
		response.sendRedirect(request.getContextPath()+"/movies/Trailer.jsp"
			+"?movie_code="+movie_code
			+"&movie_title="+movie_title);
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