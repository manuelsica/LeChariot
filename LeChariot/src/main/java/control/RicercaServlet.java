package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConsulenzaBean;
import model.ConsulenzaDAO;
import model.CorsoBean;
import model.CorsoDAO;
import model.ProdottoFisicoBean;
import model.ProdottoFisicoDAO;

/**
 * Servlet implementation class RicercaServlet
 */
@WebServlet("/RicercaServlet")
public class RicercaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cerca = request.getParameter("cerca");
		ProdottoFisicoDAO pdao= new ProdottoFisicoDAO();
	    ArrayList<ProdottoFisicoBean> pfisici= pdao.getAllProducts();
	    ArrayList<ProdottoFisicoBean> lista1= new ArrayList<ProdottoFisicoBean>();
	    
	    CorsoDAO cdao= new CorsoDAO();
	    ArrayList<CorsoBean> corsi = cdao.getAllProducts();
	    ArrayList<CorsoBean> lista2= new ArrayList<CorsoBean>();
	    
	    ConsulenzaDAO cn = new ConsulenzaDAO();
	    ArrayList<ConsulenzaBean> cons = cn.getAllProducts();
	    ArrayList<ConsulenzaBean> lista3= new ArrayList<ConsulenzaBean>();
	    
	    for(ProdottoFisicoBean b : pfisici) {
	    	if(b.getNome().toLowerCase().contains(cerca)) lista1.add(b);
	    }
	    
	    for(CorsoBean b: corsi) {
	    	if(b.getNome().toLowerCase().contains(cerca)) lista2.add(b);
	    }
	    
	    for(ConsulenzaBean b: cons) {
	    	if(b.getNome().toLowerCase().contains(cerca)) lista3.add(b);
	    }
	    
	    request.getSession().setAttribute("pf", lista1);
	    request.getSession().setAttribute("cs", lista2);
	    request.getSession().setAttribute("cn", lista3);
	    response.sendRedirect("products-search.jsp");
	    
	}

}
