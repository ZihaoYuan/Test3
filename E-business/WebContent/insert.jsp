<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
	Statement stmt = conn.createStatement();
	String sql = "insert into user(username,password,realname,gender,address)"
	+" values('"+user.getUsername()+"','"+user.getPassword()
			+"','"+user.getRealname()+"','"+user.getGender()
			+"','"+user.getAddress()+"')";
	//通过返回值判断添加是否成功；
	//如果返回值=1，表示添加一条记录
	int i = stmt.executeUpdate(sql);
	if(i>0)
		//out.println("成功！");
	    //response.sendRedirect("login.jsp");
	    %>
	    <jsp:forward page="login.jsp"/>
	    
	    <%
	stmt.close();
	conn.close();
	
%>

</body>
</html>