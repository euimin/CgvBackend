<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	BackendDAO dao = new BackendDAO(application);
	List<MovieDto> list = dao.selectMovieList();
	Map<String, Integer> stillsMap = new HashMap<String, Integer>();
	Map<String, Integer> trailerMap = new HashMap<String, Integer>();
	for(MovieDto movie: list){
		String movie_code = movie.getMovie_code();
		int stillCount = dao.getStillCount(movie_code);
		stillsMap.put(movie_code, stillCount);
		int trailerCount = dao.getTrailerCount(movie_code);
		trailerMap.put(movie_code, trailerCount);
	}
	dao.close();
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->  
    <title>CGV 관리자 페이지-회원관리</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  	<!-- JQuery -->
  	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
  	<script>
  		$(function(){
  			//메뉴 표시를 위한 코드
			var page = location.href;
		    $('#menubar li a').each(function(){
		    	var href = $(this).attr('href').split("/");
		    	var menu = href[2];	     
		        if (page.indexOf(menu) != -1) {
		            $(this).parent().addClass('active');
		        } else {
		            $(this).parent().removeClass('active');
		        }
		    });
  		});
  		
  		function isDelete(title, movie_code){
  			if(confirm("["+title+"]를 삭제하시겠습니까?")){
  				location.href="<c:url value='/movies/DeleteMovie.jsp'/>?movie_code="+movie_code;
  			}
  		}
  	</script>
  </head>
  
  <body role="document">

    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>영화 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>영화 목록</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
    	<div align="right">
    		<a href="<c:url value='/movies/RegisterMovie.jsp'/>">새 영화 등록하기</a>
    	</div>
    	<table class="table">
            <thead>
              <tr>
                <th>코드명</th>
                <th>제목</th>
                <th>관람등급</th>
                <th>개봉일</th>
                <th>스틸컷</th>
                <th>트레일러</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            <%for(MovieDto dto: list){%>
              <tr>
                <td>
                	<a href="<c:url value='/movies/MovieDetail.jsp'/>?movie_code=<%=dto.getMovie_code()%>">
                		<%=dto.getMovie_code()%>
                	</a>
                </td>
                <td><%=dto.getTitle()+"("+dto.getEngtitle()+")"%></td>
                <td><%=dto.getRating()%></td>
                <td><%=dto.getReleasedate()%></td>
                <td>
                	<a href="<c:url value='/movies/Still.jsp'/>?movie_code=<%=dto.getMovie_code()%>&movie_title=<%=dto.getTitle()%>">
                		<%=stillsMap.get(dto.getMovie_code())%>
                	</a>
                </td>
                <td><a href="#"><%=trailerMap.get(dto.getMovie_code())%></a></td>
                <td><a href="javascript:isDelete('<%=dto.getTitle()%>', '<%=dto.getMovie_code() %>')"><button class="btn btn-success">삭제</button></a></td>
              </tr>
            <% } %>
            </tbody>
          </table>
    </div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    