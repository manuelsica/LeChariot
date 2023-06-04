
<button id="back-to-top-btn"><i class="fas fa-angle-double-up"></i></button>
    <div class="header">
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
                            <%if(auth.isAdmin()==false){ %>
                            <li><a href="dashboard-user.jsp">Dashboard</a></li>
                            <%} %>
                            <li><a href="LogoutServlet">Logout</a>
                            <% } else { %>
                            <li><a href="login.jsp">Login</a></li>
                            <% } %>
                            
                        </ul>
                     </nav>
               
                    <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                  
                </div>
                    <div class="row">
                        <div class="col-2">
                        <h1>Le Chariot <br>| Tarot E-Commerce</h1>
                        <p>"Se Dio non è qui, non è da nessuna parte; <br>questo stesso istante è la perfezione."<br>Alejandro Jodorowsk</p>
                        <a href="products.jsp" class="btn">Explore Now &#8594;</a> 
                 </div>
                    <div class="col-2">
                        <img src="images/images1.png">
                </div>
            </div>
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
    </body>
    </html>