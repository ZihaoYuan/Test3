<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	var au = document.getElementById("adminuser");
	var ap = document.getElementById("adminpass");
	if(au.value==""){
		alert("用户名不能为空！");
		return false;
	}
	if(ap.value==""){
		alert("口令不能为空！");
		return false;
	}
	
}

</script>
</head>
<body><center>
<form action="adminupdate.jsp">
用户名：<input name="adminuser" id="adminuser"><br><br>
口&nbsp;&nbsp;&nbsp;&nbsp;令：<input name="adminpass" id="adminpass"><br>
<br>
<input type="submit" value="修改" onclick="return check()"></center>
</form>
</body>
</html>