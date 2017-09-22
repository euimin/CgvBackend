<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8"); %>


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

<link href="calendar.css" rel="stylesheet" type="text/css">
<!--jQuery UI CSS파일  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!--jQuery 기본 js파일  -->
<script language="javaScript" type="text/javascript"
	src="/bootstrap/js/calendar.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
/* 	
	$(function() {
		$("#testDatepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달'
		});
	});
 */
	function doDelete() {
		if (confirm("예매 취소 하시겠습니까?")) {
			return true;
		}
		return false;
	}

	$(function() {
		$(":checkbox")
				.click(
						function() {
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

	var checkDelete = function() {
		var checkedCode = document.getElementsByName("checkedCode");
		var checkString = "";
		var checkedOrder = 0;
		if (checkedCode.length != 0) {
			for (var i = 0; i < checkedCode.length; i++) {
				if (checkedCode[i].checked === true) {
					checkString+="checkedCode"+checkedOrder+"="+checkedCode[i].value+"&";
					checkedOrder++;
				}
			}
			if (confirm("선택한 항목을 삭제 하시겠습니까?")) {
				location.href = "<c:url value='/reserve/ReserveDelete.cgv?"+checkString+"'/>";
			}
		}
	};
</script>
</head>

  <body role="document">

    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>예매 관리 페이지</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>예매 관리 페이지</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
		<div>
			<table class="table">
				<thead>
				<tr>
				<td colspan="9"><input class="btn btn-info" type="button" value="선택삭제" onclick="checkDelete()"></td>
				</tr>
					<tr bgcolor="lightgray" align="center">
						<td><input type="checkbox" value="all"></td>
						
						<td>예매자아이디</td>
						<td>극장명</td>
						<td>영화제목</td>
						<td>상영일</td>
						<td>상영시간</td>
						<td>예매일</td>
						<td>좌석등급</td>
						<td>좌석번호</td>
						<td>인원</td>
						<td>취소</td>
					</tr>
				</thead>
				<!-- 예매 현황 페이지에서 좌석 수정 및 예매 취소 등을 선택할 수 있도록 하자-->
				<c:if test="${empty list}" var="noList">
					<tr> <td colspan="12">등록된 예약이 없습니다</td> 
					</tr>
                </c:if>
				<tbody>
				<c:if test="${not noList}">
					<c:forEach items="${list}" var="list">
					<tr bgcolor="white" align="center">
						<td><input type="checkbox" name="checkedCode" value="${list.r_code}"></td>
						<td>${list.r_id} </td>
						<td>${list.t_name}</td>
						<td>${list.m_title}</td>
						<td>${list.s_screeningdate} </td>
						<td>${list.s_time}</td>
						<td>${list.r_reservedate} </td>
						<td>${list.r_seat} </td>
						<td>${list.r_seatnumber} </td>
						<td>${list.r_people}</td>
						<td>
						<a href="<c:url value='/reserve/ReserveDelete.cgv?code=${list.r_code}'/>">
						<button class="btn btn-success" onclick="return doDelete()">예매 취소</button></a> 
						</td>
                    </tr>
                    </c:forEach>
						<!-- 페이징 -->
						<table width="100%">
							<tr align="center">
								<td>${pagingString}</td>
							</tr>
						</table>
					</c:if>			
						
	
			
				</tbody>
			</table>

<form method="post" action="<c:url value='/reserve/Reserve.cgv?'/>">
      <table width="100%">
         <tr align="center">
            <td><select name="searchColumn" id="selection" style="height: 25px">
                  <option value="r.id" id="r_id" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("r.id")){ %>selected="selected"<%} %>>고객아이디</option>
                  <option value="m.title" id="m_title" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("m.title")){ %>selected="selected"<%} %>>영화제목</option>
                  <option value="t.name" id="t_name" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("t.name")){ %>selected="selected"<%} %>>극장명</option>
                  <%-- <option value="s.screeningdate" id="reserveDatepicker" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("s.screeningdate")){ %>selected="selected"<%} %>>상영일</option> --%>
               </select> 
               <input type="text" name="searchWord" size="30px" class="searchWord" value="${param.searchWord}"/>
               <input class="btn btn-warning" type="submit" value="검색" />
            </td>
         </tr>
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
    