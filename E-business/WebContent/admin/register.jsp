<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript">
function check(){
	//获取密码框对象
	var ps = document.getElementById("ps");
	//获取确认密码框对象
	var ps2 = document.getElementById("ps2");
	//判断空
	if(ps.value==""){
		alert("密码不能为空！");
		return false;
	}
	//判断密码是否一致，不一致，返回false，停留到当前页面
	//密码一致，进行后续表单提交
	if(ps.value == ps2.value){
		return true;
	}
	else{
		alert("两次密码不一致，请重新输入！");
		return false;
	}
	alert("添加成功！");
}

</script>
</head>
<body>
<center>

<form action="userinsert.jsp" method="post">
	<table>
		<caption>用户注册</caption>
		<tr>
			<td align="right">用户名：</td>
			<td><input name="username"></td>
		</tr>
		<tr>
			<td align="right">密码：</td>
			<td><input type="password" name="password" id="ps"></td>
		</tr>
		<tr>
			<td align="right">确认密码：</td>
			<td><input type="password" name="pass2" id="ps2"></td>
		</tr>
		<tr>
			<td align="right">真实姓名：</td>
			<td><input name="realname"></td>
		</tr>
		<tr>
			<td align="right">性别：</td>
			<td align="left"><select name="gender">
			<option >男
			<option>女
			</select></td>
		</tr>
		<tr>
			<td align="right">联系地址：</td>
			<td><input name="address"></td>
		</tr>
		<tr>
			<td align="right">联系电话：</td>
			<td><input name="phone"></td>
		</tr>
		<tr>
			<td align="right">邮政编码：</td>
			<td><input name="post"></td>
		</tr>
		<tr>
			<td align="right">电子邮件：</td>
			<td><input name="email"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="添加" onclick="return check()">
			<input type="reset" value="取消">
			</td>
		</tr>
	</table>
</form>
</center>

</body>
</html>