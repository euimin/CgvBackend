<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String movie_code = request.getParameter("movie_code");
	String movie_title = request.getParameter("movie_title");
	request.setAttribute("movie_code", movie_code);
	request.setAttribute("movie_title", movie_title);
%>
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
    <!-- DatePicker-->
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
	<!-- validation -->
	<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script> -->
    <script>
	    $(function() {			
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
		    
		    $("#back").click(function(){
				location.href="<c:url value='/movies/Still.jsp'/>?movie_code=${movie_code}&movie_title=${movie_title}";	
			});	
		    		
		    $("tr>td:first").css("width", "150px");
		});
  	</script>
  </head>

  <body role="document">
    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
    <%-- <%@ include file="/template/TopMenu.jsp"%> --%>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>영화 관리</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>스틸컷 등록</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
     <form id="frm" action="<c:url value='/movies/registerStill.cgv'/>" method="post" enctype="multipart/form-data">
     	<input type="hidden" name="movie_code" value="<%=request.getParameter("movie_code")%>"/>
     	<input type="hidden" name="movie_title" value="<%=request.getParameter("movie_title")%>"/>
     	<table class="table" style="width: 70%">
            <tbody>
                <td>등록할 사진</td>
                <td><input type="file" id="still" name="still"/></td>
              </tr>
              <tr>
                <td>이미지 미리보기</td>
                <td colspan="2"><div id="holder"></div></td>
              </tr>
              <script>
              	var upload = document.getElementById('still');
	      	    var holder = document.getElementById('holder');	
	      		upload.onchange = function (e) {
	      		  var file = upload.files[0];
	      		  var reader = new FileReader();
	      		  reader.onload = function (event) {
	      		    var img = new Image();
	      		    img.src = event.target.result;
	      		    holder.innerHTML = '';
	      		    holder.appendChild(img);
	      		  };
	      		  reader.readAsDataURL(file);
	      		};
              </script>
              <tr>
              	<td colspan="2">
              		<input class="btn btn-success" type="button" id="back" value="취소"/> 
              		<input class="btn btn-primary" type="submit" value="등록하기"/>${registerError}
              	</td>
              </tr>
            </tbody>
   	      </table>
    </form>
    </div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    