package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import model.ConsulenzaBean;
import model.CorsoBean;
import model.EffettuaBean;
import model.EffettuaDAO;
import model.OrdineBean;
import model.OrdineDAO;
import model.PagamentoBean;
import model.PagamentoDAO;
import model.ProdottoFisicoBean;
import model.ProdottoFisicoDAO;
import model.RelativoA2Bean;
import model.RelativoA2DAO;
import model.UtenteBean;
import model.UtenteDAO;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date date= new Date();
		Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
		UtenteBean auth= (UtenteBean) request.getSession().getAttribute("auth");
		UtenteDAO udao = new UtenteDAO();
		String crt = request.getParameter("numero");
		long carta = Long.parseLong(crt);
		RelativoA2DAO rdao= new RelativoA2DAO();
		EffettuaDAO edao= new EffettuaDAO();
		EffettuaBean eb= new EffettuaBean();
		PagamentoBean p = new PagamentoBean();
		PagamentoDAO pdao = new PagamentoDAO();
		ProdottoFisicoDAO pfdao= new ProdottoFisicoDAO();
		int size=0;
		ArrayList<ProdottoFisicoBean> pfisici = carrello.getPF();
		ArrayList<CorsoBean> corsi= carrello.getCorsi();
		ArrayList<ConsulenzaBean> cons= carrello.getCons();
		OrdineBean order= new OrdineBean();
		OrdineDAO odao = new OrdineDAO();
		ArrayList<OrdineBean> lista = odao.doRetrieveAll();
		Random rand= new Random();
		String m= "";
		int num=0;
		
		try{
			if(carrello!= null && auth!= null) {
			for(OrdineBean f: lista) {			
				num= Math.abs(rand.nextInt(400));
				if(f.getNumero()!=num) {
					order.setNumero(num);
					p.setOrdine(num);
					eb.setOrdine(num);
					break;
				}
			}
			eb.setUtente(auth.getEmail());
			
			p.setCarta(carta);
			order.setUid(auth.getEmail());
			order.setTotale(carrello.getTotal());
			order.setDate(date);
			order.setStato("In Preparazione");
			for(ProdottoFisicoBean f : pfisici) {
				if(f.getQuantitaInmagazzino()!=0) {
				m=m.concat(f.getNome() + "," + "\n");
				size++;
				f.setQuantitaInmagazzino(f.getQuantitaInmagazzino()-1);
				pfdao.ModifyQuantitaInMagazzino(f.getIdpf(), f.getQuantitaInmagazzino());
				}else {
					response.sendRedirect("500.jsp");
				}
				
			}
			for(CorsoBean f : corsi) {
				udao.ModifyCorsista(auth.getEmail(), true);
				order.setProdotti(order.getProdotti() + f.getNome());
				m=m.concat(f.getNome() + "," + "\n");
				size++;
			}
			}
			for(ConsulenzaBean f : cons) {
				order.setProdotti(order.getProdotti() + f.getNome());
				m=m.concat(f.getNome() + "," + "\n");
				size++;
			}
			
			order.setQuantita(size);
			order.setProdotti(m);
			odao.doSave(order);	
			edao.doSave(eb);
			pdao.doSave(p);
			for(CorsoBean f : corsi) {
				RelativoA2Bean r=  new RelativoA2Bean();
				r.setCorso(f.getIdcorso());
				r.setOrdine(num);
				rdao.doSave(num, f.getIdcorso());
			}
			carrello.clearAll();
			response.sendRedirect("acquisto.jsp");

} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

}
}
