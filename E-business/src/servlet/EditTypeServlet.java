package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javabean.GoodType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class EditTypeServlet
 */
@WebServlet("/edittype")
public class EditTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.获取参数
		 * 2.连接数据库
		 * 3.执行sql语句
		 * 4.跳转
		 */
		String id = request.getParameter("id");
		Connection conn = new DBConnection().getConnection();
		String sql = "select * from t_goodtype where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1,Integer.parseInt(id));
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				GoodType type = new GoodType();
				type.setId(rs.getInt("id"));
				type.setTypename(rs.getString("typename"));
				request.setAttribute("type", type);
			}
			request.getRequestDispatcher("type/edittype.jsp")
			.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
