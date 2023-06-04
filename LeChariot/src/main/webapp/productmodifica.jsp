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
    <title>Modifica prodotto | Admin</title>
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
            <i class='bx bx-menu'></i>
            <span class="text">Modifica Prodotto | Admin Dashboard</span>
        </div>
        <!--------- AddProduct Section --------->
        <div class="wrapper">
            <div class="collapsible">
                <input class="check" type="checkbox" id="collapsible-head">
                <label class="collapsible-head" for="collapsible-head">Modifica Prodotto Fisico</label>
                <div class="collapsible-text">
                    <div class="card-body">
  					  <form action="ModFisicoServlet?action=nome" method="post">
  					  <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                            <input type="text" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputName">Nome Prodotto</label>
                            <input type="text" id="inputName" name="nome" class="form-control">
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                       <form action="ModFisicoServlet?action=tipo" method="post">
                       <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                            <input type="text" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
            			  <label for="inputDescription">Tipo del Prodotto</label>
            			  <input type="text" name="tipo" name="tipo" class="form-control">
            			</div>
            			<div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                         <form action="ModFisicoServlet?action=quantita" method="post">
                         <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                            <input type="text" name="id" class="form-control" required>
                        </div>
                         <div class="form-group">
                            <label for="inputName">Quantita</label>
                            <input type="text" id="inputName" name="quantita" class="form-control">
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                         <form action="ModFisicoServlet?action=prezzo" method="post">
                         <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                            <input type="text" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputPrice">Prezzo</label>
                            <input type="text" id="inputPrice" name="prezzo" class="form-control">
                        </div>
                            <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="wrapper">
            <div class="collapsible2">
                <input class="check2" type="checkbox" id="collapsible-head2">
                <label class="collapsible-head2" for="collapsible-head2">Modifica Prodotto Consulti</label>
                <div class="collapsible-text2">
                    <div class="card-body">
                    	<form action="ModConsultiServlet?action=nome" method="post">
                        <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                           <input type="text" id="inputID" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputName">Nome Prodotto</label>
                            <input type="text" id="inputName" name="nome" class="form-control">
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                        <form action="ModConsultiServlet?action=desc" method="post">
                         <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                           <input type="text" id="inputID" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputDescription">Descrizione Prodotto</label>
                            <textarea id="inputDescription" name="desc" class="form-control" rows="4"></textarea>
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                        <form action="ModConsultiServlet?action=tempo" method="post">
                         <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                           <input type="text" id="inputID" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputTime">Tempo</label>
                          <input type="text" id="inputTempo" name="tempo" class="form-control">
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                        <form action="ModConsultiServlet?action=prezzo" method="post">
                         <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                           <input type="text" id="inputID" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputPrice">Prezzo</label>
                            <input type="text" name="prezzo" id="inputPrice" class="form-control">
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
        <div class="wrapper">
            <div class="collapsible3">
                <input class="check3" type="checkbox" id="collapsible-head3">
                <label class="collapsible-head3" for="collapsible-head3">Modifica Prodotto Corso</label>
                <div class="collapsible-text3">
                    <div class="card-body">
                   <form action="ModCorsoServlet?action=nome" method="post">
                        <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                           <input type="text" id="inputID" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputName">Nome Prodotto</label>
                            <input type="text" id="inputName" name="nome" class="form-control">
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                        </div>
                        </form>
                    <form action="ModCorsoServlet?action=desc" method="post">
                    <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                           <input type="text" id="inputID" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputDescription">Descrizione Prodotto</label>
                            <textarea id="inputDescription" name="desc" class="form-control" rows="4"></textarea>
                        </div>
                         <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             				 </div>
                    </div>
                    </form>
                    <form action="ModCorsoServlet?action=prezzo" method="post">
                    <div class="form-group">
                            <label for="inputName">ID Prodotto da Modificare</label>
                           <input type="text" id="inputID" name="id" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="inputPrice">Prezzo</label>
                            <input type="text" name="prezzo" id="inputPrice" class="form-control">
                        </div>
                        <div class="row">
             					 <div class="col-12">
              					 <input type="submit" value="Modifica" class="right button">
             			 </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
        </div>
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