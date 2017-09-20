<%@page import="model.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>%>
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
  	<script>
  		$(function(){
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
        <h1>이메일 문의 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>이메일 문의 작성</h1>
      </div>
    
    <div><!-- 실제 내용 작성 -->  
	<form action="<c:url value='/email.write.cgv'/>" method="post" >
	<div align="center">
	<tr>
		<td>
			<table width="50%" cellpadding="0" cellspacing="0" border="1" bordercolordark="white" bordercolorlight="#E1E1E1">
				<h2><b>이메일 문의</b></h2>
				<tr>
					<td width="130" height="35" align="center" bgcolor="#F0F0F4">아이디</td>
					<td style="padding:10px;">
						 <input type="text" name="id" id="id" value="RLATKDRL" style="width:40%;height:25px;font-size:12px;"/>
					</td>
				</tr>

				<!-- <tr>
					<td width="130" height="35" align="center" bgcolor="#F0F0F4">휴대전화</td>
					<td style="padding-left:5px;">
						<input type="text" name="tel" id="tel" style="width:50%;height:25px;font-size:12px;"/>
					</td>
				</tr> -->
				<!-- <tr>
					<td width="130" height="35" align="center" bgcolor="#F0F0F4">이메일</td>
					<td style="padding-left:5px;">
						<input type="text" name="email" id="email" value="" style="width:50%;height:25px;font-size:12px;" />
					</td>
				</tr> -->
			
				<tr>
					<td width="130" height="35" align="center" bgcolor="#F0F0F4">문의유형</td>
					<td style="padding-left:5px;">
						<select name="inquiry">
							
							<option value="만족">[ 만족 ]</option>
							<option value="보통">[ 보통 ]</option>
							<option value="불만">[ 불만 ]</option>
						
					</select>
					</td>
				</tr>
				<tr>
					<td width="130" height="35" align="center" bgcolor="#F0F0F4">영화관 선택</td>
					<td style="padding-left:5px;">
					<select name="theater">
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
						<!-- <input type="text" name="theater" id="theater" value="" style="width:50%;height:25px;font-size:12px;" /> -->
					</td>
				</tr>
				<tr>
					<td width="130" height="35" align="center" bgcolor="#F0F0F4">제목</td>
					<td style="padding-left:5px;">
						<input type="text" name="title" id="title" value="" style="width:80%;height:25px;font-size:12px;" />
					</td>
				</tr>
				
				<tr> 
					<td height="35" align="center" bgcolor="#F0F0F4">내용</td>
					<td style="padding:5px;">
						<textarea name="content" id="content" rows="10" cols="30" style="width:650px; height:350px;" /></textarea>
					</td>
				</tr>
				<tr>
                    <th scope="row"><div class="tb-center">첨부</div></th>
                    <td><div class="tb-left"><input type='file' name='filename' id="filename"/></div></td>
                </tr>
                <!-- <tr>
					<td width="130" height="35" align="center" bgcolor="#F0F0F4">등록일</td>
					<td style="padding-left:5px;">
						<input type="text" name="writedate" id="writedate" value="" style="width:80%;height:25px;font-size:12px;" />
					</td>
				</tr> -->
				</div>
				
			</table>
			</tr> 
				<tr>
					<td colspan="2">
						<div align="center">
							<input class="btn btn-primary" type="submit" value="등록" />&nbsp;&nbsp; 
							<a href="<c:url value='/email.list.cgv'/>"><input class="btn btn-danger" type="button" value="뒤로"></a>
					</div>
				</td>
			</tr>
		</td>
	</tr>
	</div>
</form>
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
    