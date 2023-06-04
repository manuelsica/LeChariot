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
    <title>Tarocchi Minori | Corso </title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="icon" href="images/chRIOT.ico">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
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
          <i class='bx bx-menu' ></i>
          <span class="text">Arcani Minori  | Corsista</span>
        </div>
<!--------- Cards Section --------->
<button id="back-to-top-btn"><i class="fas fa-angle-double-up"></i></button>
<div class="wrapper">
    <div class="collapsible">
      <input class="check" type="checkbox" id="collapsible-head">
      <label class="collapsible-head" for="collapsible-head">Certificato Corso Arcani Maggiori</label>
      <div class="collapsible-text">
        <div class="text-certificato">
            <p>Congratulazioni! Per aver acquistato il corso in data: 00/00/0000</p>
            <a href="images/certificato-arcani_maggiori.png" download><button class="btn"><i class="bx bx-download"></i> Download</button></a>
        </div>
        </div>
      </div>
    </div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/MgH17jHWvGs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>1a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Arcani minori - Introduzione</h1>
                <small>Durata: 10:47 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/dUDGAoymTs4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>2a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Gli Assi degli Arcani Minori</h1>
                <small>Durata: 18:15 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/ID3RyiyPtxM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>3a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Due Degli Arcani Minori</h1>
                <small>Durata: 7:35 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/NEZBGwxYwoQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>4a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Tre Degli Arcani Minori</h1>
                <small>Durata: 7:12 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/gNtHYL-m-PY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>5a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Quattro Degli Arcani Minori</h1>
                <small>Durata: 10:00 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/DQk6mhpYoPg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>6a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Cinque Degli Arcani Minori</h1>
                <small>Durata: 11:42 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/x-HQCla9m38" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>7a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Sei Degli Arcani Minori</h1>
                <small>Durata: 10:24 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/5B1bQdOaLnA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>8a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Sette Degli Arcani Minori</h1>
                <small>Durata: 7:10 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/CYdXIKqdAWs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>9a Lezione</p>
                <h1>I Tarocchi di Marsiglia - L'Otto Degli Arcani Minori</h1>
                <small>Durata: 9:36 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/Y2yUMhrVbQI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>10a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Nove Degli Arcani Minori</h1>
                <small>Durata: 6:21 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/zQ7A3GBFjMc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>11a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Dieci Degli Arcani Minori</h1>
                <small>Durata: 9:26 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/u_UVbIzSuKQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>12a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Paggio Degli Arcani Minori</h1>
                <small>Durata: 8:40 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/PnlymNWvR4o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>13a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Regina Degli Arcani Minorie</h1>
                <small>Durata: 6:29 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/2ctpQIsFXbQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>14a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Re Degli Arcani Minori</h1>
                <small>Durata: 7:02 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/VXGs5Wfg3kc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>15a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Cavaliere Degli Arcani Minori</h1>
                <small>Durata: 7:52 min
                </small>
            </div>
        </div>
    </div>
</div>
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
<!--------- Js for Back To Top Menu--------->
<script>

    const backToTopButton = document.querySelector("#back-to-top-btn");

    window.addEventListener("scroll", scrollFunction);

    function scrollFunction() {
    if (window.pageYOffset > 300) { // Show backToTopButton
        if(!backToTopButton.classList.contains("btnEntrance")) {
    
            backToTopButton.classList.remove("btnExit");
            backToTopButton.classList.add("btnEntrance");
            backToTopButton.style.display = "block";
        }
    } 
    else { // Hide backToTopButton
        if(backToTopButton.classList.contains("btnEntrance")) {
    
            backToTopButton.classList.remove("btnEntrance");
            backToTopButton.classList.add("btnExit");
        
            setTimeout(function() {

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

        t /= d/2;
        if (t < 1) return c/2*t*t*t + b;
        t -= 2;
        return c/2*(t*t*t + 2) + b;

    };
</script>
</body>
</html>