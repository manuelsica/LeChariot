package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UtenteDAO;

/**
 * Servlet implementation class UpdateInfoServlet
 */
@WebServlet("/UpdateInfoServlet")
public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String nome= request.getParameter("nome");
		String id= request.getParameter("id");
		String action = request.getParameter("action");
		String cognome =  request.getParameter("cognome");
		String indirizzo = request.getParameter("indirizzo");
		String citta = request.getParameter("citta");
		String c = request.getParameter("cap");
		String b = request.getParameter("bday");
		String password= request.getParameter("password");
		
		UtenteDAO udao = new UtenteDAO();
		
		if(action.equals("nome")) {
			udao.ModifyNome(id,nome);
			response.sendRedirect("settings.jsp");
		}
		
		if(action.equals("cognome")) {
			udao.ModifyCognome(id, cognome);
			response.sendRedirect("settings.jsp");
		}
		
		if(action.equals("indirizzo")) {
			udao.ModifyIndirizzo(id, indirizzo);
			response.sendRedirect("settings.jsp");
		}
		
		if(action.equals("citta")) {
			udao.ModifyCitta(id, citta);
			response.sendRedirect("settings.jsp");
		}
		
		if(action.equals("cap")) {
			int cap = Integer.parseInt(c);
			udao.ModifyCAP(id, cap);
			response.sendRedirect("settings.jsp");
		}
		
		if(action.equals("bday")) {
			SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");  
			Date x= f.parse(b);
			udao.ModifyBday(id, x);
			response.sendRedirect("settings.jsp");
		}
		
		if(action.equals("password")) {
			udao.ModifyPassword(id, password);
			response.sendRedirect("settings.jsp");
		}
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	}

}
