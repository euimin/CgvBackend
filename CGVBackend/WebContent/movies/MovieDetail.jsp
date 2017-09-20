<%@page import="model.MovieDto"%>
<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	String movie_code = request.getParameter("movie_code");
	BackendDAO dao = new BackendDAO(application);
	MovieDto dto = dao.selectOneMovie(movie_code);
	dao.close();
	request.setAttribute("poster", dto.getPoster());
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
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/base/jquery-ui.css">
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
			
			$("#cancel").click(function(){ //취소
				location.href="<c:url value='/movies/Movie.jsp'/>";
			});
			
			$("#edit").click(function(){ //내용수정
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
	    
	    <c:if test="${not empty editSucceed}">
			alert("${editSucceed}");
			location.href="<c:url value='/movies/Movie.jsp'/>";
		</c:if>
  	</script>
  </head>

  <body role="document">
	
    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>영화 상세</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>상세보기 및 내용수정</h1>
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
     <form id="frm" action="<c:url value='/movies/editMovie.cgv'/>" method="post" enctype="multipart/form-data">
     	<input type="hidden" name="movie_code" value="<%=dto.getMovie_code()%>"/>
     	<input type="hidden" name="originalFile" value="<%=dto.getPoster()%>"/>
     	<table class="table" style="width: 70%">
            <tbody>
              <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="<%=dto.getTitle()%>"/></td>
              </tr>
              <tr>
                <td>영어 제목</td>
                <td><input type="text" name="engtitle" value="<%=dto.getEngtitle()%>"/></td>
              </tr>
              <tr>
                <td>포스터</td>
                <td>
                	<img src="<c:url value='/images/posters/${poster}'/>" alt="기존 포스터 이미지"/>
                	<br/>
                	<%=dto.getPoster()%>
                </td>
              </tr>
              <tr>
              	<td>포스터 변경</td>
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
                <td><input type="text" name="director" value="<%=dto.getDirector()%>"/></td>
              </tr>
              <tr>
                <td>배우</td>
                <td><input type="text" name="actor" value="<%=dto.getActor()%>"/></td>
              </tr>
              <tr>
              	<td>장르</td>
               	<td id="genre" style="width: 550px">
               		<span style="font-size: .8em; cursor: pointer;">
               			<img src="<c:url value='/images/trashcanIcon.jpg'/>"/>선택 비우기
               		</span>
					<table>
						<tr>
							<td><input type="checkbox" name="genre" value="가족" <%if(dto.getGenre().contains("가족")){%>checked="checked"<% } %>/>가족</td>
						   	<td><input type="checkbox" name="genre" value="공포/호러" <%if(dto.getGenre().contains("공포/호러")){%>checked="checked"<% } %>/>공포/호러</td>
						   	<td><input type="checkbox" name="genre" value="느와르"<%if(dto.getGenre().contains("느와르")){%>checked="checked"<% } %>/>느와르</td>
						   	<td><input type="checkbox" name="genre" value="단편" <%if(dto.getGenre().contains("단편")){%>checked="checked"<% } %>/>단편</td>
						   	<td><input type="checkbox" name="genre" value="다큐멘터리" <%if(dto.getGenre().contains("다큐멘터리")){%>checked="checked"<% } %>/>다큐멘터리</td>
						   	<td><input type="checkbox" name="genre" value="드라마" <%if(dto.getGenre().contains("드라마")){%>checked="checked"<% } %>/>드라마</td>		                	
						   	<td><input type="checkbox" name="genre" value="로드무비" <%if(dto.getGenre().contains("로드무비")){%>checked="checked"<% } %>/>로드무비</td>
					    </tr>	
						   	<td><input type="checkbox" name="genre" value="멜로/로맨스" <%if(dto.getGenre().contains("멜로/로맨스")){%>checked="checked"<% } %>/>멜로/로맨스</td>
						   	<td><input type="checkbox" name="genre" value="무협" <%if(dto.getGenre().contains("무협")){%>checked="checked"<% } %>/>무협</td>
						   	<td><input type="checkbox" name="genre" value="뮤지컬" <%if(dto.getGenre().contains("뮤지컬")){%>checked="checked"<% } %>/>뮤지컬</td>
						   	<td><input type="checkbox" name="genre" value="뮤직" <%if(dto.getGenre().contains("뮤직")){%>checked="checked"<% } %>/>뮤직</td>
						   	<td><input type="checkbox" name="genre" value="미스테리" <%if(dto.getGenre().contains("미스테리")){%>checked="checked"<% } %>/>미스테리</td>
						   	<td><input type="checkbox" name="genre" value="범죄" <%if(dto.getGenre().contains("범죄")){%>checked="checked"<% } %>/>범죄</td>
						   	<td><input type="checkbox" name="genre" value="SF" <%if(dto.getGenre().contains("SF")){%>checked="checked"<% } %>/>SF</td>
					    <tr>	
						   	<td><input type="checkbox" name="genre" value="서부" <%if(dto.getGenre().contains("서부")){%>checked="checked"<% } %>/>서부</td>
						   	<td><input type="checkbox" name="genre" value="스릴러" <%if(dto.getGenre().contains("스릴러")){%>checked="checked"<% } %>/>스릴러</td>
						   	<td><input type="checkbox" name="genre" value="스포츠" <%if(dto.getGenre().contains("스포츠")){%>checked="checked"<% } %>/>스포츠</td>
						   	<td><input type="checkbox" name="genre" value="시대극/사극" <%if(dto.getGenre().contains("시대극/사극")){%>checked="checked"<% } %>/>시대극/사극</td>
						   	<td><input type="checkbox" name="genre" value="아동" <%if(dto.getGenre().contains("아동")){%>checked="checked"<% } %>/>아동</td>
						   	<td><input type="checkbox" name="genre" value="애니메이션" <%if(dto.getGenre().contains("애니메이션")){%>checked="checked"<% } %>/>애니메이션</td>
						    <td><input type="checkbox" name="genre" value="액션" <%if(dto.getGenre().contains("액션")){%>checked="checked"<% } %>/>액션</td>
					    </tr>   
						    <td><input type="checkbox" name="genre" value="어드벤처" <%if(dto.getGenre().contains("어드벤처")){%>checked="checked"<% } %>/>어드벤처</td>
						    <td><input type="checkbox" name="genre" value="역사" <%if(dto.getGenre().contains("역사")){%>checked="checked"<% } %>/>역사</td>
						   	<td><input type="checkbox" name="genre" value="에로" <%if(dto.getGenre().contains("에로")){%>checked="checked"<% } %>/>에로</td>
						   	<td><input type="checkbox" name="genre" value="옴니버스" <%if(dto.getGenre().contains("옴니버스")){%>checked="checked"<% } %>/>옴니버스</td> 
						   	<td><input type="checkbox" name="genre" value="코미디" <%if(dto.getGenre().contains("코미디")){%>checked="checked"<% } %>/>코미디</td>		                	             
						    <td><input type="checkbox" name="genre" value="전기" <%if(dto.getGenre().contains("전기")){%>checked="checked"<% } %>/>전기</td>			                			                
						    <td><input type="checkbox" name="genre" value="전쟁" <%if(dto.getGenre().contains("전쟁")){%>checked="checked"<% } %>/>전쟁</td>
					    <tr>    
						    <td><input type="checkbox" name="genre" value="종교" <%if(dto.getGenre().contains("종교")){%>checked="checked"<% } %>/>종교</td>                           			
							<td><input type="checkbox" name="genre" value="재난" <%if(dto.getGenre().contains("재난")){%>checked="checked"<% } %>/>재난</td>
						    <td><input type="checkbox" name="genre" value="청춘영화" <%if(dto.getGenre().contains("청춘영화")){%>checked="checked"<% } %>/>청춘영화</td>
						    <td><input type="checkbox" name="genre" value="퀴어" <%if(dto.getGenre().contains("퀴어")){%>checked="checked"<% } %>/>퀴어</td>
						    <td><input type="checkbox" name="genre" value="환타지" <%if(dto.getGenre().contains("환타지")){%>checked="checked"<% } %>/>환타지</td>
						    <td><input type="checkbox" name="genre" value="학원물" <%if(dto.getGenre().contains("학원물")){%>checked="checked"<% } %>/>학원물</td>
						</tr>
					</table>
                	<label for="genre" class="error"></label>      
                </td>
           	  <tr>
              <tr>
                <td>관람등급</td>
                <td>
                	<select name="rating">
                		<option value="">=관람가 선택=</opton>
                		<option value="전체관람가" <%if(dto.getRating().equals("전체관람가")){%>selected="selected"<% } %>>전체관람가</option>
                		<option value="12세 관람가" <%if(dto.getRating().equals("12세 관람가")){%>selected="selected"<% } %>>12세 관람가</option>
                		<option value="15세 관람가" <%if(dto.getRating().equals("15세 관람가")){%>selected="selected"<% } %>>15세 관람가</option>
                		<option value="청소년 관람불가" <%if(dto.getRating().equals("청소년 관람불가")){%>selected="selected"<% } %>>청소년 관람불가</option>
                	</select>
                </td>
              </tr>
              <tr>
                <td>러닝타임</td>
                <td><input type="text" name="runningtime" value="<%=dto.getRunningtime()%>"/></td>
              </tr>
              <tr>
                <td>국가</td>
                <td id="country">
                	<span style="font-size: .8em; cursor:pointer;">
               			<img src="<c:url value='/images/trashcanIcon.jpg'/>"/>선택 비우기
               		</span>
               		<br/>
                	<input type="checkbox" name="country" value="한국" <%if(dto.getCountry().contains("한국")){%>checked="checked"<% } %>/>한국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="미국" <%if(dto.getCountry().contains("미국")){%>checked="checked"<% } %>/>미국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="일본" <%if(dto.getCountry().contains("일본")){%>checked="checked"<% } %>/>일본&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="중국" <%if(dto.getCountry().contains("중국")){%>checked="checked"<% } %>/>중국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="홍콩" <%if(dto.getCountry().contains("홍콩")){%>checked="checked"<% } %>/>홍콩&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="프랑스" <%if(dto.getCountry().contains("프랑스")){%>checked="checked"<% } %>/>프랑스&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="영국" <%if(dto.getCountry().contains("영국")){%>checked="checked"<% } %>/>영국&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="독일" <%if(dto.getCountry().contains("독일")){%>checked="checked"<% } %>/>독일&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="인도" <%if(dto.getCountry().contains("인도")){%>checked="checked"<% } %>/>인도&nbsp;&nbsp;
                	<input type="checkbox" name="country" value="기타" <%if(dto.getCountry().contains("기타")){%>checked="checked"<% } %>/>기타&nbsp;&nbsp;
                	<label for="country" class="error"></label>
                </td>
              </tr>
              <tr>
                <td>개봉일</td>
                <td><input type="text" id="datepicker" name="releasedate" value="<%=dto.getReleasedate()%>"/></td>
              </tr>
              <tr>
              <tr>
                <td>공식사이트</td>
                <td><input type="text" name="website" value="<%=dto.getWebsite()%>"/></td>
              </tr>
              <tr>
                <td>소개</td>
                <td><textarea rows="10" style="width: 350px" name="summary"><%=dto.getSummary()%></textarea></td>
              </tr>
              <tr>
              	<td colspan="2">
              		<input class="btn btn-success" type="button" id="cancel" value="취소"/>&nbsp;&nbsp;
              		<input class="btn btn-primary" type="button" id="edit" value="내용수정"/>${editError}
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
    