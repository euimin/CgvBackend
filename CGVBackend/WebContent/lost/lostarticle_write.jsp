<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
  			$("#datepicker").datepicker({
  				dateFormat:"yy-mm-dd"
  			});
  			
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
	<div class="container">
	<div class="row">
		

<body>
 <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
	<div class="container">
		<div class="row">
			<form class="form-horizontal name="Write" method="post" action="<c:url value='/lost.Write.cgv'/>">
                    <h1>&nbsp;&nbsp;</h1>   
					<legend>
						<b>분실물 문의</b>
					</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">회원아이디</label>
						<div class="col-md-5">
							<input id="textinput" name="id" type="text" placeholder="" value="HANSOIN5"
								class="form-control input-md">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 장소</label>
						<div class="col-md-2">
							<input id="textinput" name="place" type="text"
								placeholder="분실장소를 입력하세요" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 날짜</label>
						<div class="col-md-5">
							<input id="datepicker" name="lostdate" type="text"
								placeholder="분실 날짜를 선택하세요." class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 시간(시)</label>
						<div class="col-md-5">
							<input id="time" name="hour" type="text"
								placeholder="분실 시간(시)을 선택하세요." class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실 시간(분)</label>
						<div class="col-md-4">
							<input id="textinput"  name="minute" type="text"
								placeholder="분실 시간(분)을 입력하세요." class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실물 종류</label>
						<div class="col-md-4">
							<input id="textinput" name="type" type="text"
								placeholder="분실물의 종류를 알려주세요." class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">분실물 색상</label>
						<div class="col-md-5">
							<input id="textinput" name="color" type="text" placeholder="분실불의 색상을 알려주세요."
								class="form-control input-md">

						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">제 목</label>
						<div class="col-md-4">
							<input id="textinput" name="title" type="text" rows="10"
								placeholder="제목을 작성해주세요." class="form-control input-md">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">내 용</label>
						<div class="col-md-4">
							<textarea id="textinput" name="content" type="text" rows="10"
								placeholder="내용을 작성해주세요." class="form-control input-md"></textarea>
						</div>
					</div>

					
					<tr>
						<td colspan="2">
							<div align="center">
								<input type="submit" value="등록" />&nbsp;&nbsp;
								 <a href="<c:url value='/lost/lost.list.cgv'/>"><input type="button" value="뒤로"></a>
							</form>
							</div>
						</td>
					</tr>
		</div>
	</div>
	<script type="text/javascript">

function send() {
    var emailEx1 = /^([A-Za-z0-9_\-.]{1,15})(@{1})([A-Za-z0-9_]{1,15})(.{1})([A-Za-z0-9_]{2,10})(.{1}[A-Za-z]{2,10})?(.{1}[A-Za-z]{2,10})?$/; 
    if (document.sendmail.sender.value.length == 0) {
        alert("보내는 사람의 이메일을 입력하세요");
        document.sendmail.sender.focus();
        return;
    }
    if (!emailEx1.test(document.sendmail.sender.value)) {
        alert ('메일 형식에 맞지 않습니다');
        document.sendmail.sender.focus();
        return;    
    }
    if (document.sendmail.subject.value.length == 0) {
        alert("제목을 입력하세요");
        document.sendmail.subject.focus();
        return;
    }
    if (document.sendmail.content.value.length == 0) {
        alert("내용을 입력하세요");
        document.sendmail.content.focus();
        return;
    }

    // 업로드 파일 체크
    if (navigator.appName.indexOf("Netscape") != -1) {
        if (document.sendmail.userfile.value.length > 0) {
            filesize = document.sendmail.userfile.files.item(0).fileSize;
        }
    } else {
        filesize = Number(document.sendmail.size_checker.fileSize);
    }

    if (typeof document.sendmail.userfile != "undefined" && document.sendmail.userfile.value.length > 0 && filesize > 154000){
       alert("보내실 파일은 150K까지 가능합니다.");
       document.sendmail.userfile.focus();
       return;
    }
    if (typeof document.sendmail.policy_agree != 'undefined' && document.sendmail.policy_agree.checked != true) {
        alert ('개인정보 처리방침에 동의를 하셔야 메일을 보내실 수 있습니다.');
        document.sendmail.policy_agree.focus();
        return;
    }            if (typeof document.sendmail.new_privacy_agree != 'undefined' && document.sendmail.new_privacy_agree[0].checked === false) {
                alert('개인정보 수집·이용 약관에 동의를 하셔야 메일을 보내실 수 있습니다.');
                return;
            }
    document.sendmail.send.value = "email";
    document.sendmail.submit();
}

</script>
</body>
</html>