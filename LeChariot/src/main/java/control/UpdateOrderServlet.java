package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrdineDAO;

/**
 * Servlet implementation class UpdateOrderServlet
 */
@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String id= request.getParameter("id");
			int num= Integer.parseInt(id);
			String stato= request.getParameter("stato");
			OrdineDAO odao = new OrdineDAO();
			odao.updateStato(num, stato);
			response.sendRedirect("orderlist.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
