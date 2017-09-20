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
    <title>CGV 관리자 페이지-회원관리</title>
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
			$("#datepicker").datepicker({
				dateFormat: "yy-mm-dd",
				showOn : "button",
				buttonImage : "<c:url value='/images/calendarIcon.jpg'/>",
				buttonImageOnly : true,
				buttonText : "달력"
			});

			$("#genre span").click(function(){
				$("#genre :checkbox").each(function(){
					$(this).get(0).checked = "";
				});
			});
			
			$("#country span").click(function(){
				$("#country :checkbox").each(function(){
					$(this).get(0).checked = "";
				});
			});
			
			$("#frm").validate({
				rules:{	title:"required",
						director:"required",
						actor:"required",
						genre:"required",
						rating:"required",
						runningtime:{required:true, number:true},
						country:"required",
						releasedate:"required",
						summary:"required"
				}, 
				messages:{
					title:"제목 입력 요망",
					director:"감독 입력 요망",
					actor:"배우 입력 요망",
					genre:"장르 선택 요망",
					rating:"관람가 선택 요망",
					runningtime:"러닝타임(숫자) 입력 요망",
					country:"국가 선택 요망",
					releasedate:"개봉일 선택 요망",
					summary:"영화 소개 입력 요망"
				}			
			});/////////validate
			
			$(":button:eq(1)").click(function(){
				location.href="<c:url value='/movies/Movie.jsp'/>";	
			});
			
			$(":button:eq(2)").click(function(){
				if($("#frm").valid()){
					$("#frm").submit();
				}
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
		    
		    $(":text").css("width", "350px");
		    $("tr>td:first").css("width", "100px");
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
        <h1>영화 등록</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>새로운 영화 등록</h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
    <!-- 
영화 코드/ 제목/ 영어 제목/ 포스터/ 감독/ 배우/ 장르/ 관람등급/ 러닝타임(분)/ 국가/ 개봉일/ 공식사이트/ 소개
	private String movie_code;
	private String title;
	private String engtitle;
	private String poster;
	private String director;
	private String actor;
	private String genre;
	private String rating;
	private String runningtime;
	private String country;
	private String releasedate;
	private String website;
	private String summary;
     -->
     <form id="frm" action="<c:url value='/movies/registerMovie.cgv'/>" method="post" enctype="multipart/form-data">
     	<table class="table" style="width: 70%">
            <tbody>
              <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="${dto.title}"/></td>
              </tr>
              <tr>
                <td>영어 제목</td>
                <td><input type="text" name="engtitle" value="${dto.engtitle}"/></td>
              </tr>
              <tr>
                <td>포스터</td>
                <td><input type="file" id="poster" name="poster"/></td>
              </tr>
              <tr>
                <td>이미지 미리보기</td>
                <td colspan="2"><div id="holder"></div></td>
              </tr>
              <script>
              	var upload = document.getElementById('poster');
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
                <td>감독</td>
                <td><input type="text" name="director" value="${dto.director}"/></td>
              </tr>
              <tr>
                <td>배우</td>
                <td><input type="text" name="actor" value="${dto.actor}"/></td>
              </tr>
              <tr>
              	<td>장르</td>
               	<td id="genre" >
               		<span style="font-size: .8em; cursor: pointer;">
               			<img src="<c:url value='/images/trashcanIcon.jpg'/>"/>선택 비우기
               		</span>
               		<table>
               			<tr>
               				<td><input type="checkbox" name="genre" value="가족"/>가족</td>
		                	<td><input type="checkbox" name="genre" value="공포/호러"/>공포/호러</td>
		                	<td><input type="checkbox" name="genre" value="느와르"/>느와르</td>
		                	<td><input type="checkbox" name="genre" value="단편"/>단편</td>
		                	<td><input type="checkbox" name="genre" value="다큐멘터리"/>다큐멘터리</td>
		                	<td><input type="checkbox" name="genre" value="드라마"/>드라마</td>		                	
		                	<td><input type="checkbox" name="genre" value="로드무비"/>로드무비</td>
		                </tr>	
		                	<td><input type="checkbox" name="genre" value="멜로/로맨스"/>멜로/로맨스</td>
		                	<td><input type="checkbox" name="genre" value="무협"/>무협</td>
		                	<td><input type="checkbox" name="genre" value="뮤지컬"/>뮤지컬</td>
		                	<td><input type="checkbox" name="genre" value="뮤직"/>뮤직</td>
		                	<td><input type="checkbox" name="genre" value="미스테리"/>미스테리</td>
		                	<td><input type="checkbox" name="genre" value="범죄"/>범죄</td>
		                	<td><input type="checkbox" name="genre" value="SF"/>SF</td>
		                <tr>	
		                	<td><input type="checkbox" name="genre" value="서부"/>서부</td>
		                	<td><input type="checkbox" name="genre" value="스릴러"/>스릴러</td>
		                	<td><input type="checkbox" name="genre" value="스포츠"/>스포츠</td>
		                	<td><input type="checkbox" name="genre" value="시대극/사극"/>시대극/사극</td>
		                	<td><input type="checkbox" name="genre" value="아동"/>아동</td>
		                	<td><input type="checkbox" name="genre" value="애니메이션"/>애니메이션</td>
			                <td><input type="checkbox" name="genre" value="액션"/>액션</td>
			            </tr>   
			                <td><input type="checkbox" name="genre" value="어드벤처"/>어드벤처</td>
			                <td><input type="checkbox" name="genre" value="역사"/>역사</td>
		                	<td><input type="checkbox" name="genre" value="에로"/>에로</td>
		                	<td><input type="checkbox" name="genre" value="옴니버스"/>옴니버스</td> 
		                	<td><input type="checkbox" name="genre" value="코미디"/>코미디</td>		                	             
			                <td><input type="checkbox" name="genre" value="전기"/>전기</td>			                			                
			                <td><input type="checkbox" name="genre" value="전쟁"/>전쟁</td>
			            <tr>    
			                <td><input type="checkbox" name="genre" value="종교"/>종교</td>                           			
               				<td><input type="checkbox" name="genre" value="재난"/>재난</td>
			                <td><input type="checkbox" name="genre" value="청춘영화"/>청춘영화</td>
			                <td><input type="checkbox" name="genre" value="퀴어"/>퀴어</td>
			                <td><input type="checkbox" name="genre" value="환타지"/>환타지</td>
			                <td><input type="checkbox" name="genre" value="학원물"/>학원물</td>
               			</tr>
               		</table> 
                	<label for="genre" class="error"></label>      
                </td>
           	  <tr>
              <tr>
                <td>관람등급</td>
                <td>
                	<select name="rating">
                		<option value="">=관람가 선택=</option>
                		<option value="전체관람가">전체관람가</option>
                		<option value="12세 관람가">12세 관람가</option>
                		<option value="15세 관람가">15세 관람가</option>
                		<option value="청소년 관람불가">청소년 관람불가</option>
                	</select>
                </td>
              </tr>
              <tr>
                <td>러닝타임</td>
                <td><input type="text" name="runningtime" value="${dto.runningtime}"/></td>
              </tr>
              <tr>
                <td>국가</td>
                <td id="country">
                	<span style="font-size: .8em; cursor:pointer;">
               			<img src="<c:url value='/images/trashcanIcon.jpg'/>"/>선택 비우기
               		</span>
               		<br/>
                	<input type="checkbox" name="country" value="한국"/>한국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="미국"/>미국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="일본"/>일본&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="중국"/>중국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="홍콩"/>홍콩&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="프랑스"/>프랑스&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="영국"/>영국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="독일"/>독일&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="인도"/>인도&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="기타"/>기타&nbsp;&nbsp;
                	<label for="country" class="error"></label>
                </td>
              </tr>
              <tr>
                <td>개봉일</td>
                <td><input type="text" id="datepicker" name="releasedate" value="${dto.releasedate}"/></td>
              </tr>
              <tr>
              <tr>
                <td>공식사이트</td>
                <td><input type="text" name="website" value="${dto.website}"/></td>
              </tr>
              <tr>
                <td>소개</td>
                <td><textarea rows="10" style="width: 350px" name="summary">${dto.summary}</textarea></td>
              </tr>
              <tr>
              	<td colspan="2">
              		<input class="btn btn-success" type="button" value="취소"/>&nbsp;&nbsp; 
              		<input class="btn btn-primary" type="button" value="등록하기"/>${registerError}
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
    