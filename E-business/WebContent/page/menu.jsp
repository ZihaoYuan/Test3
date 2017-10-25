<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<table width="100%">
			<tr>
			<td><a href="index.jsp" target="content">首页</a></td>
			<td><a href="shop.jsp" target="content">在线购物</a></td>
			<td><a href="buyer.jsp" target="content">我的购物车</a></td>
			<td><a href="info.jsp" target="content">用户信息</a></td>
			<td><a href="../logout.jsp" target="_parent">用户退出</a></td>
			<td>用户名 ${username}</td>			
			</tr>
		</table>

</center>
</body>
</html>