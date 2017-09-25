<%@page import="model.TrailerDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String movie_code = request.getParameter("movie_code");
	String movie_title = request.getParameter("movie_title");
	request.setAttribute("movie_code", movie_code);
	request.setAttribute("movie_title", movie_title);
	BackendDAO dao = new BackendDAO(application);
	List<TrailerDto> list = dao.selectTrailerList(movie_code);
	dao.close();
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->  
    <title>CGV 관리자 페이지</title>
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
  		
  		function isDelete(no){
  			if(confirm("["+no+"]번을 정말로 삭제하시겠습니까?")){
  				location.href="<c:url value='/movies/DeleteTrailer.jsp'/>"
  					+"?no="+no  					
  					+"&movie_code=${movie_code}"
  					+"&movie_title=${movie_title}";
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
        <h1>[<%=movie_title%>] 트레일러 목록</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
    	<div align="right">
    		<a href="<c:url value='/movies/RegisterTrailer.jsp'/>?movie_code=<%=movie_code%>&movie_title=<%=movie_title%>">
    			트레일러 등록하기
    		</a>
    	</div>
    	<table class="table">
            <thead>
              <tr>
                <th>고유번호</th>
                <th>미리보기</th> 
                <th>제목</th>
                <th>등록일</th>          
                <th></th>
              </tr>
            </thead>
            <tbody>
            <% if(list.size()==0){ %>
            <tr bgcolor="white" align="center">
        		<td colspan="3">등록된 트레일러가 없습니다</td>
       		</tr>
            <% }
               else {
        	   		for(TrailerDto dto: list){
        	   			String url = dto.getUrl();        	   			
        	   			String playId = url.substring(url.lastIndexOf("=")+1);
        	   			request.setAttribute("playId", playId);%>
		              <tr>
		                <td><%=dto.getNo()%></td>
		                <td>
		                	<iframe style="height: 200px; border: 0px" 
		                		src="https://www.youtube.com/embed/${playId}"></iframe>
		                </td>
		                <td><%=dto.getTitle()%></td>
		                <td><%=dto.getRegidate()%></td>		               
		                <td>
		                	<a href="javascript:isDelete('<%=dto.getNo()%>')">
		                		<button class="btn btn-success">
		                			삭제
		                		</button>
		                	</a>
		                </td>
		              </tr>
            <% 		} 
              }%>
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
    