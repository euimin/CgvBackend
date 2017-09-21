<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href='<c:url value='/adminLTE/forms/General_css/a.css'/>'> --%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<body>
<!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">
	<div class="container">
		<div class="row">
			
			<form class="form-horizontal" name="Write" method="post" action="<c:url value='/lost.view.cgv'/>">
				<fieldset>
					<h1>&nbsp;&nbsp;</h1>
					<!-- Form Name -->
					<h1>분실물 문의</h1>
					
					<!-- Text input-->
					<c:forEach var="list" items="${list}">
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">문의번호</label>
						<div class="col-md-5">
							<input id="textinput" name="textinput" type="text"  value="${list.no}"
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">회원아이디</label>
						<div class="col-md-5">
							<input id="textinput" name="textinput" type="text"
								value="${list.id}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 장소</label>
						<div class="col-md-2">
							<input id="textinput" name="textinput" type="text"
								value="${list.place}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 날짜</label>
						<div class="col-md-5">
							<input id="textinput" name="textinput" type="text"
								value="${list.lostdate}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 시간(시)</label>
						<div class="col-md-5">
							<input id="textinput" name="textinput" type="text"
								 value="${list.hour }" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 시간(분)</label>
						<div class="col-md-4">
							<input id="textinput" name="textinput" type="text"
								value="${list.minute}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실물 종류</label>
						<div class="col-md-4">
							<input id="textinput" name="textinput" type="text"
								value="${list.type}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실물 색상</label>
						<div class="col-md-5">
							<input id="textinput" name="textinput" type="text" value="${list.color}"
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">제목</label>
						<div class="col-md-4">
							<input id="textinput" name="textinput" type="text"
								value="${list.title}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">내 용</label>
						<div class="col-md-4">
							<textarea id="textinput" name="textinput" type="text"
								placeholder="Start Typing...." class="form-control input-md">${list.content}</textarea>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">등록일</label>
						<div class="col-md-5">
							<input id="textinput" name="textinput" type="text"
								value="${list.writedate}" class="form-control input-md">

						</div>
					</div>
					</c:forEach>
					<div align="center">
						<input type="submit" value="등록" onclick="Submit(this.form)"/>&nbsp;&nbsp; <a
							href="<c:url value='/lost/lost.list.cgv'/>"><input
							type="button" value="뒤로"></a>
							
						</form>
						<c:forEach var="list" items="${list}">
						<a href="<c:url value='/lost_delete.cgv?no=${list.no}'/>">
						<input type="button" name="Delete" value='삭제' /></a>
						</c:forEach>
						
					</div>
				

				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>