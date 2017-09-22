<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${where eq 'INS' }">
		<c:set var="SUC_MSG" value="입력 성공" />
		<c:set var="FAIL_MSG" value="입력 실패" />
		<c:set var="SUC_URL" value="/CGV/ShowTimes.cgv" />
	</c:when>
	<c:when test="${where eq 'EDT' }">
		<c:set var="SUC_MSG" value="수정 성공" />
		<c:set var="FAIL_MSG" value="수정 실패" />
		<c:set var="SUC_URL" value="/CGV/ShowTimesView.cgv?screening_code=${requestScope.screening_code}" />
	</c:when>
	<c:otherwise>
		<c:set var="SUC_MSG" value="삭제 성공" />
		<c:set var="FAIL_MSG" value="삭제 실패" />
		<c:set var ="SUC_URL" value="/CGV/ShowTimes.cgv" />
	</c:otherwise>
</c:choose>

<script>
	<c:choose>
	<c:when test="${suc_fail ge 1}">
		alert("${SUC_MSG}");
		location.href='<c:url value="${SUC_URL }"/>';
	</c:when>
	<c:when test="${suc_fail == 0}">
		alert("${FAIL_MSG}");
		history.back();
	</c:when>
	</c:choose>
</script>



