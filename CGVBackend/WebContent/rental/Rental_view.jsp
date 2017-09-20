<%-- <%@page import="com.sun.xml.internal.txw2.Document"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String no = request.getParameter("no");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
</style>

</head>

<body>

	<table summary="글수정 전체 테이블" align="center">
		<form name="Edit" method="post"
			action="<c:url value='/rental.view.cgv'/>">

			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>

			<c:forEach var="list" items="${list}">
				<table summary="테이블 구성">

					<h2 align="center">대관 문의</h2>

					 
					<tr>
						<td>&nbsp;* 번 호</td>
						<td>&nbsp;&nbsp;${list.no}</td>
					</tr>
					<hr>
					<h2 align="left">체크(필수)된 항목은 필수 입력 사항입니다.</h2>
					<h2>영화관 선택</h2>
					<tr style="width: 20px; height: 5px;">
						*특별관/일반관
						<input type="text" name="movies" value="${list.theater}"/> * 영화관
						<input type="text" name="address" value="" /> *
						지&nbsp;&nbsp;&nbsp; 역
						<input type="text" name="cgv" value="" />
					</tr>
					</hr>

					<hr />
					<tr style="width: 20px; height: 5px;">
						* 관람&nbsp;&nbsp; 희망일
						<input type="text" value="${list.leasedate}" name="moviedate" /> * 관람시간
						<input type="text" value="${list.hour }" name="movietime" /> * 관람 인원
						<input type="text" value="${list.people }" name="moviemember" />
					</tr>
					<tr style="height: 30px;">
						<th>* 내 용</th>
						<td>&nbsp;&nbsp;&nbsp;<textarea name=moviecontent rows="5"
								cols="100">${list.content}</textarea></td>
					</tr>
					</tr>
					<tr>
						<th>* 문의자명</th>
						<td>&nbsp;&nbsp;&nbsp;<input type="text" value="${list.name}" name="rentalname" /></td>
					</tr>
					<tr>
						<th>* 연락처</th>
						<td>&nbsp;&nbsp;&nbsp;<input type="text" value='${list.phone}' name="tel" size="40" /></td>
					</tr>
					<tr>
						<th>* 이메일</th>
						<td>&nbsp;&nbsp;&nbsp;<input type=text name="email" value="${list.email}" size="40"></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<th>* 등록일</th>
						<td>&nbsp;&nbsp;&nbsp;${list.writedate}</td>

					</tr>

					</c:forEach>

					<hr></hr>

					<tr>
						<td colspan="10">
							<div align="center">

							<a href=" <c:url value='/rental/rental.list.cgv'/>"><input class="btn btn-danger" type="button" value="뒤로" /></a>&nbsp;&nbsp; 
							<%-- <a href="<c:url value='#'/> "><input type="submit" value='수정' /></a>&nbsp;&nbsp; --%>
						</form>
								<c:forEach var="list" items="${list}">
									<a href="<c:url value='/rental.delete.cgv?no=${list.no}'/>"><input class="btn btn-success" type="button" value="삭제" /></a>
								</c:forEach>
							</div>
						</td>
					</tr>
				</table>
	</table>

</body>
</html>