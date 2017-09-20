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
<!-- jQuery CDN -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 달력 UI CSS/CDN -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
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
					$(":checkbox:first").val([ "" ]);
				}
			}

		});
		
		///////////////등록일 두개 띄우기
		$("select").change(function() {
			if($("select option:selected").val()=="writedate"){
				$(":text.searchWord").attr("style", "display:none");
				$(":text.searchDate1").attr("style", "display:inline");
				$(":text.searchDate2").attr("style", "display:inline");
			}
			else{
				$(":text.searchWord").attr("style", "display:inline");
				$(":text.searchDate1").attr("style", "display:none");
				$(":text.searchDate2").attr("style", "display:none");
			}
		});
		if($("select option:selected").val()=="writedate"){
			$(":text.searchWord").attr("style", "display:none");
			$(":text.searchDate1").attr("style", "display:inline");
			$(":text.searchDate2").attr("style", "display:inline");
		}
		else{
			$(":text.searchWord").attr("style", "display:inline");
			$(":text.searchDate1").attr("style", "display:none");
			$(":text.searchDate2").attr("style", "display:none");
		}
				
		
		///////////datePicker
		/* $(":text.searchDate1").datepicker({
			dateFormat:"yy-mm-dd",
			maxDate:+0,
			showButtonPanel:true,
			onSelect:function(dateText,inst){
				$(":text.searchDate2").datepicker({
					dateFormat:"yy-mm-dd",
					showButtonPanel:true,
					minDate:dateText
				});
			}
		}); */
		
		var dateFormat = "mm/dd/yy",
	      from = $(":text.searchDate1")
	        .datepicker({
	          defaultDate: "+1w",
	          numberOfMonths: 1
	        })
	        .on("change", function() {
	          to.datepicker( "option", "minDate",new Date(getitDate(this).setDate(getitDate(this).getDate()+1)));
	        }),
	      to = $(":text.searchDate2").datepicker({
	        defaultDate: "+1w",
	        numberOfMonths: 1
	      })
	      .on("change", function() {
	        from.datepicker( "option", "maxDate",new Date(getitDate(this).setDate(getitDate(this).getDate()-1)));
	      });
	 
	    function getitDate(element) {
	      var date;
	      try {
	        date = $.datepicker.parseDate(dateFormat, element.value);
	      } catch( error ) {
	        date = null;
	      }
	      return date;
	    }
	    
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
	});//////////////////////////////////////////////////////jQuery 끝
	
</script>
<script>
	var checkDelete = function() {
		var checkedNo = document.getElementsByName("checkedNo");
		var checkString = "";
		var checkedOrder = 0;
		if (checkedNo.length != 0) {
			for (var i = 0; i < checkedNo.length; i++) {
				if (checkedNo[i].checked === true) {
					checkString += "checkedNo" + checkedOrder + "="
							+ checkedNo[i].value + "&";
					checkedOrder++;
				}
			}
			if(!checkString){
				alert("삭제할 항목을 선택하세요");
				return false;
			}
			if (confirm("선택한 항목을 삭제 하시겠습니까?")) {
				location.href = "<c:url value='/review/ReviewDelete.cgv?"
						+ checkString + "'/>";
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
			<h1>평점 관리</h1>
			<p></p>
		</div>

		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1></h1>
		</div>

		<!-- 실제 내용 작성 -->
		<input class="btn btn-info" type="button" value="선택삭제" onclick="checkDelete()">
		<div>
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" value="all"></th>
						<th width="5%">번호</th>
						<th width="15%">영화</th>
						<th width="6%">피드백</th>
						<th width="34%">내용</th>
						<th width="10%">작성자</th>
						<th width="20%">등록일</th>
						<th width="10%">좋아요</th>
					</tr>
				</thead>
				<c:if test="${empty list}" var="noList">
					<tr bgcolor="white" align="center">
						<td colspan="8">등록된 평점이 없습니다</td>
					</tr>
				</c:if>
				<tbody>
					<c:if test="${not noList}">
						<c:forEach items="${list}" var="list" varStatus="loop">
							<tr>
								<td><input type="checkbox" name="checkedNo" value="${list.review_no}"></td>
								<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
								<td>${list.title}</td>
								<td>${list.feedback}</td>
								<td><a
									href="<c:url value='/review/ReviewView.jsp?review_no=${list.review_no}&nowPage=${nowPage}'/>">${list.content}</a></td>
								<td>${list.id}</td>
								<td>${list.writedate}</td>
								<td>${list.likes}</td>
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
	<form method="post" action="<c:url value='/review/Review.cgv?'/>">
		<table width="100%">
			<tr align="center">
				<td><select name="searchColumn" id="selection" style="height: 50px">
						<option value="movie_code" class="title" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("movie_code")){ %>selected="selected"<%} %>>영화제목</option>
						<option value="id" class="name" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("id")){ %>selected="selected"<%} %>>작성자</option>
						<option value="content" class="content" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("content")){ %>selected="selected"<%} %>>내용</option>
						<option value="writedate" class="datepicker" <%if(request.getAttribute("searchColumn")==null?false:request.getAttribute("searchColumn").equals("writedate")){ %>selected="selected"<%} %>>등록일</option>
					</select> 
					<input type="text" name="searchWord" size="50dp" class="searchWord" value="${param.searchWord}"/>
					<input type="text" name="searchDate1" size="20dp"
						class="searchDate1" style="display: none;" placeholder="시작일" value="${param.searchDate1}"/> 
					<input type="text" name="searchDate2" size="20dp" class="searchDate2"
						style="display: none;" placeholder="종료일" value="${param.searchDate2}"/> 
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