<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
if(top.window != window){

    top.location = window.location;

}
</script>
<body>
<%
	Cookie[] cookies = request.getCookies();
	String nameValue="";
	boolean flag = false;
    if(cookies!=null&&cookies.length>0){
    	for(int i=0;i<cookies.length;i++){
    		Cookie s = cookies[i];
    		if(s.getName().equals("username")){
    			if(s.getValue()!=null &&!s.getValue().equals("")){
	    			flag = true;
	    			nameValue = s.getValue();
	    			break;
    			}
    		}
    	}
    }
    if(flag){
    	//保存cookie到session，跳转到主页面
    	session.setAttribute("username", URLDecoder.decode(nameValue));
    	String url = response.encodeUrl("page/main.jsp");
    	response.sendRedirect(url);
    }
    else{

%>


<center >
<img src="images/cakes.PNG" width="90%" height="300"/>
<h1>用户登录</h1>

<form action="checklogin.jsp" method="post">
<table>
	<tr>
		<td>姓名</td>
		<td><input type="text" name="username"></td>
	</tr>
	<tr>
		<td>密码</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td>保存密码</td>
		<td><input type="radio" value="0" name="time" checked="checked">不保存&nbsp;&nbsp;
		    <input type="radio" value="86400" name="time">一天&nbsp;&nbsp;
		    <input type="radio" value="604800" name="time">一周&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="登录">
		&nbsp;&nbsp;
		<a href="register.jsp">用户注册</a>
		&nbsp;&nbsp;
		<a href="admin/adminlogin.htm">管理员登录</a>
		</td>
	</tr>
	
</table>

</form>
</center>
<%} %>
</body>
</html>