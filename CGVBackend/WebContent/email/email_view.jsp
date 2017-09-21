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
			<form class="form-horizontal" method="post" action="<c:url value='/email.edit.cgv'/>" >
				<fieldset>
					<!-- Form Name -->
					<h1>&nbsp;</h1>
					<h2>이메일 문의</h2>
					<c:forEach var="list" items="${list}">
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">번호</label>
						<div class="col-md-5">
							<input id="textinput" name="no" type="text" value="${list.no}"
								class="form-control input-md">
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">이름</label>
						<div class="col-md-5">
							<input id="textinput" name="name" type="text" value="RLATKDRL"
								class="form-control input-md">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">문의유형</label>
						<div class="col-md-5">
							<input id="textinput" name="category" type="text" value="${list.category}"
								 class="form-control input-md">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">영화관 선택</label>
						<div class="col-md-2">
							<input id="textinput" name="theater" type="text" value="${list.theater}"
								 class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">제목</label>
						<div class="col-md-5">
							<input id="textinput" name="title" type="text"
								value="${list.title}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">내용</label>
						<div class="col-md-4">
							<textarea id="textinput" name="content" type="text"
								 class="form-control input-md">${list.content}</textarea>
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">첨부</label>
						<div class="col-md-5">
							<input id="textinput" name="file" type="file"
								class="form-control input-md">
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">등록일</label>
						<div class="col-md-4">
							<input id="textinput" name="writedate" type="text"
								value="${list.writedate}" class="form-control input-md">
						</div>
					</div>
				</c:forEach>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="submit" value="수정" />&nbsp;&nbsp; 
							<a href="<c:url value='/Email/emaillist.cgv'/>"><input type="button" value="뒤로"></a>
						<c:forEach var="list" items="${list}">
							<a href="<c:url value='/email.delete.cgv?no=${list.no}'/>">
							<input type="button" name="Delete" value='삭제' /></a>
						</c:forEach>
					</div>
				</td>
			</tr>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>