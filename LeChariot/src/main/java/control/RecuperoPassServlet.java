package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DriverManagerConnectionPool;

/**
 * Servlet implementation class RecuperoPassServlet
 */
@WebServlet("/RecuperoPassServlet")
public class RecuperoPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con=DriverManagerConnectionPool.getConnection();
			String email= request.getParameter("email");
			String pass1= request.getParameter("pass1");
			String pass2= request.getParameter("pass2");
			
			if(pass1.equals(pass2)) {
				PreparedStatement ps= con.prepareStatement("update utente set password=? where email=?");
				ps.setString(2,email);
				ps.setString(1, pass2);
				
				ps.executeUpdate();
				response.sendRedirect("login.jsp");
			}else
				response.sendRedirect("500.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}

}
