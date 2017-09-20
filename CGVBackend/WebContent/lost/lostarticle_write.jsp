<%@page import="model.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
  
  <body role="document">

    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>분실물 문의 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>분실물 문의 작성</h1>
      </div>
    
    <div><!-- 실제 내용 작성 -->  
	<table summary="글쓰기 전체 테이블">
	<form name="Write" method="post" action="<c:url value='/lost.Write.cgv'/>">

		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>

		<table summary="테이블 구성" align="center">
			<caption>
				<b>분실물 문의</b>
			</caption>
			<!-- <tr>
				<td><b>문의번호</b></td>
				<td><input type="text"  name="no" /></td>
			</tr> -->
			<tr>
				<td><b>회원아이디</b></td>
				<td><input type="text"  name="id" value="WKDDNRWJD" /></td>
			</tr>
			<tr>
				<td><b>분실 장소</b></td>
				<td><input type="text"  name="place"/></td>
			</tr>
			<tr>
				<td><b>분실날짜</b></td>
				<td><input type="text"  name="lostdate" id="datepicker"/></td>
			</tr>
			<tr>
				<td><b>분실 시간(시)</b></td>
				<td><input type="text"  name="hour" /></td>
			</tr>
			<tr>
				<td><b>분실 시간(분)</b></td>
				<td><input type="text"  name="minute"/>&nbsp;</td>
			</tr>
			
			<tr>
				<td><b>분실물 종류</b></td>
				<td><input type="text"  name="type"/></td>
			</tr>
			<tr>
				<td><b>분실물 색상</b></td>
				<td><input type="text"  name="color"/></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name="title"  /></td>
			</tr>
			<tr>
				<td><b>내 용</b></td>
				<td><textarea name="content" rows="20" cols="100"></textarea></td>
			</tr>
			<!-- <tr>
				<td><b>등록일 </b></td>
				<td><input type="text" name="wirtedate"/></td>
			</tr> -->
			<tr>
				<td colspan="2">
					<div align="center">
						<input class="btn btn-primary" type="submit" value="등록" />&nbsp;&nbsp; <a
							href="<c:url value='/lost.list.cgv'/>"><input
							type="button" class="btn btn-danger" value="뒤로"></a>
						</form>
						
					</div>
				</td>
			</tr>
		</table>
</table>

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

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    