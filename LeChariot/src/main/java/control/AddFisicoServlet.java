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
 * Servlet implementation class AddFisicoServlet
 */
@WebServlet("/AddFisicoServlet")
public class AddFisicoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	
			String id= request.getParameter("id");
			int idpf= Integer.parseInt(id);
			String nome= request.getParameter("nome");
			String desc=request.getParameter("desc");
			String prezzo= request.getParameter("prezzo");
			String tipo= request.getParameter("tipo");
			double p= Double.parseDouble(prezzo);
			String quantita=request.getParameter("quantita");
			int q= Integer.parseInt(quantita);
			String img1= request.getParameter("avatar1");
			String img2= request.getParameter("avatar2");
			String img3= request.getParameter("avatar3");
			String img4= request.getParameter("avatar4");
			String img5= request.getParameter("avatar5");
			ProdottoFisicoBean pf= new ProdottoFisicoBean();
			pf.setIdpf(idpf);
			pf.setNome(nome);
			pf.setTipo(tipo);
			pf.setDescrizione(desc);
			pf.setPrezzo(p);
			pf.setQuantitaInmagazzino(q);
			pf.setImage(img1);
			pf.setImage2(img2);
			pf.setImage3(img3);
			pf.setImage4(img4);
			pf.setImage5(img5);
			
			ProdottoFisicoDAO pdao= new ProdottoFisicoDAO();
			pdao.doSave(pf);
			response.sendRedirect("addProduct.jsp");
			}catch(SQLException e) {
				e.printStackTrace();
			}
	}
}
