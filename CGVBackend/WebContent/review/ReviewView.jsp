<%@page import="model.ReviewDto"%>
<%@page import="model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String no=request.getParameter("review_no");
	request.setAttribute("review_no", no);
	ReviewDAO dao=new ReviewDAO();
	ReviewDto dto=dao.selectOne(no);
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
			location.href="<c:url value='/review/ReviewDelete.cgv?review_no=${requestScope.review_no}'/>";
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
			<h1>평점 상세</h1>
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
							<td style="width:10;font-weight: bold">글번호</td>
							<td style="width:30;"><%=dto.getReview_no() %></td>
							<td style="width:30;font-weight: bold">작성일</td>
							<td style="width:30;"><%=dto.getWritedate() %></td>
							<td style="width:10;font-weight: bold">좋아요</td>
							<td style="width:5;"><%=dto.getLikes() %></td>
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">영화제목</td>
							<td><%=dto.getTitle() %></td>
							<td style="width: 10%; font-weight: bold">아이디(닉네임)</td>
							<td><%=dto.getId()%>(<%=dto.getNickname() %>)</td>
							<td style="width: 10%; font-weight: bold">피드백</td>
							<td><%=dto.getFeedback()%></td>
							
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">내용</td>
							<td colspan="6"><%=dto.getContent()%></td>
						</tr>
						<tr>
							<td style="width: 10%; font-weight: bold">평점</td>
							<td colspan="6">
							<input type="checkbox" disabled="disabled" value="감독연출" <%if(dto.getDirectionpoint()==null?false:dto.getDirectionpoint().equalsIgnoreCase("U")){%>checked="checked"<%} %>>&nbsp감독연출&nbsp
							<input type="checkbox" disabled="disabled" value="스토리" <%if(dto.getStorypoint()==null?false:dto.getStorypoint().equalsIgnoreCase("U")){%>checked="checked"<%} %>>&nbsp스토리&nbsp
							<input type="checkbox" disabled="disabled" value="영상미" <%if(dto.getVisualpoint()==null?false:dto.getVisualpoint().equalsIgnoreCase("U")){%>checked="checked"<%} %>>&nbsp영상미&nbsp
							<input type="checkbox" disabled="disabled" value="배우연기" <%if(dto.getActingpoint()==null?false:dto.getActingpoint().equalsIgnoreCase("U")){%>checked="checked"<%} %>>&nbsp배우연기&nbsp
							<input type="checkbox" disabled="disabled" value="OST" <%if(dto.getSoundtrackpoint()==null?false:dto.getSoundtrackpoint().equalsIgnoreCase("U")){%>checked="checked"<%} %>>&nbspOST
							</td>
						</tr>
						<tr align="center">
							<td colspan="6"><a
								href='<c:url value="/review/ReviewEdit.jsp?review_no=${requestScope.review_no}"/>'
								id="update">수정</a> | <a href="javascript:isDelete()" id="delete">삭제</a> | <a
								href='<c:url value="/review/Review.cgv?nowPage=${param.nowPage}"/>'>목록</a></td>
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
