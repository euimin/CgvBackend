<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String seatnumber = request.getParameter("seatnumber");
	String screen_code = request.getParameter("screen_code");
	String seat = request.getParameter("seat");
	
	BackendDAO dao = new BackendDAO(application);
	dao.registerSeat(seatnumber, screen_code, seat);
	dao.close();
%>