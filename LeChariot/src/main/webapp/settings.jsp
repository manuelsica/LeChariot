<%@ page import= "model.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }
    FrequentaDAO fdao = new FrequentaDAO();
    ArrayList<Integer> an= fdao.frequenta(auth.getEmail());
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Impostazioni Profilo | User Dashboard </title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
        rel="stylesheet">
        <link rel="icon" href="images/chRIOT.ico">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("input").focus(function () {
            }, function () {
                $(this).css("border-bottom-color", "#11101d");
            });
        });

        $(document).ready(function () {
            $("input").blur(function () {
                $(this).css("border-bottom-color", "#ccc");
            });
        });
    </script>
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
            <a href="dashboard-user.jsp">
              <i class='bx bx-grid-alt' ></i>
              <span class="link_name">Dashboard</span>
            </a>
            <ul class="sub-menu blank">
              <li><a class="link_name" href="dashboard-user.jsp">Dashboard</a></li>
            </ul>
          </li>
          <% if(auth.isCorsista()){%>
          <li>
            <div class="iocn-link">
              <a href="#">
                <i class='bx bx-collection' ></i>
                <span class="link_name">Corsi</span>
              </a>
              <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
              <li><a class="link_name" href="#">Corsi</a></li>
              <% for(int i=0; i<an.size();i++){
            	  if(an.get(i)==1001){ %>
              <li><a href="tarotmaggiori.jsp">Arcani Maggiori</a></li>
              <%}
            	  if(an.get(i)==1002){%>
              <li><a href="tarotminori.jsp">Arcani Minori</a></li>
              <%}
              if(an.get(i)==1003) {%>
              <li><a href="metodi.jsp">Metodi di Lettura</a></li>
             <%}
              }%>
            </ul>
          </li>
          <%
          }%>
          <li>
            <a href="settings.jsp">
              <i class='bx bx-cog'></i>
              <span class="link_name">Impostazioni profilo</span>
            </a>
            <ul class="sub-menu blank">
              <li><a class="link_name" href="settings.jsp">Impostazioni profilo</a></li>
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
            <div class="profile_name"><%=auth.getNome() %> <%=auth.getCognome() %></div>
            <div class="job">Utente</div>
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
            <i class='bx bx-menu'></i>
            <span class="text">Impostazioni Profilo | User Dashboard</span>
        </div>
        <!--------- Cards Section --------->
            <div class="forms">
                <div class="form signup">
                    <span class="title">Modifica Informazioni Utente</span>
                    <form action="UpdateInfoServlet?action=nome&id=<%=auth.getEmail() %>" method="post">
                        <div class="input-field">
                            <input type="text" name="nome" placeholder="Immetti nome">
                            <i class="uil uil-user"></i>
                        </div>
                        <input type="submit" value="Modifica" class="settings right">
                        </form>
                        <form action="UpdateInfoServlet?action=cognome&id=<%=auth.getEmail() %>" method="post">
                        <div class="input-field">
                            <input type="text" name="cognome" placeholder="Immetti cognome">
                            <i class="uil uil-user"></i>
                        </div>
                        <input type="submit" value="Modifica" class="settings right">
                        </form>
                        <form action="UpdateInfoServlet?action=indirizzo&id=<%=auth.getEmail() %>" method="post">
                        <div class="input-field">
                            <input type="text" name="indirizzo" placeholder="Immetti indirizzo">
                            <i class="uil uil-map-marker"></i>
                        </div>
                        <input type="submit" value="Modifica" class="settings right">
                        </form>
                        <form action="UpdateInfoServlet?action=citta&id=<%=auth.getEmail() %>" method="post">
                        <div class="input-field">
                            <input type="text" name="citta" placeholder="Immetti citta'">
                            <i class="uil uil-map"></i>
                        </div>
                        <input type="submit" value="Modifica" class="settings right">
                        </form>
                        <form action="UpdateInfoServlet?action=cap&id=<%=auth.getEmail() %>" method="post">
                        <div class="input-field">
                            <input type="text" name="cap" placeholder="Immetti CAP">
                            <i class="uil uil-compass"></i>
                        </div>
                        <input type="submit" value="Modifica" class="settings right">
                        </form>
                        <form action="UpdateInfoServlet?action=password&id=<%=auth.getEmail() %>" method="post">
                        <div class="input-field">
                            <input type="text" name="password" placeholder="Immetti password">
                            <i class="uil uil-compass"></i>
                        </div>
                        <input type="submit" value="Modifica" class="settings right">
                        </form>
                        <form action="UpdateInfoServlet?action=bday&id=<%=auth.getEmail() %>" method="post">
                        <div class="input-field">
                            <input type="date" name="bday" placeholder="Immetti data di nascita">
                            <i class="uil uil-calendar-alt"></i>
                        </div>
                        <input type="submit" value="Modifica" class="settings right">
                        </form>
                </div>
            </div>
            </form>
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
        <!--------- Js for Back To Top Menu--------->
        <script>

            const backToTopButton = document.querySelector("#back-to-top-btn");

            window.addEventListener("scroll", scrollFunction);

            function scrollFunction() {
                if (window.pageYOffset > 300) { // Show backToTopButton
                    if (!backToTopButton.classList.contains("btnEntrance")) {

                        backToTopButton.classList.remove("btnExit");
                        backToTopButton.classList.add("btnEntrance");
                        backToTopButton.style.display = "block";
                    }
                }
                else { // Hide backToTopButton
                    if (backToTopButton.classList.contains("btnEntrance")) {

                        backToTopButton.classList.remove("btnEntrance");
                        backToTopButton.classList.add("btnExit");

                        setTimeout(function () {

                            backToTopButton.style.display = "none";

                        }, 250);
                    }
                }
            }

            backToTopButton.addEventListener("click", smoothScrollBackToTop);
            function smoothScrollBackToTop() {

                const targetPosition = 0;
                const startPosition = window.pageYOffset;
                const distance = targetPosition - startPosition;
                const duration = 750;
                let start = null;

                window.requestAnimationFrame(step);

                function step(timestamp) {

                    if (!start) start = timestamp;
                    const progress = timestamp - start;
                    window.scrollTo(0, easeInOutCubic(progress, startPosition, distance, duration));
                    if (progress < duration) window.requestAnimationFrame(step);
                }
            }
            function easeInOutCubic(t, b, c, d) {

                t /= d / 2;
                if (t < 1) return c / 2 * t * t * t + b;
                t -= 2;
                return c / 2 * (t * t * t + 2) + b;

            };
        </script>
</body>

</html>