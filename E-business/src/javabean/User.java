package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBConnection;

public class User {
	private int id;
	private String username;
	private String password;
	private String realname;
	private String gender;
	private String address;
	private String phone;
	private String post;
	private String email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gerder) {
		this.gender = gerder;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	//添加用户信息到DB
	public boolean insert(){
		boolean result = false;
		//1.连接数据库
		DBConnection db = new DBConnection();
		Connection conn =db.getConnection();
		
		//2.执行ｉｎｓｅｒｔ语句
		String sql = "insert into user(username,password,gender,realname,address)"
				+ " values(?,?,?,?,?)";
		try {
			//定义预处理语句对象
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//用当前对象的对应属性替换问号，参数1：第X个问号
			//参数2：设置数值
			pstmt.setString(1, getUsername());
			pstmt.setString(2, getPassword());
			pstmt.setString(3, getGender());
			pstmt.setString(4, getRealname());
			pstmt.setString(5, getAddress());
			
			//执行sql
			int i = pstmt.executeUpdate();
			//3.判断添加是否成功
			if(i>0)
				result = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	

}
