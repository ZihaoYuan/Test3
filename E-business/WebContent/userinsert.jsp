<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="javabean.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<% if(user.insert())
	response.sendRedirect("login.jsp");
   else
	   response.sendRedirect("register.jsp");
 %>
</body>
</html>