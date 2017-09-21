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
	<form class="form-horizontal" name="BoardWriteForm" method="post"
		action="<c:url value='/Write.cgv'/>">
		<div class="container">
			<h1>&nbsp;</h1>
			<h1>공지/뉴스 작성</h1>
			<div class="row">
				<fieldset>
					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="selectbasic">카테고리</label>
						<div class="col-md-5">
							<select id="selectbasic" name="category" class="form-control">
								<option value="[행사/이벤트]">[행사/이벤트]</option>
								<option value="[공지]">[공지]</option>
								<option value="[시스템점검]">[시스템점검]</option>
								<option value="[기타]">[기타]</option>
							</select>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">제 목</label>
						<div class="col-md-5">
							<input id="textinput" name="title" type="text" placeholder=""
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">내 용</label>
						<div class="col-md-5">
							<textarea id="textinput" name="content" type="text"
								placeholder="" class="form-control input-md" rows="20"></textarea>
						</div>
					</div>
					<tr>
						<td colspan="2">
							<div align="center">
								<input type="submit" value="등록">&nbsp;&nbsp; 
								<a href="<c:url value='/News/newslist.cgv'/>"><input type="button"
									value="뒤로"></a>
							</div>
						</td>
					</tr>
				</fieldset>
	</form>
	</div>
	</div>
</body>
</html>