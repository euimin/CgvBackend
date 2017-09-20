<%@page import="model.TheaterDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	BackendDAO dao = new BackendDAO(application);
	List<TheaterDto> list = dao.selectTheaterList();
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
  		
  		function isDelete(name, theater_code){
  			if(confirm("["+name+"]을 삭제하시겠습니까?")){
  				location.href = "<c:url value='/theaters/DeleteTheater.jsp'/>?theater_code="+theater_code;
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
        <h1>극장 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1></h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
	    <div align="right">
	    	<a href="<c:url value='/theaters/RegisterTheater.jsp'/>"><button class="btn btn-primary">극장 등록하기</button></a>
	    </div>
	    <table class="table">
            <thead>
              <tr>
                <th>극장코드</th>
                <th>극장명</th>
                <th>지역</th>
                <th>상영관 수</th>
                <th>좌석 수</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <%for(TheaterDto dto: list){%>
              <tr>
                <td>
                	<a href="<c:url value='/theaters/TheaterDetail.jsp'/>?theater_code=<%=dto.getTheater_code()%>">
                		<%=dto.getTheater_code()%>
                	</a>
                </td>
                <td><%=dto.getName()%></td>
                <td><%=dto.getRegion()%></td>
                <td>
                	<a href="<c:url value='/screens/Screens.jsp'/>?theater_name=<%=dto.getName()%>&theater_code=<%=dto.getTheater_code()%>">
                		<%=dto.getScreens()%>
                	</a>
                </td>
                <td><%=dto.getSeats()%></td>
                <td>
                	<a href="javascript:isDelete('<%=dto.getName()%>', '<%=dto.getTheater_code()%>')">
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
    