<%@page import="model.StillDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String movie_code = request.getParameter("movie_code");
	String movie_title = request.getParameter("movie_title");
	BackendDAO dao = new BackendDAO(application);
	List<StillDto> list = dao.selectStillList(movie_code);
%>
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
  	<!-- JQuery -->
  	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
  	
  	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
   	<style>
	    /* 미리보기 스타일 셋팅 */
	    #preview{
	        z-index: 9999;
	        position:absolute;
	        border:0px solid #ccc;
	        background:#333;
	        padding:1px;
	        display:none;
	        color:#fff;
	    }
    </style>
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
  		
  		function isDelete(filename, no){
  			if(confirm("["+filename+"]를 삭제하시겠습니까?")){
  				location.href="<c:url value='/movies/DeleteStill.jsp'/>?no="+no;
  			}
  		}
  		
  		$(document).ready(function() {
            
            var xOffset = 10;
            var yOffset = 30;

            $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
                 
                $("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='400px' /></p>"); //보여줄 이미지를 선언                      
                $("#preview")
                    .css("top",(e.pageY - xOffset) + "px")
                    .css("left",(e.pageX + yOffset) + "px")
                    .fadeIn("fast"); //미리보기 화면 설정 셋팅
            });
             
            $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
                $("#preview")
                    .css("top",(e.pageY - xOffset) + "px")
                    .css("left",(e.pageX + yOffset) + "px");
            });
             
            $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
                $("#preview").remove();
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
        <h1>영화 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>[<%=movie_title%>] 스틸컷 목록</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
    	<div align="right">
    		<a href="<c:url value='/movies/RegisterStill.jsp'/>?movie_code=<%=movie_code%>&movie_title=<%=movie_title%>">
    			스틸컷 등록하기
    		</a>
    	</div>
    	<table class="table">
            <thead>
              <tr>
                <th>고유번호</th>
                <th>미리보기</th>
                <th>파일명</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            <% if(list.size()==0){ %>
            <tr bgcolor="white" align="center">
        		<td colspan="3">등록된 스틸컷이 없습니다</td>
       		</tr>
            <% }
               else {
        	   		for(StillDto dto: list){
        	   			request.setAttribute("file", dto.getFilename());%>
		              <tr>
		                <td><%=dto.getNo()%></td>
		                <td>
		                	<img src="<c:url value='/images/stills/${file}'/>" alt="스틸컷" class="thumbnail" style="height: 100px">
		                </td>
		                <td><%=dto.getFilename()%></td>
		                <td><a href="javascript:isDelete('<%=dto.getFilename()%>', '<%=dto.getNo() %>')"><button class="btn btn-success">삭제</button></a></td>
		              </tr>
            <% 		} 
              }%>
            </tbody>
          </table>
    </div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    