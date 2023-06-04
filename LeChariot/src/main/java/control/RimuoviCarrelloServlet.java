package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import model.ConsulenzaBean;
import model.CorsoBean;
import model.ProdottoFisicoBean;

/**
 * Servlet implementation class RimuoviCarrelloServlet
 */
@WebServlet("/RimuoviCarrelloServlet")
public class RimuoviCarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
		Carrello carrello= null;
		carrello= (Carrello) request.getSession().getAttribute("carrello");
		ArrayList<ProdottoFisicoBean> pfisici = carrello.getPF();
		ArrayList<CorsoBean> corsi= carrello.getCorsi();
		ArrayList<ConsulenzaBean> cons= carrello.getCons();
		String i = request.getParameter("id");
		int id=0;
		if(i!=null) id= Integer.parseInt(i);
		if(action.equals("fisico")) {
			for(ProdottoFisicoBean f:pfisici) {
				if(id==f.getIdpf()) {
				carrello.removePF(f);
				break;
				}
			}	
			response.sendRedirect("cart.jsp");
		} 
		if(action.equals("corso")) {
			for(CorsoBean f : corsi) {
				if(id==f.getIdcorso()) {
				carrello.removeCorso(f);
				break;
				}				
			}	
			response.sendRedirect("cart.jsp");
		}
		if(action.equals("cons")) {
			for(ConsulenzaBean f: cons) {
				if(id==f.getId()) {
				carrello.removeConsulenza(f);
				break;
				}				
				
			}	
			response.sendRedirect("cart.jsp");
		}else if(action.equals("clear")) {
			carrello.clearAll();
			response.sendRedirect("cart.jsp");
		}
	}


}
