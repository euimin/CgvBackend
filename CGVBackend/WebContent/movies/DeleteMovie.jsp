<%@page import="model.MovieDto"%>
<%@page import="model.FileUtils"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String movie_code = request.getParameter("movie_code");
	BackendDAO dao = new BackendDAO(application);
	MovieDto dto = dao.selectOneMovie(movie_code);
	int affected = dao.deleteMovie(movie_code);
	dao.close();
	if(affected==1){
		FileUtils.deleteFile(request, application.getInitParameter("POSTER_DIRECTORY"), dto.getPoster());
		response.sendRedirect(request.getContextPath()+"/movies/Movie.jsp");
	}
	else{
		%>
		<script>
			alert("삭제 실패");
		</script>
		<%
	}
%>