package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.ConsulenzaBean;
import model.ConsulenzaDAO;
import model.CorsoBean;
import model.CorsoDAO;
import model.ProdottoFisicoBean;
import model.ProdottoFisicoDAO;

/**
 * Servlet implementation class AggiungiCarrelloServlet
 */
@WebServlet("/AggiungiCarrelloServlet")
public class AggiungiCarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Carrello carrello;
		ProdottoFisicoBean pf = new ProdottoFisicoBean();
		ProdottoFisicoDAO pdao = new ProdottoFisicoDAO();
		CorsoBean c = new CorsoBean();
		CorsoDAO cdao = new CorsoDAO();
		ConsulenzaBean cb = new ConsulenzaBean();
		ConsulenzaDAO cdao2 = new ConsulenzaDAO();
		
		carrello= (Carrello)session.getAttribute("carrello");
		if(carrello==null) {
			carrello= new Carrello();
			session.setAttribute("carrello", carrello);
		}
		try {
		String m=request.getParameter("id");
		int id= Integer.parseInt(m);
		String action= request.getParameter("action");
		if(action.equals("pfisico")) {
			pf=pdao.doRetriveByKey(id);
			carrello.aggiungiPF(pf,1);
			request.getSession().setAttribute("carrello", carrello);
			response.sendRedirect("products.jsp");	
		}
		if(action.equals("corsi")) {
			c=cdao.doRetriveByKey(id);
			carrello.aggiungiCorso(c);
			request.getSession().setAttribute("carrello", carrello);
			response.sendRedirect("products.jsp");	
		}
		if(action.equals("cons")) {
			cb=cdao2.doRetriveByKey(id);
			carrello.aggiungiConsulenza(cb);
			request.getSession().setAttribute("carrello", carrello);
			response.sendRedirect("products.jsp");	
		}
			
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		
	}

	

}
