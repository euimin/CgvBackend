<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jQuery CDN -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<!-- 달력 UI CSS/CDN -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});

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

		$("#addressid").change(function() {
				
					$("#returncgv").find("option").each(function() {
						$(this).remove();
					});

					$.ajax({
						url : "<c:url value='/ajax.rental.cgv'/>",
						type : "post",
						dataType : "text",
						data : "address="+ $("#addressid option:selected").val(),
						success : function(data) {
							
							if (data == null) {
								alert("데이터는 null입니다");
							}
							$("#returncgv").html(data);
							
						}
					});
				});

	});/////////////////function()
</script>

</head>
<body>

	<!--고정네비바 시작  -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!--고정네비바 끝  -->
	<div class="container">
		<form class="form-horizontal" name="Write" method="post"
			action="<c:url value='/rental.Write.cgv'/>"
			onclick="Submit(this.form)">
			<fieldset>
				<h1>대관/대여문의</h1>

				<!-- Form Name -->
				<legend>Form Name</legend>
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectbasic">영화관선택</label>
					<div class="col-md-5">
						<select id="selectbasic" name="theater" class="form-control">
							<option value="일반관">일반관</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="selectbasic">지역선택</label>
					<div class="col-md-5">
						<select id="addressid" name="address" class="form-control">
							<option value="지역선택">지역선택</option>
							<option value="강원">강원</option>
							<option value="경기">경기</option>
							<option value="경상">경상</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
							<option value="부산">부산</option>
							<option value="서울">서울</option>
							<option value="울산">울산</option>
							<option value="인천">인천</option>
							<option value="전라">전라</option>
							<option value="제주">제주</option>
							<option value="충청">충청</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="selectbasic">CGV선택</label>

					<div class="col-md-5">
						<select id="returncgv" name="cgv" class="form-control" >
						 	<option>지역을선택하세요.</option>
						</select>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">관람희망일</label>
					<div class="col-md-5">
						<input id="datepicker" name="leasedate" type="text"
							placeholder="관람희망일을 선택해주세요." class="form-control input-md">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="selectbasic">시간선택</label>
					<div class="col-md-5">
						<select id="selectbasic" name="hour" class="form-control">
							<option value="0">시간선택</option>
							<option value="6">6시 이전</option>
							<option value="7">7시</option>
							<option value="8">8시</option>
							<option value="9">9시</option>
							<option value="10">10시</option>
							<option value="11">11시</option>
							<option value="12">12시</option>
							<option value="13">13시</option>
							<option value="14">14시</option>
							<option value="15">15시</option>
							<option value="16">16시</option>
							<option value="17">17시</option>
							<option value="18">18시</option>
							<option value="19">19시</option>
							<option value="20">20시</option>
							<option value="21">21시</option>
							<option value="22">22시</option>
							<option value="23">23시</option>
							<option value="23">23시 이후</option>
						</select>
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">희망 인원</label>
					<div class="col-md-5">
						<input id="textinput" name="people" type="text"
							placeholder="인원을 입력하세요(숫자만입력)" class="form-control input-md">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">내 용</label>
					<div class="col-md-4">
						<textarea id="textinput" name="content" type="text"
							placeholder="내용을 입력해주세요." class="form-control input-md" rows="5"></textarea>

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">문의자명</label>
					<div class="col-md-4">
						<input id="textinput" name="name" type="text"
							placeholder="문의자명을 입력해주세요" class="form-control input-md">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">연락처</label>
					<div class="col-md-5">
						<input id="textinput" name="phone" type="text"
							placeholder="연락처를 입력해주세요(-제외)" class="form-control input-md">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">이메일</label>
					<div class="col-md-4">
						<input id="textinput" name="email" type="text"
							placeholder="Email@mail.co.kr" class="form-control input-md">

					</div>
				</div>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="submit" value="등록" onclick="Submit(this.form)" />&nbsp;&nbsp;
							<a href="<c:url value='/rental.list.cgv'/>"><input
								type="button" value="뒤로"></a>
		</form>

	</div>
	</td>
	</tr>


	</fieldset>
	</form>
	</div>
	</div>
</body>
</html>