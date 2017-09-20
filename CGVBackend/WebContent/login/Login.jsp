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
<title>관리자 페이지 로그인</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="<c:url value='/bootstrap/css/signin.css'/>" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="form-signin" action="<c:url value='/Login.cgv'/>" method="post">
			<h2 class="form-signin-heading">관리자 로그인</h2>
			<label for="inputId" class="sr-only">아이디</label>
			<input name="id" type="text" id="inputId" class="form-control" placeholder="아이디" required autofocus>		
			<label for="inputPassword" class="sr-only">비밀번호</label> 
			<input name="password" type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>			
			<span style="font-weight: bold; color: #848484">${error}</span>
			<div class="checkbox">
				<label><input type="checkbox" value="remember-me">아이디 저장</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>