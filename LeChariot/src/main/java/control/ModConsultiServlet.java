package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConsulenzaDAO;

/**
 * Servlet implementation class ModConsultiServlet
 */
@WebServlet("/ModConsultiServlet")
public class ModConsultiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String i= request.getParameter("id");
			int id= Integer.parseInt(i);
			
			String nome= request.getParameter("nome");
			String tempo = request.getParameter("tempo");
			String prezzo= request.getParameter("prezzo");
			String desc = request.getParameter("desc");
			String action = request.getParameter("action");
			ConsulenzaDAO cdao= new ConsulenzaDAO();
			
			if(action.equals("nome")) {
				cdao.ModifyNome(id, nome);
				response.sendRedirect("productmodifica.jsp");
			}
			
			if(action.equals("tempo")) {
				int d= Integer.parseInt(tempo);
				cdao.ModifyDurata(id,d);
				response.sendRedirect("productmodifica.jsp");
			}
			
			if(action.equals("prezzo")) {
				double p = Double.parseDouble(prezzo);
				cdao.ModifyPrezzo(id, p);
				response.sendRedirect("productmodifica.jsp");
			}
			
			if(action.equals("desc")) {
				cdao.ModifyDescrizione(id, desc);
				response.sendRedirect("productmodifica.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
