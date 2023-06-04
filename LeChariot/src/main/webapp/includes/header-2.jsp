<button id="back-to-top-btn"><i class="fas fa-angle-double-up"></i></button>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="images/logo.png" width="125px">
                </div>
                    <nav>
                        <ul id="MenuItems">
                        <% if(auth!=null && auth.isAdmin()==true){%>
                        	<li><a href="dashboard-admin.jsp">Admin</a></li>
                        	<%} %>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="products.jsp">Prodotti</a></li>
                            <% if(auth!=null){ %>
                            <li><a href="orders.jsp">Ordini</a></li>
                            <li><a href="dashboard-user.jsp">Dashboard</a></li>
                            <li><a href="LogoutServlet">Logout</a>
                            <% } else { %>
                            <li><a href="login.jsp">Login</a></li>
                            <% } %>
                        </ul>
                     </nav>
                     <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()"> 
                </div>
        </div> 
        
        <script>

        var MenuItems = document.getElementById("MenuItems");

        MenuItems.style.maxHeight = "0px";

        function menutoggle(){

            if(MenuItems.style.maxHeight == "0px"){

                MenuItems.style.maxHeight = "200px";
            } else {

                MenuItems.style.maxHeight = "0px";
            }
        }
    </script>