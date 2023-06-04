package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConsulenzaBean;
import model.ConsulenzaDAO;

/**
 * Servlet implementation class AddConsulenzaServlet
 */
@WebServlet("/AddConsulenzaServlet")
public class AddConsulenzaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String id= request.getParameter("id");
		int idc= Integer.parseInt(id);
		String nome= request.getParameter("nome");
		String desc= request.getParameter("desc");
		String tempo= request.getParameter("tempo");
		int t= Integer.parseInt(tempo);
		String prezzo= request.getParameter("prezzo");
		double p= Double.parseDouble(prezzo);
		String img= request.getParameter("img1");
		
		ConsulenzaBean cb= new ConsulenzaBean();
		cb.setId(idc);
		cb.setDurata(t);
		cb.setDesc(desc);
		cb.setNome(nome);
		cb.setImg(img);
		cb.setPrezzo(p);
		
		ConsulenzaDAO cdao= new ConsulenzaDAO();
		cdao.doSave(cb);
		response.sendRedirect("addProduct.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
