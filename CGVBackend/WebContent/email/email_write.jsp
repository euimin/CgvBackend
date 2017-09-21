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
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script>
	$(function() {
		//메뉴 표시를 위한 코드
		var page = location.href;
		$('#menubar li a').each(function() {
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

<style>
	.poll_write{
		width:400px; height:27px; padding:8px; resize:none;
	}

</style>

</head>
<body>
	<!-- 고정 네비바 시작 -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!-- 고정 네비바 끝 -->
	<div class="container">
		<div class="row">
			<form class="form-horizontal" action="<c:url value='/email.write.cgv'/>" method="post" >
				<fieldset>
					<h1>&nbsp;</h1>
					<!-- Form Name -->
					<legend>이메일문의 작성</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">아이디</label>
						<div class="col-md-5">
							<input id="textinput" name="id" type="text" value="HANSOIN5"
								class="form-control input-md">

						</div>
					</div>


					<div class="form-group">
						<label class="col-md-4 control-label" for="selectbasic">문의유형</label>
						<div class="col-md-5">
							<select id="selectbasic" name="inquiry" class="form-control">
								<option value="만족">[ 만족 ]</option>
								<option value="보통">[ 보통 ]</option>
								<option value="불만">[ 불만 ]</option>
							</select>
						</div>
					</div>
					
					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="selectbasic">영화관 선택</label>
						<div class="col-md-5">
							<select id="selectbasic" name="theater" class="form-control">
								<option value="CGV선택">CGV선택</option>
								<option value="CGV강릉">CGV강릉</option>
								<option value="CGV원주">CGV원주</option>
								<option value="CGV춘천명동">CGV춘천명동</option>
								<option value="CGV목동">CGV목동</option>
								<option value="CGV강남">CGV강남</option>
								<option value="CGV강변">CGV강변</option>
								<option value="CGV강남">CGV용산</option>
								<option value="CGV용산">CGV용산</option>
							</select>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">제목</label>
						<div class="col-md-5">
							<input name="title" id="title" type="text" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">내용</label>
						<div class="col-md-4">
							<textarea name="content" id="content" type="text" 
							 class="form-control input-md"  rows="10" ></textarea>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">첨부</label>
						<div class="col-md-4">
							<input name='filename' id="filename" type="file" width="50px;" height="100px;"
								placeholder="파일을 선택하세요." class="form-control input-md">

						</div>
					</div>

					<td colspan="2">
						<div align="center">
							<input type="submit" value="등록" />&nbsp;&nbsp; 
							<a href="<c:url value='/Email/emaillist.cgv'/>"><input type="button"
								value="뒤로"></a>
						</div>
					</td>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>