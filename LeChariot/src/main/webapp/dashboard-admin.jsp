<%@ page import= "model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Admin</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="icon" href="images/chRIOT.ico">
</head>
<body>
<!--------- SideBar --------->
<div class="sidebar close">
  <div class="logo-details">
    <i class='bx bxl-gitlab'></i>
    <span class="logo_name">LeChariot</span>
  </div>
  <ul class="nav-links">
    <li>
      <a href="#">
        <i class='bx bx-grid-alt' ></i>
        <span class="link_name">Dashboard</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="dashboard-admin.jsp">Dashboard</a></li>
      </ul>
    </li>
    <li>
      <div class="iocn-link">
        <a href="#">
          <i class='bx bx-collection' ></i>
          <span class="link_name">Prodotti</span>
        </a>
        <i class='bx bxs-chevron-down arrow' ></i>
      </div>
      <ul class="sub-menu">
        <li><a class="link_name" href="#">Prodotto</a></li>
        <li><a href="addProduct.jsp">Aggiungi Prodotto</a></li>
        <li><a href="productmodifica.jsp">Modifica Prodotto</a></li>
        <li><a href="removeproduct.jsp">Rimuovi Prodotto</a></li>
      </ul>
    </li>
    <li>
    <li>
      <a href="orderlist.jsp">
        <i class='bx bx-cart' ></i>
        <span class="link_name">Lista Ordini</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="orderlist.jsp">Ordini</a></li>
      </ul>
    </li>
    <li>
      <a href="index.jsp">
        <i class='bx bx-home' ></i>
        <span class="link_name">Home</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="index.jsp">Home</a></li>
      </ul>
    </li>
    <li>
  <div class="profile-details">
    <div class="profile-content">
      <img src="images/profile.jpg" alt="profileImg">
    </div>
    <div class="name-job">
      <div class="profile_name"><%=auth.getNome()%> <%=auth.getCognome() %></div>
      <div class="job">Admin</div>
    </div>
    <a href="LogoutServlet">
    <i class='bx bx-log-out' ></i>
    </a>
  </div>
</li>
</ul>
<!--------- Home Section --------->
      </div>
      <section class="home-section">
        <div class="home-content">
          <i class='bx bx-menu' ></i>
          <span class="text">Benvenuto  | Admin Dashboard</span>
        </div>
      </section>
<!--------- Js For Animated SideBar --------->
      <script>
      let arrow = document.querySelectorAll(".arrow");
      for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
       let arrowParent = e.target.parentElement.parentElement; //selecting main parent of arrow
       arrowParent.classList.toggle("showMenu");
        });
      }
      let sidebar = document.querySelector(".sidebar");
      let sidebarBtn = document.querySelector(".bx-menu");
      console.log(sidebarBtn);
      sidebarBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("close");
      });
      </script>

</body>
</html>