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
		//��ѯ������Ʒ���
		/*
		 * 1.��������
		 * 2.�������ݿ�
		 * 3.��ѯ���
		 * 4.�����������
		 */
		Connection conn = 
				new DBConnection().getConnection();
		String sql = "select * from t_goodtype";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//list���ڽ���ѯ�õ��Ķ����װ��һ�����϶���
			List<GoodType> list= new ArrayList<GoodType>();
			while(rs.next()){
				GoodType obj = new GoodType();
				obj.setId(rs.getInt("id"));
				obj.setTypename(rs.getString("typename"));
				//��obj����list
				list.add(obj);
			}
			//��list���ݵ�jspҳ��
			request.setAttribute("typelist", list);
			//forward��ת����ʾҳ�棬����request������
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
		//ִ������д��get������������
		doGet(request,response);
	}

}
