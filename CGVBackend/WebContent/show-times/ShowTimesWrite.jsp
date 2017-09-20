<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
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
  </head>

<body role="document">

	<!-- 고정 네비바 시작 -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!-- 고정 네비바 끝 -->
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>상영 시간표 등록</h1>
			<p></p>
		</div>

		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1></h1>
		</div>

		<!-- 실제 내용 작성 -->
		<div align="center">
			<form method="post" action="<c:url value='/CGV/ShowTimesWrite.cgv'/>">
			<table class="table" style="width: 80%">
				<tbody>
			<!-- 	<input type="hidden" id="screening_code" /> -->
					
					<tr >
						<td>영화 제목</td>
						<td>
							<input type="text" name="title"/>
						</td>
						<td>상영일</td>
						<td>
							<input type="text" name="screeningdate"/>
						</td>
						<td>상영 시간</td>
						<td >
							<select style="width: 90%" name="time">
								<option>10:30</option>
								<option>12:30</option>
								<option>16:30</option>
								<option>17:00</option>
								<option>18:30</option>
								<option>20:00</option>
								<option>21:30</option>			
							</select>
						</td>
					</tr>
					<tr >
						<td>상영관 번호</td>
						<td>
							<input type="text" name="no"/>
						</td>	
						
						<td style="width: 10%">지역</td>
						<td style="width: 12%">
							<select name="region">
								<option>서울</option>
								<option>대구</option>
								<option>부산</option>
								<option>경기도</option>				
							</select>
						</td>	
						
						<td style="width: 10%">극장 이름</td>
						<td style="width: 12%">
							<select name="name ">
								<option>CGV강남</option>
								<option>CGV강변</option>
								<option>CGV강동</option>
								<option>CGV신도림</option>
								<option>CGV대학로</option>
								<option>CGV군자</option>
								<option>CGV명동</option>				
							</select>
						</td>	
					</tr>
					<tr align="center">
						<td colspan="6">
							<input class="btn btn-primary" type="submit" value="등록"/>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>

	</div>
	<!-- 내용 끝 -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>