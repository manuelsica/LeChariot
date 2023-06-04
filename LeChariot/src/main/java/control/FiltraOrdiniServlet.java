package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrdineBean;
import model.OrdineDAO;

/**
 * Servlet implementation class FiltraOrdiniServlet
 */
@WebServlet("/FiltraOrdiniServlet")
public class FiltraOrdiniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String action= request.getParameter("action");
			String email= request.getParameter("email");
			String d1= request.getParameter("date1");
			String d2=request.getParameter("date2");
			OrdineDAO odao= new OrdineDAO();
			ArrayList<OrdineBean> ordini = new ArrayList<OrdineBean>();
			ArrayList<OrdineBean> from = new ArrayList<OrdineBean>();
			ArrayList<OrdineBean> to = new ArrayList<OrdineBean>();
			
			if(action.equals("email")) {
				ordini= odao.doRetrieveAll(email);
				Collections.sort(ordini);
				request.getSession().setAttribute("lista", ordini);
				response.sendRedirect("orderlist-email.jsp");
				
			}
			
			if(action.equals("data")) {
				from= odao.doRetrieveDate1(d1);
				to= odao.doRetrieveDate2(d2);
				
				for(OrdineBean b : from) {
					if(to.contains(b)) ordini.add(b);
				}

				request.getSession().setAttribute("lista", ordini);
				response.sendRedirect("orderlist-bydate.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
