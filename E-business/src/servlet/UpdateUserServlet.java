package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取参数
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String realname = request.getParameter("realname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String post = request.getParameter("post");
		String email = request.getParameter("email");
		
		Connection conn = new DBConnection().getConnection();
		String sql = "update user set password=?,gender=?,realname=?,"
				+ "address=?,phone=?,post=?,email=? where id=? and username=?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, gender);
			pstmt.setString(3, realname);
			pstmt.setString(4,address);
			pstmt.setString(5, phone);
			pstmt.setString(6,post);
			pstmt.setString(7, email);
			pstmt.setString(8,id);
			pstmt.setString(9, username);
			int i = pstmt.executeUpdate();
			response.sendRedirect("userList");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
	}

}
