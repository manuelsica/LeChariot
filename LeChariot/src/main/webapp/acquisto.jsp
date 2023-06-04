<%@ page import= "model.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }
    
    CorsoDAO cdao= new CorsoDAO();
    ArrayList<CorsoBean> c = cdao.getAllProducts();
    
    ConsulenzaDAO cn = new ConsulenzaDAO();
    ArrayList<ConsulenzaBean> cd = cn.getAllProducts();
   
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordine Effettuato | LeChariot</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="icon" href="images/chRIOT.ico">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<body>
<!--------- Header --------->
<%@ include file="includes/header-2.jsp" %>
<!--------- Thanks --------->
    <h2 class="title">Grazie per aver acquistato da noi!
        <br>
        <small>Per avere dettagli sul tuo ordine, vai nella sezione <a href="orders.jsp">"Ordini"</a></small>
    </h2>

        <div class="small-container cart-page">
            <div class="small-container">
                <div class="row row-2">
                    <h2>Altri prodotti</h2>
                    <a href="products.jsp"><p>View More</p></a>
                </div>
            </div>
        </div>
<!--------- Consigliati --------->
        <div class="small-container">
            <div class="row">
                <% if(!c.isEmpty()){
    		for(int j=0;j<3; j++){ 
    		CorsoBean b= c.get(j);%>
   
        <div class="col-4">
            <a href="corso-details.jsp?id=<%=b.getIdcorso()%>" ><img src= <%=b.getImg()%>></a>
            <h4 align="center"><%=b.getNome()%></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", b.getPrezzo()));%></p>
       
    </div>
    <% }
    	} %>
    	
    	<% if(!cd.isEmpty()){
    		for(int i=0;i<2; i++){ 
    		ConsulenzaBean b= cd.get(i);%>
   
        <div class="col-4">
            <a href="corso-details.jsp?id=<%=b.getId()%>" ><img src= <%=b.getImg()%>></a>
            <h4 align="center"><%=b.getNome()%></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", b.getPrezzo()));%></p>
       
    </div>
    <% }
    	} %>
            </div>
        </div>
<!--------- Footer --------->
    <%@ include file="includes/footer.jsp" %>
<!--------- Js for Menu--------->
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