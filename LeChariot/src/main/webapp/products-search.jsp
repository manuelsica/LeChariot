<%@ page import= "model.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }
    
    ArrayList<ProdottoFisicoBean> prodotti= (ArrayList<ProdottoFisicoBean>) request.getSession().getAttribute("pf");
    
    ArrayList<CorsoBean> c = (ArrayList<CorsoBean>) request.getSession().getAttribute("cs");
    
    ArrayList<ConsulenzaBean> cd = (ArrayList<ConsulenzaBean>) request.getSession().getAttribute("cn");
    
    Carrello carrello= (Carrello) session.getAttribute("carrello");
    if(carrello!=null){
    	request.setAttribute("carrello", carrello);
    }
    
    %>
   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products | LeChariot</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="icon" href="images/chRIOT.ico">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<body>
<!--------- Header --------->
<%@ include file="includes/header-2.jsp" %>
<!--------- Recommended Products --------->
<div class="small-container">
    <div class="row row-2">
        <h2>All Products</h2>
        <div class="wrapper">
            <div class="search_box">
                 <form action="RicercaServlet" method="post">
                <div class="search_btn"><i class="fas fa-search"></i>
                <input type="search" name="cerca" class="input_search" placeholder="Cerca Prodotto"></div>
                </form>
            </div>
        </div>
    </div>
     <form action = "pfisico-details.jsp" method="get">
    <div class="row">
   
    	<% if(!prodotti.isEmpty()){
    		for(ProdottoFisicoBean b: prodotti){ %>
   
        <div class="col-4">
            <a href="pfisico-details.jsp?id=<%=b.getIdpf()%>" ><img src= <%=b.getImage()%>></a>
            <h4 align="center"><%=b.getNome()%></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", b.getPrezzo()));%></p>
       
    </div>
    <% }
    	} %>
    	
    	<% if(!c.isEmpty()){
    		for(CorsoBean b: c){ %>
   
        <div class="col-4">
            <a href="corso-details.jsp?id=<%=b.getIdcorso()%>" ><img src= <%=b.getImg()%>></a>
            <h4 align="center"><%=b.getNome()%></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", b.getPrezzo()));%></p>
       
    </div>
    <% }
    	} %>
    	
    	
    	<% if(!cd.isEmpty()){
    		for(ConsulenzaBean b: cd){ %>
   
        <div class="col-4">
            <a href="consulenza-details.jsp?id=<%=b.getId()%>" ><img src=<%=b.getImg()%>></a>
            <h4 align="center"><%=b.getNome()%></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", b.getPrezzo()));%></p>
       
    </div>
    <% }
    	} %>
      </div>
       </form>
    <div class="page-btn">
        <span>1</span>
        <span>2</span>
        <span>3</span>
        <span>4</span>
        <span>&#8594;</span>
    </div>
</div>
<!--------- Footer --------->
  <%@ include file="includes/footer.jsp" %>
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