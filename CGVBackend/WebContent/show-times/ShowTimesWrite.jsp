<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	
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
    <link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script
   src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
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
  		
  		$( function() {
  		    $( "#datepicker" ).datepicker({       
  		      dateFormat: "yy-mm-dd",    
  		     });
  		  } );
  		
  		
  		function sub() {
  			var regionData= f.region.value;
  			$.ajax({
  				type : "post",
  				url : "<c:url value='/CGV/ShowTimesWrite.cgv'/>",
  				data : "region="+regionData,
  				success : result,
  				error:function(){
  					alert("AJAX에러 발생");
  				}
  			});
  		}
  		function result(msg) {
  			console.log(msg)
  			$("#theatername").html(msg);
  		}	
  		
  		 function mul() {
  			var theatername= f.theatername.value;
  			console.log("theatername타입 =" + typeof(theatername));
  			$.ajax({
  				type : "post",
  				url : "<c:url value='/CGV/ShowTimesWrite.cgv'/>",
  				data : "name="+theatername,
  				success : resultNo,
  				error:function(){
  					alert("AJAX에러 발생");
  				}
  			});
  		} 
  		 function resultNo(msg) {
  				console.log(msg)
  				$("#no").html(msg);
  			}	
  		
  		 
  		 function div() {
  				var theatername= f.theatername.value;
  				var no = f.no.value;
  				console.log("theatername타입 =" + typeof(theatername));
  				console.log("theatername =" + theatername);
  				console.log("no타입 =" + typeof(no));
  				console.log("no =" + no);
  				$.ajax({
  					type : "post",
  					url : "<c:url value='/CGV/ShowTimesWrite.cgv'/>",
  					data : "no="+no+"&name="+theatername,
  					success : resultTime,
  					error:function(){
  						alert("AJAX에러 발생");
  					}
  				});
  			} 
  		 function resultTime(msg) {
  				console.log(msg)
  				$("#time").html(msg);
  			}	
  		
	</script>
  </head>

<body role="document">

	<!-- 고정 네비바 시작 -->
	<jsp:include page="/template/TopMenu.jsp" />
	<!-- 고정 네비바 끝 -->
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>상영 시간표 등록</h1>
			<p></p>
		</div>

		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1></h1>
		</div>

		<!-- 실제 내용 작성 -->
		<div align="center">
			<form method="post" name="f" action="<c:url value='/CGV/ShowTimesWrite.cgv'/>">
			<input type="hidden" name="submit"/>
			<table class="table" style="width: 80%">
				<tbody>
					<tr >
						<td>영화 제목</td>
						
						<td>
							<select  name="title">
								<option>영화제목</option>
							<c:forEach items="${list}" var = "list">
								<option>${list.title}</option>
							</c:forEach>	
							</select>
						</td>
						
						<td>상영일</td>
						<td>
							<input style="width: 60%" type="text" name="screeningdate" id="datepicker"/>
						</td>
						
					</tr>
					<tr >
					
						<td style="width: 10%">지역</td>
						<td style="width: 12%">
							<select name="region" id="region" onchange="sub();">
								<option>지역</option>
							<c:forEach items="${regionList}" var = "regionList">
								<option>${regionList.region }</option>
							</c:forEach>		
							</select>
						</td>	
						
						<td style="width: 10%">극장 이름</td>
						<td style="width: 12%">
							
							<select name="theatername" id="theatername" onchange="mul();">
								<option>극장이름</option>							
							</select>
							
						</td>	
						
					</tr>
					<td>상영관 번호</td>
						<td>
							<select style="width: 30%" name="no" id = "no" onchange="div();">
							<option>번호</option>	
							</select>
						</td>	
					<td>상영 시간<div style="color: gray; font-weight: bold">※기존 상영시간와 겹치지 않게 주의!!</div></td>
						<td >
							<select id="time">
								<option>이미 등록된 상영 시간</option>
								
							</select>
							<input type="text" name="time"/>
						</td>
					<tr align="center">
						<td colspan="6">
							<input type="submit" value="등록"/>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>

	</div>
	<!-- 내용 끝 -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>