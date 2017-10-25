package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class AddTypeServlet
 */
@WebServlet("/addtype")
public class AddTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		//1.��ȡ�û�����������
		String typename =request.getParameter("typename");
		//2.��ѯ����Ƿ���ڣ����ڣ�����ӣ������ڣ����
		String sql = "select * from t_goodtype where typename='"+typename+"'";
		//���ݿ���������ӣ�ִ��sql��������
		Connection conn = new DBConnection().getConnection();
		String mesg = "";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				//����
				mesg="���ڣ����������룡";
				request.setAttribute("mesg", mesg);
				RequestDispatcher dis = request.getRequestDispatcher("type/addType.jsp");
				dis.forward(request, response);
			}
			else{
				sql = "insert into t_goodtype(typename) values('"
			+typename+"')";
				int i = stmt.executeUpdate(sql);
				if(i>0){
					mesg = "��ӳɹ���";
					request.setAttribute("mesg", mesg);
					response.sendRedirect("./viewtype");
					/*RequestDispatcher dis1 = 
							request.getRequestDispatcher("/viewtype");
					dis1.forward(request, response);*/
				}
				else{
					response.sendRedirect("type/addtype.jsp");
				}
					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		

	}

}
