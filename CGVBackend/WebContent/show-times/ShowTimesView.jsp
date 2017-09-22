<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
	
	function isDelete(){
		if(confirm("삭제 하시겠습니까?")){
			location.href="<c:url value='/CGV/ShowTimesDelete.cgv?screening_code=${dto.screening_code}'/>";
		}
	}
</script>

</head>

<body role="document">

	<!-- 고정 네비바 시작 -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!-- 고정 네비바 끝 -->
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>자주 찾는 질문 상세</h1>
			<p></p>
		</div>

		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1></h1>
		</div>

		<!-- 실제 내용 작성 -->
		<div align="center">
			<form>
				<table class="table" style="width: 80%">
					<tbody>
						<tr>
							<td style="width: 10%; font-weight: bold">상영코드</td>
							<td>${dto.screening_code}</td>
							<td style="width: 10%; font-weight: bold">상영관 코드</td>
							<td>${dto.screen_code}</td>
							<td style="width: 10%; font-weight: bold">영화 코드</td>
							<td>${dto.movie_code}</td>						
						</tr>						
						<tr>
							<td style="width: 10%; font-weight: bold">영화 제목</td>
							<td>${dto.title}</td>
							<td style="width: 10%; font-weight: bold">상영일</td>
							<td>${dto.screeningdate}</td>
							<td style="width: 10%; font-weight: bold">상영 시간</td>
							<td>${dto.time}</td>
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">장르</td>
							<td>${dto.genre}</td>
							<td style="width: 10%; font-weight: bold">등급</td>
							<td>${dto.rating}</td>
							<td style="width: 10%; font-weight: bold">러닝 타임</td>
							<td>${dto.runningtime} &nbsp;분</td>
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">개봉일</td>
							<td>${dto.releasedate}</td>
							<td style="width: 10%; font-weight: bold">상영관 번호</td> 
							<td>${dto.no}</td>
							<td style="width: 10%; font-weight: bold">좌석 수</td>
							<td>${dto.seats}</td>							
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">극장</td>
							<td>${dto.region}</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr align="center">
							<td colspan="6"><a
								href="<c:url value='/CGV/ShowTimesEdit.cgv?no=${dto.screening_code}'/>"
								id="update"><button class="btn btn-primary">수정</button></a>  <a href="javascript:isDelete()" id="delete"><button class="btn btn-success">삭제</button></a>  <a
								href='<c:url value="/CGV/ShowTimes.cgv"/>'><button class="btn btn-danger">목록</button></a></td>
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
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
		type="text/javascript"></script>
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>
