<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie c = new Cookie("username",null);
	c.setMaxAge(0);
	response.addCookie(c);
	
	session.invalidate();    
    response.sendRedirect("login.jsp");
    
%>