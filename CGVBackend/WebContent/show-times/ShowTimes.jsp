<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
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
	</script>
  
  </head>

  <body role="document">

    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>상영시간표 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
    	<div class="page-header">
			<h1></h1>
		</div>
    <!-- 실제 내용 작성 -->  
    <a href="<c:url value="/CGV/ShowTimesWrite.cgv"/>"><button class="btn btn-primary">새로운 영화 등록하기</button></a> 
    <input type="button" class="btn btn-info" value="선택삭제" onclick="checkDelete()">
		<div>
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" value="all"></th>						
						<th>상영 코드</th>
						<th>상영관</th>
						<th>제목</th>					
						<th>영화 코드</th>
						<th>상영일</th>
						<th>상영 시간</th>
					</tr>
				</thead>
				<c:if test="${empty list}" var="noList">
					<tr bgcolor="white" align="center">
						<td colspan="6">등록된 자료가 없습니다</td>
					</tr>
				</c:if>
				<tbody>
					<c:if test="${not noList}">
						<c:forEach items="${list}" var="list">
							<tr>
								<td><input type="checkbox" name="checkedNo" value="${list.screening_code}"></td>
								<td>
								<a href="<c:url value='/CGV/ShowTimesView.cgv?code=${list.screening_code}'/>">${list.screening_code}</a>
								</td>
								<td>${list.name}</td>
								<td>${list.title} </td>
								<td>${list.movie_code }</td>
								<td>${list.screeningdate }</td>
								<td>${list.time }</td>
							 
							</tr>
						</c:forEach>
					</c:if>
				</tbody>

			</table>
		</div>
	</div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    