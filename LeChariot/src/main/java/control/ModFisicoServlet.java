package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoFisicoBean;
import model.ProdottoFisicoDAO;

/**
 * Servlet implementation class ModFisicoServlet
 */
@WebServlet("/ModFisicoServlet")
public class ModFisicoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String id= request.getParameter("id");
		int idpf= Integer.parseInt(id);
		ProdottoFisicoDAO pdao = new ProdottoFisicoDAO();
		String nome= request.getParameter("nome");
		String p= request.getParameter("prezzo");
		String tipo= request.getParameter("tipo");
		String quantita=request.getParameter("quantita");
		String action=request.getParameter("action");
		
		if(action.equals("nome")) {
			pdao.ModifyNome(idpf, nome);
			response.sendRedirect("productmodifica.jsp");
		}
		
		if(action.equals("tipo")) {
			pdao.ModifyTipo(idpf, tipo);
			response.sendRedirect("productmodifica.jsp");
		}
		
		if(action.equals("prezzo")) {
			int prezzo=Integer.parseInt(p);
			pdao.ModifyPrezzo(idpf, prezzo);
			response.sendRedirect("productmodifica.jsp");
		}
		
		if(action.equals("quantita")) {
			int q= Integer.parseInt(quantita);
			pdao.ModifyQuantitaInMagazzino(idpf, q);
			response.sendRedirect("productmodifica.jsp");
		}
		
		
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	
	}

}
