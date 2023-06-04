<%@ page import= "model.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }
    
    ArrayList<OrdineBean> olist = (ArrayList<OrdineBean>) session.getAttribute("lista");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista Ordini | Admin</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="icon" href="images/chRIOT.ico">
</head>
<body>
  <!--------- SideBar --------->
   <%@ include file="includes/sidebar-admin.jsp" %>
<!--------- Home Section --------->
     </div>
  <section class="home-section">
    <div class="home-content">
      <i class='bx bx-menu'></i>
      <span class="text">Lista Ordini | Admin Dashboard</span>
    </div>
    <!--------- AddProduct Section --------->
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Lista Ordini</h3>
      </div>
      <table>
        <tr>
          <th>Order Number</th>
          <th>Quantity</th>
           <th>Products</th>
          <th>Date</th>
          <th>State</th>
          <th>
        </tr>
        <% if(!olist.isEmpty()){
        	for(OrdineBean o: olist){%>
        <tr>
          <td>
                <p>Ordine n.<%=o.getNumero() %></p>
                <small class="price">Price: <%out.println(String.format("%.2f&euro;", o.getTotale()));%> 
                 <br>
                 Utente: <%=o.getUid()%></small>
                <br>
              </div>
            </div>
          </td>
          <td><%=o.getQuantita() %></td>
          <td><%=o.getProdotti() %></td>
          <td><%=o.getDate().toLocaleString() %></td>
          <td><%=o.getStato() %></td>
         <td>   </td>
        </tr>
      <%}
        	}%>
      </table>
      <!--------- Js For Animated SideBar --------->
      <script>
        let arrow = document.querySelectorAll(".arrow");
        for (var i = 0; i < arrow.length; i++) {
          arrow[i].addEventListener("click", (e) => {
            let arrowParent = e.target.parentElement.parentElement; //selecting main parent of arrow
            arrowParent.classList.toggle("showMenu");
          });
        }
        let sidebar = document.querySelector(".sidebar");
        let sidebarBtn = document.querySelector(".bx-menu");
        console.log(sidebarBtn);
        sidebarBtn.addEventListener("click", () => {
          sidebar.classList.toggle("close");
        });
      </script>
</body>

</html>