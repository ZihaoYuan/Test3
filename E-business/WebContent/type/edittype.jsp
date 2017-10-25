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
	
	<h1> 修改商品类别</h1><br>
	<form action="updatetype" method="post">
		<input type="hidden" name="id" value="${type.id }">
		商品类别名称
		<input name="typename" value="${type.typename}"><br>
		<input type="submit" value="修改">
	</form>
</center>

</body>
</html>