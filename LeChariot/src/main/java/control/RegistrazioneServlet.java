package control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UtenteBean;
import model.UtenteDAO;

/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String indirizzo = request.getParameter("indirizzo");
		String username = request.getParameter("username");
		String citta =request.getParameter("citta");
		String cap = request.getParameter("cap");
		Long c= Long.parseLong(cap);
		String email = request.getParameter("email");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String b = request.getParameter("bday");
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");  
		Date x= f.parse(b);
		UtenteBean bean= new UtenteBean();
		bean.setNome(nome);
		bean.setCognome(cognome);
		bean.setUsername(username);
		bean.setDatadinascita(x);
		bean.setIndirizzo(indirizzo);
		bean.setCitta(citta);
		bean.setCAP(c);
		bean.setEmail(email);
		bean.setPassword(pass1);
		
		UtenteDAO udao= new UtenteDAO();
		
			
	  if (bean.passControl(pass1, pass2)) {
					try {
						udao.doSave(bean);
						response.sendRedirect("./login.jsp");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	  }else
				response.sendRedirect("404.jsp");
	
	}catch(Exception e) {
		e.printStackTrace();
	}
	}

}
