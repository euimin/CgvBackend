<%@page import="model.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
    String no = request.getParameter ("no");
	String postdate = request.getParameter ("postdate");
	String category = request.getParameter ("category");
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
  			$("#title").onclick(function(){
  				 if($(this).val() == ""){
  					 alert("제목을 입력해주세요");
  				 } 
  				 
  			 });
  			 $("#content").onclick(function(){
  				 if($(this).val() == ""){
  					 alert("내용을 입력해주세요");
  				 } 
  				 
  			 });
  			
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
        <h1>공지/뉴스 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>공지/뉴스 등록</h1>
      </div>
    
    <div><!-- 실제 내용 작성 -->  
	 <table summary="글쓰기 전체 테이블">
	<form name="BoardWriteForm" method="post" action="<c:url value='/Write.cgv'/>">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>

		<table summary="테이블 구성" align="center">
			<caption>뉴스/공지 작성</caption>
			<tr>
				<td>카테고리</td>
				<td><select name="category">
						<option value="[행사/이벤트]">[행사/이벤트]</option>
						<option value="[공지]">[공지]</option>
						<option value="[시스템점검]">[시스템점검]</option>
						<option value="[기타]">[기타]</option>
				</select></td>
			</tr>
			
			<tr>
				<td >제 목</td>
				<td><input type=text name= title></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name=content rows="10" cols="100"></textarea></td>
			</tr>
			
			<tr>
				<td colspan=2><hr size=1></td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center">
							<input class="btn btn-primary" type="submit" value="등록">&nbsp;&nbsp; 
							<a href="<c:url value='/News.cgv?'/>"><input class="btn btn-danger" type="button" value="뒤로"></a>
					</div>
				</td>
			</tr>
		</table>
	</form>
</table> 

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    