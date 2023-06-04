package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConsulenzaDAO;

/**
 * Servlet implementation class RemoveConsServlet
 */
@WebServlet("/RemoveConsServlet")
public class RemoveConsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		String id = request.getParameter("id");
		int idpf=Integer.parseInt(id);
		ConsulenzaDAO pdao = new ConsulenzaDAO();
		pdao.doDelete(idpf);
		response.sendRedirect("removeproduct.jsp");
		
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
}
