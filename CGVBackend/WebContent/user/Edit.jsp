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
    <form action="<c:url value='/MEMBERS/Edit.cgv?id=${dto.id }'/>" method="POST">
    <div class="col-md-6">
          <table width="75%" bgcolor="gray" cellspacing="1">
		                                   	
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">회원 이름</td>
		                  			<td >
		                  			${dto.name}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">닉네임</td>
		                  			<td >
		                  			${dto.nickname}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">회원 아이디</td>
		                  			<td >
		                  			${dto.id }
		                  			</td>
		                  		</tr>  
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">비밀번호</td>
		                  			<td >
		                  			<input type="password" value="${dto.password }" name="password" style="width:50%"/>
		                  			<span style="color:red;font-size:.8em;font-weight:bold">수정.삭제시 필요</span>
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td align="center">생년월일</td>
		                  			<td>
		                  			${dto.birth}
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">휴대폰 번호</td>
		                  			<td >
		                  			<input type="text"  name="phone" style="width:98%" value="${dto.phone }"/>
		                  			</td>
		                  		</tr>
		                  		<tr bgcolor="white" >
		                  			<td width="30%" align="center">이메일 주소</td>
		                  			<td >
		                  			<input type="text"  name="email" style="width:98%" value="${dto.email }"/>
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
		                  			<input class="btn btn-primary" type="submit" value="수정"/> <%if(request.getAttribute("Error")!=null){ %>${Error}<%}%>
		                  			</td>
		                  		</tr> 
		        </table>
        </div>
        </form>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    