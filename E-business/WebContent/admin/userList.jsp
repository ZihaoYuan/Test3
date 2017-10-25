<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,javabean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h1>用户列表</h1>
<%
	List<User> list =(List<User>)session.getAttribute("list");
    if(list!=null && list.size()>0){
    	out.print("<table border=1><tr><th>ID</th><th>用户名</th><th>密码</th><th>操作</th></tr>");
    	for(User user:list){
    		out.print("<tr>");
    		out.print("<td>"+user.getId()+"</td>");
    		out.print("<td>"+user.getUsername()+"</td>");
    		out.print("<td>"+user.getPassword()+"</td>");
    		out.print("<td><a href='../editUser?id="+user.getId()+"'>修改</a>&nbsp;<a href='../deleteUser?id="+user.getId()+"'>删除</a></td>");
    		out.print("</tr>");
    	}
    	out.print("</table>");
    }
%>
</center>
</body>
</html>