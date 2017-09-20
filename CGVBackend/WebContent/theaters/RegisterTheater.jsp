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
  	<!-- Daum 주소 API -->
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	<!-- JQuery -->
  	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
  	<!-- validation -->
	<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
	<script>
		$(function(){
	    	$("#frm").validate({
				rules:{	
					name:{required:true, minlength:4},
					region:"required",
					addr1:"required",
					roadaddr1:"required",
					transportationinfo:"required",
					parkinginfo:"required",		
				}, 
				messages:{
					name:"이름을 입력하세요",
					region:"지역을 선택하세요",
					addr1:"지번 주소를 입력하세요",
					roadaddr1:"도로명 주소를 입력하세요",
					transportationinfo:"교통 정보를 입력하세요",
					parkinginfo:"주차 정보를 입력하세요",
				}			
			});/////////validate
			
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
		    
		    //$("#name").val("${dto.name}");
		    console.log($("#name").val().length);
		    if($("#name").val().length==0){
		    	$("#name").val("CGV");
		    }
		    
		    $("#region option").each(function(){
		    	if($(this).val()=="${dto.region}"){
		    		$(this).attr("selected", "selected");
		    	}
		    });
	    }); 
	
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;
	
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	                	               	             
	                if(data.userSelectedType === 'R'){
	                	document.getElementById('sample6_address_r').value = fullAddr;
	                	document.getElementById('sample6_address2_r').focus();
	                }
	                else{
	                	document.getElementById('sample6_address').value = fullAddr;
	                	document.getElementById('sample6_address2').focus();
	                }
	            }
	        }).open();
	    }
	    
	    function cancel(){
	    	location.href="<c:url value='/theaters/Theaters.jsp'/>";
	    }
	</script>
  </head>

  <body role="document">

    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>극장 등록</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1></h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
    	<!-- 
    	THEATER_CODE
		NAME
		REGION
		ADDRESS
		TRANSPORTATIONINFO
		PARKINGINFO
		SCREENS
		SEATS   -->
		<form id="frm" method="post" action="<c:url value='/theaters/registerTheater.cgv'/>">
    	<table class="table">
            <tbody>
              <tr>
                <td>극장명</td>
                <td><input type="text" name="name"  id="name" value="${dto.name}"/></td>
              </tr>
              <tr>
                <td>지역</td>
                <td>
                	<select name="region" id="region">
                		<option value="">=지역 선택=</option>
                		<option value="서울">서울</option>
                		<option value="경기">경기</option>
                		<option value="인천">인천</option>
                		<option value="강원">강원</option>
                		<option value="대전">대전/충청</option>
                		<option value="대구">대구</option>
                		<option value="부산/울산">부산/울산</option>
                		<option value="경상">경상</option>
                		<option value="광주/전라/제주">광주/전라/제주</option>
                	</select>
                </td>
              </tr>
              <tr>
                <td>주소</td>
                <td>	
					<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"/><br>
					주소1(도로명 주소)<br/>
					<input type="text" name="roadaddr1" id="sample6_address_r" 
						placeholder="주소" style="width: 500px" value="${dto.roadaddr1}"/><br/>
					<input type="text" name="roadaddr2" id="sample6_address2_r" 
						placeholder="상세주소" style="width: 500px" value="${dto.roadaddr2}"/>
					<hr/>
					주소2(지번 주소)<br/>
					<input type="text" name="addr1" id="sample6_address" 
						placeholder="주소" style="width: 500px" value="${dto.addr1}"/><br/>
					<input type="text" name="addr2" id="sample6_address2" 
						placeholder="상세주소" style="width: 500px" value="${dto.addr2}"/>			
                </td>
              </tr>
              <tr>
                <td>교통 안내</td>
                <td><textarea name="transportationinfo" rows="10" style="width: 500px">${dto.transportationinfo}</textarea></td>
              </tr>
              <tr>
                <td>주차 안내</td>
                <td><textarea name="parkinginfo" rows="10" style="width: 500px">${dto.parkinginfo}</textarea></td>
              </tr>
              <tr>
              <tr>
              	<td colspan="2">
              		<input class="btn btn-success" type="button" value="취소" onclick="cancel()"/>
              		<input class="btn btn-primary" type="submit" value="등록"/>${registerError}
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
    