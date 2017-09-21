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
		
			<form class="form-horizontal" name="Edit" method="post" action="<c:url value='/rental.view.cgv'/>">
				<fieldset>
				
					<!-- Form Name -->
					<h2>대관 문의</h2>
					
					<c:forEach var="list" items="${list}">
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">영화관</label>
						<div class="col-md-5">
							<input id="textinput" name="movies"  type="text" value="${list.theater}"
								class="form-control input-md">
							
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">영화관위치</label>
						<div class="col-md-5">
							<input id="textinput" name="address" type="text" class="form-control input-md" value="${list.address}">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">지 역</label>
						<div class="col-md-2">
							<input id="textinput" name="cgv" type="text" class="form-control input-md" value="${list.cgv}">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">관람 희망일</label>
						<div class="col-md-5">
							<input id="textinput" name="moviedate" type="text"
								value="${list.leasedate}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">관람시간</label>
						<div class="col-md-5">
							<input id="textinput" name="movietime" type="text"
								value="${list.hour}" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">관람인원</label>
						<div class="col-md-4">
							<input id="textinput" name="moviemember" type="text"
								value="${list.people }" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">내 용</label>
						<div class="col-md-4">
							<textarea id="textinput" name="moviecontent" type="text"
								 class="form-control input-md" rows="10">${list.content}</textarea>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">문의자명</label>
						<div class="col-md-5">
							<input id="textinput" name="rentalname" type="text" value="${list.name}"
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">연락처</label>
						<div class="col-md-4">
							<input id="textinput" name="tel" type="text"
								value='${list.phone}' class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">이메일</label>
						<div class="col-md-4">
							<input id="textinput" name="textinput" type="text" value="${list.email}"
								name="email" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">등록일</label>
						<div class="col-md-5">
							<input id="textinput" name="textinput" type="text" value="${list.writedate}"
								 class="form-control input-md">

						</div>
					</div>
					<tr>
						<td colspan="10">
							<div align="center">
							</c:forEach>
							<a href=" <c:url value='/Rental/rentallist.cgv'/>"><input type="button" value="뒤로" /></a> 
						    </form>
								<c:forEach var="list" items="${list}">
									<a href="<c:url value='/rental.delete.cgv?no=${list.no}'/>"><input type="button" value="삭제" /></a>
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