<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="javabean.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
	//访问数据库
	Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/business";
    Connection conn = DriverManager.getConnection(url,"root","root");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String realname = request.getParameter("realname");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String post = request.getParameter("post");
	String email = request.getParameter("email");
	String sql = "update user set password=?,realname=?,gender=?,"
			+ "address=?,phone=?,post=?,email=? where username=?";
	PreparedStatement pstmt;
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, password);
	pstmt.setString(2, realname);
	pstmt.setString(3, gender);
	pstmt.setString(4, address);
	pstmt.setString(5, phone);
	pstmt.setString(6, post);
	pstmt.setString(7, email);
	pstmt.setString(8, username);
	int i = pstmt.executeUpdate();
	    %>
	    <jsp:forward page="info.jsp"/>
	    <%
	pstmt.close();
	conn.close();
	
%>
</body>
</html>