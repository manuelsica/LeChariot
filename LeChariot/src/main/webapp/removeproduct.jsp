<%@ page import= "model.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }
    ProdottoFisicoDAO pdao = new ProdottoFisicoDAO();
    ArrayList<ProdottoFisicoBean> pfisici = pdao.getAllProducts();
    
    CorsoDAO cdao = new CorsoDAO();
    ArrayList<CorsoBean> corsi = cdao.getAllProducts();
    
    ConsulenzaDAO cdao2= new ConsulenzaDAO();
    ArrayList<ConsulenzaBean> cons= cdao2.getAllProducts();
    
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rimuovi Prodotto | Admin</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="icon" href="images/chRIOT.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
     $(document).ready(function () {
        $("input").focus(function () {

        }, function () {
          $(this).css("background", "#E4E9F7");
        });
      });

      $(document).ready(function () {
        $("input").blur(function () {
          $(this).css("background", "white");
        });
      });

      $(document).ready(function () {
        $("textarea").focus(function () {
        }, function () {
          $(this).css("background", "#E4E9F7");
        });
      });

      $(document).ready(function () {
        $("textarea").blur(function () {
          $(this).css("background", "white");
        });
      });
    </script>
</head>
<body>

  <!--------- SideBar --------->
    <%@ include file="includes/sidebar-admin.jsp" %>
<!--------- Home Section --------->
      </div>
      <section class="home-section">
        <div class="home-content">
          <i class='bx bx-menu' ></i>
          <span class="text">Rimuovi Prodotto  | Admin Dashboard</span>
        </div>
<!--------- AddProduct Section --------->
<div class="card">
    <div class="card-header">
      <h3 class="card-title">Lista Prodotti</h3>
    </div>
        <table>
            <tr>
                <th>Product</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>

            <% if(!pfisici.isEmpty()){
            for(ProdottoFisicoBean b : pfisici){ %>
            <tr>
                <td>
                    <div class="cart-info">
                        <img src=<%=b.getImage() %>>
                        <div>
                            <p><%=b.getNome() %></p>
                        </div>
                    </div>
                </td>
                <td><a class="btn btn-danger btn-sm" href="RemoveFisicoServlet?id=<%=b.getIdpf()%>">
                    <i class='bx bx-trash' >
                    </i>
                    Delete
                </a></td>
                </form>
                </tr>
                <%}
            }%>
          
    
            <% if(!cons.isEmpty()){
            for(ConsulenzaBean b : cons){ %>
            <tr>
                <td>
                    <div class="cart-info">
                        <img src=<%=b.getImg() %>>
                        <div>
                            <p><%=b.getNome() %></p>
                        </div>
                    </div>
                </td>
                <td><a class="btn btn-danger btn-sm" href="RemoveConsServlet?id=<%=b.getId()%>">
                    <i class='bx bx-trash' >
                    </i>
                    Delete
                </a></td>
                </form>
                </tr>
                <%}
            }%>
                     
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