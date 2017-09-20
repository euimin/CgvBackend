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
			location.href="<c:url value='/faq/FaqDelete.cgv?no=${dto.no}'/>";
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
							<td style="width: 10%; font-weight: bold">글머리</td>
							<td>${dto.category}</td>
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">조회수</td>
							<td>${dto.visitcount}</td>
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">제목</td>
							<td>${dto.title}</td>
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">내용</td>
							<td colspan="3">${dto.content}</td>
						</tr>
						<tr align="center">
							<td colspan="2"><a
								href="<c:url value='/faq/FaqEdit.cgv?no=${dto.no}&nowPage=${param.nowPage}'/>"
								id="update"><button class="btn btn-primary">수정</button></a>  <a href="javascript:isDelete()" id="delete"><button class="btn btn-success">삭제</button></a>  <a
								href='<c:url value="/faq/Faq.cgv?nowPage=${param.nowPage}"/>'><button class="btn btn-danger">목록</button></a></td>
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
