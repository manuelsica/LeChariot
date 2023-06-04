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
    <title>Arcani Maggiori | Corso </title>
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
          <span class="text">Arcani Maggiori  | Corsista</span>
        </div>
<!--------- Cards Section --------->
<button id="back-to-top-btn"><i class="fas fa-angle-double-up"></i></button>
<div class="wrapper">
    <div class="collapsible">
      <input class="check" type="checkbox" id="collapsible-head">
      <label class="collapsible-head" for="collapsible-head">Certificato Corso Arcani Minori</label>
      <div class="collapsible-text">
        <div class="text-certificato">
            <p>Congratulazioni! Per aver acquistato il corso in data: 00/00/0000</p>
            <a href="images/certificato-arcani_minori.png" download><button class="btn"><i class="bx bx-download"></i> Download</button></a>
        </div>
        </div>
      </div>
    </div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/L9wekDZpoAg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <div class="col-2">
                <p>1a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Interpretazione e simbologia</h1>
                <small>Durata: 17:33 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/LvtR4zM6C0o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <div class="col-2">
                <p>2a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il simbolismo dei colori</h1>
                <small>Durata: 11:23 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/C6WJAhyn2ro" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>3a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il matto</h1>
                <small>Durata: 5:29 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/WTDbcvKsDUk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>4a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Mago</h1>
                <small>Durata: 5:29 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/Red0CKGBGD8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>5a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Papessa</h1>
                <small>Durata: 6:18 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/pBtwETIvPXE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>6a Lezione</p>
                <h1>I Tarocchi di Marsiglia - L'imperatrice</h1>
                <small>Durata: 5:47 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/p5J0lPaEbCA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>7a Lezione</p>
                <h1>I Tarocchi di Marsiglia - L'Imperatore</h1>
                <small>Durata: 4:06 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/Ia7serH7pjs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>8a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Papa</h1>
                <small>Durata: 4:16 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/HFtbIslSPUw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>9a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Gli Amanti</h1>
                <small>Durata: 5:10 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/0PouEaZvkbc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>10a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Carro</h1>
                <small>Durata: 3:35 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/Ny2CaOaYC8E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>11a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Giustizia</h1>
                <small>Durata: 5:14 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/ooohQ71STKY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>12a Lezione</p>
                <h1>I Tarocchi di Marsiglia - L'Eremita</h1>
                <small>Durata: 8:21 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/Z73IZojSp54" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>13a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Ruota della Fortuna</h1>
                <small>Durata: 4:29 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/eBM_okfyBMk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>14a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Forza</h1>
                <small>Durata: 3:05 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/ntufprWejK4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>15a Lezione</p>
                <h1>I Tarocchi di Marsiglia - L'Appeso</h1>
                <small>Durata: 3:39 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/lRptyAoFo7s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>16a Lezione</p>
                <h1>I Tarocchi di Marsiglia - L'Arcano Senza Nome</h1>
                <small>Durata: 4:48 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/6EfzWywaP6k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>17a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Temperanza</h1>
                <small>Durata: 3:54 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/xoCVMacfiCE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>18a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Diavolo</h1>
                <small>Durata: 4:24 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/zFCG9MZOlrg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>19a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Casa Dio</h1>
                <small>Durata: 4:25 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/XD15F-5zUOI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>20a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Stella</h1>
                <small>Durata: 2:48 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/fdTdDfnRpKU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>21a Lezione</p>
                <h1>I Tarocchi di Marsiglia - La Luna</h1>
                <small>Durata: 5:58 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/JDZ2rmv7Py4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>22a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Sole</h1>
                <small>Durata: 4:17 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/liXQKZoh6IU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>23a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Giudizio</h1>
                <small>Durata: 3:14 min
                </small>
            </div>
        </div>
    </div>
</div>
<div class="special">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <iframe class="video" src="https://www.youtube.com/embed/S-LrcNe0-ro" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>            </div>
            <div class="col-2">
                <p>24a Lezione</p>
                <h1>I Tarocchi di Marsiglia - Il Mondo</h1>
                <small>Durata: 6:50 min
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