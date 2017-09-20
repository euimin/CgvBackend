<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.PagingUtil"%>
<%@page import="model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>


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
    <div class="col-md-6">
    
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>ID</th>
                <th>Nick</th>
                <th>Name</th>
                <th>Birth</th>
                <th>Gender</th>
                <th>Date of Entry</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                 <c:choose>
		         	<c:when test="${empty list }">		                        
					<tr bgcolor="white" align="center">
						<td colspan="6">등록된 자료가 없어요</td>
              </tr>
		         	</c:when>       
					<c:otherwise>               	
					<c:forEach var="member" items="${list }" varStatus="loop">
      
					<tr align="center">		
						<td></td>			                             
						<td align="left"><a href="<c:url value='/MEMBERS/View.cgv?id=${member.id }'/>">${member.id }</a></td>
						<td><a href="<c:url value='/MEMBERS/View.cgv?id=${member.id }'/>">${member.nickname }</a></td>
						<td><a href="<c:url value='/MEMBERS/View.cgv?id=${member.id }'/>">${member.name }</a></td>
						<td><a href="<c:url value='/MEMBERS/View.cgv?id=${member.id }'/>">${member.birth }</a></td>
						<td>${member.gender }</td>
						<td>${member.regidate }</td>
					</tr>

					</c:forEach>
					</c:otherwise>                           
                 </c:choose>
                 
               <br /> <br />
                 
             
                 <!-- 검색UI -->
		                      <form method="post">
		                        <table width="100%">
		                         <tr align="center">
		                          <td>
		                          <select name="searchColumn">
		                           <option value="id">아이디</option>
		                           <option value="name">이름</option>
		                           <option value="nickname">닉네임</option>
		                          </select>
		                          <input type="text" name="searchWord"/>
		                          <input class="btn btn-warning" type="submit" value="검색"/>
		                          </td>
		                         </tr>
		                        </table>
		                      </form>
                  <br /> <br />
   				</tr>
   				
            </tbody>
			</table>
			 
               <!-- 페이징 -->
               <form action="/MEMBERS/List.cgv?nowPage=${nowPage }">
                <table width="100%">
		        	<tr align="center">
		        		<td style="font-size:17px;">${pagingString }</td>
		            </tr>
		        </table>
		        
                  <br />
      </div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    