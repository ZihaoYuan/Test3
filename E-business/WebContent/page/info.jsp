<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../checkvalid.jsp"%>
	<%
	String username = session.getAttribute("username").toString();
	String gender="", password="",address="",realname="";
	try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://localhost/business";
		Connection conn = DriverManager.getConnection(url,"root","root");
		
		if(conn!=null&& username!=null){
			Statement statement = conn.createStatement();
	   		String sql = "select * from user where username='"+username+"'";
	   		ResultSet rs = statement.executeQuery(sql);
	   		while(rs.next()){
	   			gender=rs.getString(5);
	   			password = rs.getString(3);
	   			realname = rs.getString(4);
	   			address = rs.getString(6);
	   		}
	   		rs.close();
	   		statement.close();
	   		conn.close();
	   		}
	}
	   		catch(Exception e){
	   		out.print(e);
	   		}
		

%>
	<div align="center">
		<div>
			<p>用户信息
		</div>
		<div>
		<form action="updateuser.jsp">
			<table>
				<tr >
					<td align="left">用户名</td>
					<td><%=session.getAttribute("username")%></td>
				</tr>
				<tr>
					<td align="left">性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
					<td><%=gender%></td>
				</tr>
				<tr >
					<td align="left">联系人</td>
					<td><%=realname%></td>
				</tr>
				<tr>
					<td align="left">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
					<td><%=password%></td>
				</tr>
				<tr>
					<td align="left">地&nbsp;&nbsp;&nbsp;&nbsp;址</td>
					<td><%=address%></td>
				</tr>
				<tr >
				    <td colspan="2" align="right">
				    <input type="submit" value="修改">
				    </td>
				
				</tr>
				
			</table>
			</form>
		</div>
	</div>
</body>
</html>