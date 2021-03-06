<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>CGV 관리자 페이지-회원관리</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
</head>

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
});

var checkDelete = function(){
	var checkedNo = document.getElementsByName("checkedNo");
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
			location.href="<c:url value='/rental.delete.cgv?"+checkString+"'/>";
		}
	}
};
</script>
<body role="document">

	<!-- 고정 네비바 시작 -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!-- 고정 네비바 끝 -->
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header"></div>
		<h2 class="sub-header">단체/대관 문의</h2>
		<form action="/rental.list.cgv" method="posts">
			<div class="table-responsive">
				<div align="center">
					<div align="right">
						<div>
							<select>
								<option value="[행사/이벤트]">행사/이벤트</option>
								<option value="[시스템점검]">시스템점검</option>
								<option value="[극장]">극장</option>
								<option value="기타">기타</option>
							</select> <input type="text" value="검색" maxlength="60" size="70" placeholder="검색어를 입력하세요">
							<input type="button" name="serch" value='검색'"/>
							<a href="<c:url value='/rental/rental_write.jsp'/>"><input
								type="button" name="Write" value='글작성' "/></a>
								<input type="button" name="Delete" value='삭제' onclick="checkDelete()"/>

						</div>
					</div>
				</div>
				</from>
				<table width=100%>
					<tr align="right">

					</tr>

				</table>

				<table class="table table-striped">
					<thead>
						<th><input type="checkbox" value="all" /></th>
						<th>번호</th>
						<th>영화관</th>
						<th>희망 인원</th>
						<th>내용</th>
						<th>문의자명</th>
						<th>연락처</th>
						<th>등록일</th>
						
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="loop">
							<tr>
								<td><input type="checkbox" name="checkedNo" value="${list.no}" /></td>
								<td>${totalRecordCount -(((nowPage -1)* pageSize) + loop.index)}</td>
								<td>${list.theater}</td>
								<td>${list.people}</td>		//
								<td><a href="<c:url value='/rental.view.cgv?no=${list.no}'/>">${list.content}</a></td>
								<td>${list.name}</td>
								<td>${list.phone}</td>
								<td>${list.writedate}</td>//
								
								<td></td>
						</c:forEach>
						</tr>
					</tbody>
					<table width="100%">
					<tr align="center">
						<td><b>${pagingString}</b> </td>
					</tr>
					
				</table>
				</table>
			</div>
			
	</div>
	</div>
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
