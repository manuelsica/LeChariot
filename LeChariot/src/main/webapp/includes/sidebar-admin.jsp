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
        <div class="profile_name"><%=auth.getNome()%> <%=auth.getCognome()%></div>
        <div class="job">Admin</div>
      </div>
    	<a href="LogoutServlet">
      <i class='bx bx-log-out' ></i>
      </a>
    </div>
  </li>
</ul>