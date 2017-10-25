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
	//Statement stmt = conn.createStatement();
	String adminuser=request.getParameter("adminuser");
	String adminpass=request.getParameter("adminpass");
	String sql = "update t_admin set adminuser=?,adminpass=? where id=1";
	PreparedStatement pstmt;
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,adminuser);
	pstmt.setString(2,adminpass);
	pstmt.execute();
	//int i = stmt.executeUpdate(sql);
	//if(i>0)
		//out.println("成功！");
	    //response.sendRedirect("login.jsp");
	    %>
	    <jsp:forward page="main.htm"/>
	    
	    <%
	pstmt.close();
	//stmt.close();
	conn.close();
	
%>
</body>
</html>