<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,javabean.GoodType"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<a href="type/addType.jsp">添加类别</a><br>
<!-- 显示所有查询到的商品类别 -->
<%
	List<GoodType> list = 
	(List<GoodType>)request.getAttribute("typelist");
	//循环输出list中每个对象的属性值
	for(GoodType type:list){
		out.println(type.getId()+"&nbsp;&nbsp;");
		out.println(type.getTypename());
		%>
		<a href="edittype?id=<%=type.getId()%>">修改</a>
		<a href="deletetype?id=<%=type.getId()%>">删除</a><br>
		<%
	}
%>

</body>
</html>