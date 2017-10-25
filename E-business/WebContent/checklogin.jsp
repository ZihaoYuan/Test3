<%@page import="java.net.URLEncoder,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>
<!-- 获取用户名和密码 -->
	<%
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("username");
	  //  System.out.println(name);
	    /* byte[] b = name.getBytes("iso8859-1");
	    name = new String(b,"utf-8");
	    System.out.println(name); */
		String ps = request.getParameter("password");
	    String time=request.getParameter("time");
		//判断用户是否合法
		//合法->欢迎页面；不合法->登录页面
		if (name == null || ps == null)
			response.sendRedirect("login.jsp");
		else {
			//连接数据库，判断用户是否存在于表user中
			//1.加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			//2.建立连接对象
			String url = "jdbc:mysql://localhost:3306/business";
			String user = "root";
			String password = "root";
			Connection conn = 
					DriverManager.getConnection(url, user, password);
			//3.建立statement对象
			Statement stmt = conn.createStatement();
			//4.sql语句
			String sql = "select * from user where username='"+name
			+"' and password='"+ps+"'";
			
			//5.执行sql语句
			ResultSet rs = stmt.executeQuery(sql);
			//6.处理结果
			boolean userExist= false;
			if(rs.next()){
				//用户存在
				userExist = true;
			}
			
			
			//7.关闭连接
			rs.close();
			stmt.close();
			conn.close();
			
			if (userExist) 
			{
				//保存cookie信息
				String newName = URLEncoder.encode(name);
				Cookie c = new Cookie("username",newName);
				c.setMaxAge(Integer.parseInt(time));
				response.addCookie(c);				
				
				
			//	out.print("登陆成功!欢迎你，" + name);
			session.setAttribute("username", name);
			response.sendRedirect("page/main.jsp");
			
			} else {
				// System.out.print("登陆失败");

				out.println("用户名或密码错误，3秒后返回登录页面！\n");
				out.println("请<a href=login.jsp>点击这里</a>返回！");
				response.setHeader("refresh", "3;url=login.jsp");

				//跳转回登录界面
	%>
	<%--   <jsp:forward page="login.jsp"></jsp:forward> --%>
	<%
		}
		}
	%>
</body>
</html>