<%@page import="model.TrailerDto"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String movie_code = request.getParameter("movie_code");
	String movie_title = request.getParameter("movie_title");
	request.setAttribute("movie_code", movie_code);
	request.setAttribute("movie_title", movie_title);
	String title = request.getParameter("title");
	String url = request.getParameter("url");
	if(title!=null){
		TrailerDto dto = new TrailerDto();
		dto.setMovie_code(movie_code);
		dto.setTitle(title);
		dto.setUrl(url);
		BackendDAO dao = new BackendDAO(application);
		int affected = dao.registerTrailer(dto);
		dao.close();
		if(affected==1){
			movie_title = new String(movie_title.getBytes("utf-8"), "8859_1");
			response.sendRedirect(request.getContextPath()+"/movies/Trailer.jsp"
					+"?movie_code="+movie_code
					+"&movie_title="+movie_title);
		}
		else{
			request.setAttribute("dto", dto);
			request.setAttribute("registerError", "등록 실패:다시 확인하세요");
		}
	}
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
    <!-- DatePicker-->
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
	<!-- validation -->
	<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script> -->
    <script>
	    $(function() {			
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
		    
		    $("#back").click(function(){
				location.href="<c:url value='/movies/Trailer.jsp'/>?movie_code=${movie_code}&movie_title=${movie_title}";	
			});	
		    		
		    $("tr>td:first").css("width", "150px");
		    $(":text").css("width", "350px");
		});
  	</script>
  </head>

  <body role="document">
    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
    <%-- <%@ include file="/template/TopMenu.jsp"%> --%>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>영화 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>트레일러 등록</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
     <form method="post">
     	<table class="table" style="width: 70%">
            <tbody>
              <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="${dto.title}"/></td>
              </tr>
              <tr>
                <td>동영상 URL</td>
                <td><input type="text" name="url" value="${dto.url}"/></td>
              </tr>
              <tr>
              	<td colspan="2">
              		<input class="btn btn-success" type="button" id="back" value="취소"/> 
              		<input class="btn btn-primary" type="submit" value="등록하기"/>${registerError}
              	</td>
              </tr>
            </tbody>
   	      </table>
    </form>
    </div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    