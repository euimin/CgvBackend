<%@page import="java.util.List"%>
<%@page import="model.ScreenDto"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String theater_code = request.getParameter("theater_code");
	String theater_name = request.getParameter("theater_name");
	request.setAttribute("theater_code", theater_code);
	request.setAttribute("theater_name", theater_name);
	BackendDAO dao = new BackendDAO(application);
	List<ScreenDto> list = dao.selectScreenList(theater_code);
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
  		
  		function isDelete(screen_code, no){
  			if(confirm("정말로 ["+no+"관]을 삭제하시겠습니까?"+screen_code)){
  				location.href = "<c:url value='/screens/DeleteScreen.jsp'/>?screen_code="+screen_code
  						+"&theater_code=${theater_code}"
  						+"&theater_name=${theater_name}";
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
        <h1>상영관 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1><%=theater_name%> 상영관</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
    	<div align="right">
	    	<a href="<c:url value='/screens/RegisterScreen.jsp'/>?theater_code=<%=theater_code%>&theater_name=<%=theater_name%>">
	    		<button class="btn btn-primary">상영관 등록하기</button>
	    	</a>
	    </div>
	    <table class="table">
            <thead>
              <tr>
                <th>상영관 코드</th>
                <th>상영관 번호</th>
                <th>좌석 수</th>
                <th></th>            
              </tr>
            </thead>
            <tbody>
            <%for(ScreenDto dto:list){%>
              <tr>
                <td>
                	<a href="<c:url value='/screens/ScreenDetail.jsp'/>?theater_code=<%=theater_code%>&theater_name=<%=theater_name%>&screen_code=<%=dto.getScreen_code()%>">
                		<%=dto.getScreen_code()%>
                	</a>
                </td>
                <td><%=dto.getNo()%></td>
                <td><%=dto.getSeats()%></td>
                <td>
                	<a href="javascript:isDelete('<%=dto.getScreen_code()%>','<%=dto.getNo()%>')">
                		<button class="btn btn-success">삭제</button>
                	</a>
                </td>             
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
    