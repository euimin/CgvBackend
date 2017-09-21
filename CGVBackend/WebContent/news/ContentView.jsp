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

</head>
<body>
	<!--고정네비바 시작  -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!--고정네비바 끝  -->
	<div class="container">
		<div class="row">
			<form class="form-horizontal" name="Edit" method="post" action="<c:url value='/Edit.cgv'/>" >
			
				<h1>&nbsp;</h1>
				<fieldset>
				
					<h1>공지/뉴스 보기</h1>
					
					
					<!-- Text input-->
					<c:forEach var="list" items="${list}">
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">번 호</label>
						<div class="col-md-5">
							<input id="textinput" name="no" type="text" placeholder=""
								class="form-control input-md" value="${list.no}">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">카테
							고리</label>
						<div class="col-md-5">
							<input id="textinput" name="category" type="text"
								value="${list.category}" placeholder=""
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">제 목</label>
						<div class="col-md-2">
							<input id="textinput" name="title" type="text"
								value="${list.title}" placeholder=""
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">내 용</label>
						<div class="col-md-5">
							<textarea id="textinput" name="content" placeholder=""
								class="form-control input-md" rows="10">${list.content}</textarea>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">등록일</label>
						<div class="col-md-5">
							<input id="textinput" name="postdate" type="text"
								value="${list.postdate}" placeholder=""
								class="form-control input-md">

						</div>
					</div>
					</c:forEach>
					<div align="center">
						<a href=" <c:url value='/News/newslist.cgv'/>"><input type="button" value="뒤로"/></a>&nbsp;&nbsp; 
						<a href="<c:url value='/Edit.cgv'/>"><input type="submit" value='수정'/></a>&nbsp;&nbsp;
				</form>
			<c:forEach var="list" items="${list}">
				<a href="<c:url value='/Delete.cgv?no=${list.no}'/>">
				<input type="button" value="삭제"/></a>
			</c:forEach>
		</div>

		</fieldset>
		</form>
	</div>
	</div>
</body>
</html>