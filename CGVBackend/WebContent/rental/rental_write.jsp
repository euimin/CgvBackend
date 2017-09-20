<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<style>

</style>
<!-- jQuery CDN -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- 달력 UI CSS/CDN -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
<script>



	
	function wirte(obj){
		
		if(obj.theater.selectedIndex === 0){
			alert("영화관을 선택해주세요");
			obj.movies.focus();
			return false;
		}
		
		/* else if(obj.address.selectedIndex === 0){
			alert("지역을 입력해주세요");
			obj.address.focus();
			return false;
		}
		else if(obj.cgv.selectedIndex === 0){
			alert("CGV를 입력해주세요");
			obj.cgv.focus();
			return false;
		} */
		else if(obj.leasedate.selectedIndex === 0){
			alert("날짜를 입력해주세요");
			obj.moviedate.focus();
			return false;
		}
		else if(obj.hour.selectedIndex === 0){
			alert("시간을 선택해주세요");
			obj.movietime.focus();
			return false;
		}
		else if(obj.moviemember.value.length === 0){
			alert("희망인원을 선택해주세요");
			obj.moviemember.focus();
			return false;
		}
		
		else if(obj.moviecontent.value.length === 0){
			alert("내용을입력해주세요");
			obj.moviecontent.focus();
			return false;
		}
		else if(obj.rentalname.value.length === 0){
			alert("문의자명을 입력해주세요");
			obj.rentalname.focus();
			return false;
		}
		else if(obj.tel.value.length === 0){
			alert("연락 가능한번호를 입력해주세요");
			obj.tel.focus();
			return false;
		}
		
		else if(obj.email.value === ""){
			alert("이메일을 입력해주세요 ");
			obj.email.focus();
			return false;
		}
		
		
		
		
		
		
		
		
		
	}///////////
	
    function Submit(obj) {
        //alert(obj);
        if (obj === undefined) {
            obj = document.forms[0];
        }
       
        else if (wirte(obj) == true) 
        	obj.submit();
    }
	
	
	
		$(function() {
			$("#datepicker").datepicker({
				dateFormat:"yy-mm-dd"
			});
		});
		
		


</script>
</head>

<body>
	<table summary="글쓰기 전체 테이블">
		<form name="Write" method="post" action="<c:url value='/rental.Write.cgv'/>" ><!-- onclick="Submit(this.form)" -->

			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>

			<table summary="테이블 구성" align="center">
				<caption>
					<b>단체/대관 문의</b>
				</caption>
				<tr>

					<td><b>영화관선택</b></td>
					<td><select name="theater">
							<option value="특별관/일반관 선택">특별관/일반관 선택</option>
							<option value="[일반관]">일반관</option>
							<option value="[특별관]">특별관</option>

					</select></td>
				</tr>
				<!--<tr>
					<td><b>지역선택</b></td>
					<td><select name="address">
							<option value="지역선택">지역선택</option>
							<option value="강원">강원</option>
							<option value="경기">경기</option>
							<option value="경상">경상</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
							<option value="부산">부산</option>
							<option value="서울">서울</option>
							<option value="울산">울산</option>
							<option value="인천">인천</option>
							<option value="전라">전라</option>
							<option value="제주">제주</option>
							<option value="충청">충청</option>
					</select></td>
				/tr>-->
				
				<!--  <tr>
					<td><b>CGV선택</b></td>
					<td><select name="cgv">
							<option value="CGV선택">CGV선택</option>
							<option value="CGV강릉">CGV강릉</option>
							<option value="CGV원주">CGV원주</option>
							<option value="CGV춘천명동">CGV춘천명동</option>
					</select></td>
				</tr>
				-->
				<tr>
					<td><b>관람희망일</b></td>
					<td><input type="text" id="datepicker" name="leasedate"/></td>
				</tr>
				<tr>
					<td><b>시간선택</b></td>
					<td><select name="hour">
							<option value="0">시간선택</option>
							<option value="6">6시 이전</option>
							<option value="7">7시</option>
							<option value="8">8시</option>
							<option value="9">9시</option>
							<option value="10">10시</option>
							<option value="11">11시</option>
							<option value="12">12시</option>
							<option value="13">13시</option>
							<option value="14">14시</option>
							<option value="15">15시</option>
							<option value="16">16시</option>
							<option value="17">17시</option>
							<option value="18">18시</option>
							<option value="19">19시</option>
							<option value="20">20시</option>
							<option value="21">21시</option>
							<option value="22">22시</option>
							<option value="23">23시</option>
							<option value="23">23시 이후</option>
					</select></td>
				</tr>
				<tr>
					<td><b>희망 인원</b></td>
					<td><input type=text name="people" size="7">&nbsp;<b>(명)</b></td>
				</tr>
				<tr>
					<td>내 용</td>
					<td><textarea name=content rows="20" cols="100"></textarea></td>
				</tr>
				<tr>
					<td><b>문의자명</b></td>
					<td><input type=text name=name></td>
				</tr>
				<tr>
					<td><b>연락처</b></td>
					<td><input type=text name=phone></td>
				</tr>
				<tr>
					<td><b>이메일</b></td>
					<td><input type=text name=email></td>
				</tr>
				<tr>
					<td colspan=2><hr size=1></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input class="btn btn-primary" type="submit" value="등록" onclick="Submit(this.form)"/>&nbsp;&nbsp; <a
								href="<c:url value='/rental.list.cgv'/>"><input
								type="button" class="btn btn-danger" value="뒤로"></a>
							</form>
							
						</div>
					</td>
				</tr>
			</table>
	</table>

</body>
</html>