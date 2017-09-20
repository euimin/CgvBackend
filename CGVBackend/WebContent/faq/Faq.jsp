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
	$(function() {
		$(":checkbox").click(function() {
			if ($(this).val() == "all") {
				if ($(this).filter(":checked").length == 1) {
					$(":checkbox:gt(0)").each(function() {
						$(this).get(0).checked = "checked";
					});
				} else {
					$(":checkbox").each(function() {
						$(this).get(0).checked = "";
					});
				}
			} else {
				if ($(this).filter(":checked").length == 1) {
					if ($(":checkbox:checked").length == $(":checkbox:gt(0)").length) {
						$(":checkbox:first").get(0).checked = "checked";
					}
				} else {
					$(":checkbox:first").val([""]);
				}
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
	
	var checkDelete = function(){
		var checkedNo=document.getElementsByName("checkedNo");
		var checkString="";
		var checkedOrder=0;
		if(checkedNo.length != 0){
			for(var i=0;i<checkedNo.length;i++){
				if(checkedNo[i].checked===true){
					checkString+="checkedNo"+checkedOrder+"="+checkedNo[i].value+"&";
					checkedOrder++;
				}
			}
			if(!checkString){
				alert("삭제할 항목을 선택하세요");
				return false;
			}
			if(confirm("선택한 항목을 삭제 하시겠습니까?")){
				location.href="<c:url value='/faq/FaqDelete.cgv?"+checkString+"'/>";
			}
		}
	};
</script>

</head>

<body role="document">

	<!-- 고정 네비바 시작 -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!-- 고정 네비바 끝 -->
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>자주 찾는 질문 관리</h1>
			<p></p>
		</div>

		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1></h1>
		</div>

		<!-- 실제 내용 작성 -->
		<div>
			<input class="btn btn-info" type="button" value="선택삭제" onclick="checkDelete()">
			<a href="<c:url value="/faq/FaqWrite.cgv"/>" style="float:right;"><button class="btn btn-primary">새로운 질문 등록하기</button></a>
		</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" value="all"></th>
						<th>번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:if test="${empty list}" var="noList">
					<tr bgcolor="white" align="center">
						<td colspan="6">등록된 자료가 없습니다</td>
					</tr>
				</c:if>
				<tbody>
					<c:if test="${not noList}">
						<c:forEach items="${list}" var="list" varStatus="loop">
							<tr>
								<td><input type="checkbox" name="checkedNo"
									value="${list.no}"></td>
								<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
								<td>${list.category}</td>
								<td><a
									href="<c:url value='/faq/FaqView.cgv?no=${list.no}&nowPage=${nowPage}'/>">${list.title}</a></td>
								<td>${list.postdate}</td>
								<td align="center">${list.visitcount}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>

			</table>
			<!-- 페이징 -->
			<table width="100%">
				<tr align="center">
					<td>${pagingString}</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 내용 끝 -->
	<!-- 검색UI -->
	<form method="get" action="<c:url value='/faq/Faq.cgv'/>">
		<table width="100%">
			<tr align="center">
				<td><select name="searchColumn" id="selection" style="height: 50px">
						<option value="title" class="title" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("movie_code")){ %>selected="selected"<%} %>>제목</option>
						<option value="content" class="content" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("content")){ %>selected="selected"<%} %>>내용</option>
						<option value="category" class="category" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("category")){ %>selected="selected"<%} %>>카테고리</option>
					</select> 
					<input type="text" name="searchWord" size="50dp" class="searchWord" value="${param.searchWord}"/>
					<input class="btn btn-warning" type="submit" value="검색" />
				</td>
			</tr>
		</table>

	</form>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>
