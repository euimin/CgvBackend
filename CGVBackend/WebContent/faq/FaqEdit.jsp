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
<title>CGV 관리자 페이지</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
	type="text/javascript"></script>
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
	<jsp:include page="/template/TopMenu.jsp" />
	<!-- 고정 네비바 끝 -->
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>자주 찾는 질문 수정</h1>
			<p></p>
		</div>

		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1></h1>
		</div>

		<!-- 실제 내용 작성 -->
		<div align="center">
			<form method="post"
				action="<c:url value='/faq/FaqEdit.cgv?no=${dto.no}&nowPage=${param.nowPage}'/>">
				<table class="table" style="width: 80%">
					<tbody>
						<tr>
							<td style="width: 10%">글머리</td>
							<td style="width: 12%">
							<select name="category">
									<option <%if(request.getAttribute("category").equals("예매/관람권")){ %>selected="selected"<%} %>>예매/관람권</option>
									<option <%if(request.getAttribute("category").equals("멤버십/VIP")){ %>selected="selected"<%} %>>멤버십/VIP</option>
									<option <%if(request.getAttribute("category").equals("할인혜택")){ %>selected="selected"<%} %>>할인혜택</option>
									<option <%if(request.getAttribute("category").equals("영화관이용")){ %>selected="selected"<%} %>>영화관이용</option>
									<option <%if(request.getAttribute("category").equals("특별관")){ %>selected="selected"<%} %>>특별관</option>
									<option <%if(request.getAttribute("category").equals("기프트샵")){ %>selected="selected"<%} %>>기프트샵</option>
									<option <%if(request.getAttribute("category").equals("홈페이지")){ %>selected="selected"<%} %>>홈페이지</option>
									<option <%if(request.getAttribute("category").equals("모바일")){ %>selected="selected"<%} %>>모바일</option>
							</select></td>
							<td style="width: 5%">제목</td>
							<td><input type="text" style="width: 90%" name="title"
								value="${dto.title}" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3"><textarea rows="10" style="width: 100%"
									name="content">${dto.content}</textarea></td>
						</tr>
						<tr align="center">
							<td colspan="4"><input class="btn btn-primary" type="submit" value="등록" /></td>
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
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>