package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javabean.GoodType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class ViewGoodTypeServlet
 */
@WebServlet("/viewtype")
public class ViewGoodTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewGoodTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询所有商品类别
		/*
		 * 1.加载驱动
		 * 2.连接数据库
		 * 3.查询结果
		 * 4.处理结果并输出
		 */
		Connection conn = 
				new DBConnection().getConnection();
		String sql = "select * from t_goodtype";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//list用于将查询得到的对象封装成一个集合对象
			List<GoodType> list= new ArrayList<GoodType>();
			while(rs.next()){
				GoodType obj = new GoodType();
				obj.setId(rs.getInt("id"));
				obj.setTypename(rs.getString("typename"));
				//将obj放入list
				list.add(obj);
			}
			//将list传递到jsp页面
			request.setAttribute("typelist", list);
			//forward跳转到显示页面，保留request的属性
			RequestDispatcher dis =
					request.getRequestDispatcher("type/viewtype.jsp");
			dis.forward(request, response);
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//执行已重写的get方法处理请求
		doGet(request,response);
	}

}
