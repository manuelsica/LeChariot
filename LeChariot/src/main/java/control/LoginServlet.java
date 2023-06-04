package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoFisicoBean;
import model.ProdottoFisicoDAO;
import model.UtenteBean;
import model.UtenteDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-password");
		UtenteDAO udao = new UtenteDAO();
		UtenteBean utente= new UtenteBean();
		ProdottoFisicoBean p= new ProdottoFisicoBean();
		ProdottoFisicoDAO dao = new ProdottoFisicoDAO();
		boolean ctrl= false;
		utente = udao.login(email,password);


		if(utente!=null) {				
				try{
					switch(utente.getDatadinascita().getMonth()) {
				case 0: p= dao.doRetriveByKey(104);
				break;
				case 1: p= dao.doRetriveByKey(104);
				break;
				case 2: p= dao.doRetriveByKey(111);
				break;
				case 3: p= dao.doRetriveByKey(115);
				break;
				case 4: p= dao.doRetriveByKey(105);
				break;
				case 5: p= dao.doRetriveByKey(113);
				break;
				case 6: p= dao.doRetriveByKey(109);
				break;
				case 7: p= dao.doRetriveByKey(112);
				break;
				case 8: p= dao.doRetriveByKey(114);
				break;
				case 9: p= dao.doRetriveByKey(106);
				break;
				case 10: p= dao.doRetriveByKey(107);
				break;
				case 11: p= dao.doRetriveByKey(110);
				break;
				case 12: p= dao.doRetriveByKey(108); 	
				}
				}catch(Exception e) {
						e.printStackTrace();
					}
			if(utente.isAdmin()==false) {
				request.getSession().setAttribute("ctrl", ctrl);
				request.getSession().setAttribute("image", p);
				request.getSession().setAttribute("auth", utente);
				response.sendRedirect("index.jsp");
			}else if(utente.isAdmin()==true) {
				request.getSession().setAttribute("ctrl", ctrl);
				request.getSession().setAttribute("image", p);
				request.getSession().setAttribute("auth", utente);
				response.sendRedirect("dashboard-admin.jsp");
			}
		}else {
			ctrl=true;
			request.getSession().setAttribute("ctrl", ctrl);
			response.sendRedirect("login.jsp");
		}
	}

}
