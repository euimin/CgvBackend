<%@page import="model.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  	<!-- JQuery -->
  	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
  	<!-- 달력 UI CSS/CDN -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
  	<script>
  		$(function(){
  			$("#datepicker").datepicker();
  			
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
        <h1>분실물 문의 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>분실물 문의 보기</h1>
      </div>
    
    <div><!-- 실제 내용 작성 -->  
	<table summary="분실물 문의 전체 테이블">
	<form name="Write" method="post" action="<c:url value='/lost.view.cgv'/>">

		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>

		<table summary="테이블 구성" align="center">
			<caption>
				<b>분실물 문의</b>
			</caption>
			<c:forEach var="list" items="${list}">
			<tr>
			
				<td><b>문의번호</b></td>
				<td>${list.no}</td>
			</tr>
			<tr>
				<td><b>회원아이디</b></td>
				<td>${list.id}</td>
			</tr>
			<tr>
				<td><b>분실 장소</b></td>
				<td>${list.place}</td>
			</tr>
			<tr>
				<td><b>분실날짜</b></td>
				<td>${list.lostdate}</td>
			</tr>
			<tr>
				<td><b>분실 시간(시)</b></td>
				<td>${list.hour }</td>
			</tr>
			<tr>
				<td><b>분실 시간(분)</b></td>
				<td>${list.minute}&nbsp;</td>
			</tr>
			
			<tr>
				<td><b>분실물 종류</b></td>
				<td>${list.type}</td>
			</tr>
			<tr>
				<td><b>분실물 색상</b></td>
				<td>${list.color}</td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name="title" value="${list.title}" style="width: 830px;"></td>
			</tr>
			<tr>
				<td><b>내 용</b></td>
				<td><textarea name="content" rows="20" cols="100">${list.content}</textarea></td>
			</tr>
			<tr>
				<td><b>등록일 </b></td>
				<td>${list.writedate}</td>
			</tr>
			<tr>
				<td colspan=2><hr size=1></td>
			</tr>
			<tr>
			</c:forEach>
				<td colspan="2">
					<div align="center">
						<input class="btn btn-primary" type="submit" value="등록" onclick="Submit(this.form)"/>&nbsp;&nbsp; <a
							href="<c:url value='/lost/lost.list.cgv'/>"><input
							type="button" class="btn btn-danger" value="뒤로"></a>
							
						</form>
						<c:forEach var="list" items="${list}">
						<a href="<c:url value='/lost_delete.cgv?no=${list.no}'/>">
						<input class="btn btn-success" type="button" name="Delete" value='삭제' /></a>
						</c:forEach>
						
					</div>
				</td>
			</tr>
		</table>
</table>
	

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    