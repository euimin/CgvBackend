<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<nav class="navbar navbar-inverse navbar-fixed-top"> 
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<c:url value='/First.jsp'/>">CGV 관리자 페이지</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul id="menubar" class="nav navbar-nav">
            <li><a href="<c:url value='/main/Main.jsp'/>">메인페이지 관리</a></li>
            <li><a href="<c:url value='/movies/Movie.jsp'/>">영화 관리</a></li>
            <li><a href="<c:url value='/theaters/Theaters.jsp'/>">극장 관리</a></li>
            <li><a href="<c:url value='/review/Review.cgv'/>">평점 관리</a></li>
            <li><a href="<c:url value='/CGV/ShowTimes.cgv'/>">상영시간표 관리</a></li>
            <li><a href="<c:url value='/reserve/Reserve.cgv'/>">예매 관리</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<c:url value='/faq/Faq.cgv'/>">자주 찾는 질문 관리</a></li>
                <li><a href="<c:url value='/news/news.list.cgv'/>">뉴스/공지 관리</a></li>              
                <li><a href="<c:url value='/rental/rental.list.cgv'/>">단체/대관 문의 관리</a></li>
                <li><a href="<c:url value='/email/email.list.cgv'/>">이메일 문의 관리</a></li>
                <li><a href="<c:url value='/lost/lost.list.cgv'/>">분실물 문의 관리</a></li>
              </ul>
            </li>
            <li><a href="<c:url value='/user/members.List.cgv'/>">회원 관리</a></li>
            <li><a href="<c:url value='/login/Logout.jsp'/>"><u>로그아웃</u></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav> 