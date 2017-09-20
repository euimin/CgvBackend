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
    <title>CGV 관리자 페이지-회원관리</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  </head>

  <body role="document">

    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>회원 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1></h1>
      </div>
    
    <!-- 실제 내용 작성 -->  

          <table width="75%" bgcolor="gray" cellspacing="1" class="table table-condensed">
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">회원아이디</td>
		                  			<td >
		                  			${dto.id }
		                  			</td>
		                  		</tr>                  	
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">비밀번호</td>
		                  			<td >
		                  			${dto.password}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">닉네임</td>
		                  			<td >
		                  			${dto.nickname}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">회원이름</td>
		                  			<td >
		                  			${dto.name}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td align="center">생년월일</td>
		                  			<td>
		                  			${dto.birth}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td align="center">휴대폰 번호</td>
		                  			<td>
		                  			${dto.phone}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td align="center">이메일주소</td>
		                  			<td>
		                  			${dto.email}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td align="center">가입일</td>
		                  			<td>
		                  			${dto.regidate}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td align="center">성별</td>
		                  			<td>
		                  			${dto.gender}
		                  			</td>
		                  		</tr>
		                  		
		                  		<tr bgcolor="white" align="center">
		                  			<td colspan="2">
		                  			<a href="<c:url value='/MEMBERS/Edit.cgv?id=${dto.id }'/>"><button class="btn btn-primary">수정</button></a>  
		                  			<a href="<c:url value='/MEMBERS/List.cgv'/>"><button class="btn btn-danger">목록</button></a>
		                  			</td>
		                  		</tr>                  	
		        </table>

        </div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    