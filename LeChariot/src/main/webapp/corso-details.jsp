<%@ page import= "model.*" %>
<%@ page import= "java.util.ArrayList" %>
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
    <title>Prodotto | LeChariot</title>
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
<!--------- Single Product Details --------->

<% String id= request.getParameter("id");
int i = Integer.parseInt(id);
CorsoBean c= new CorsoBean();
CorsoDAO cdao= new CorsoDAO();

c = cdao.doRetriveByKey(i);
ArrayList<CorsoBean> ce = cdao.getAllProducts();

Carrello carrello= (Carrello) session.getAttribute("carrello");
if(carrello!=null){
	request.setAttribute("carrello", carrello);
}

%>
<div class="small-container single-product">
    <div class="row">
        <div class="col-2">
            <img src=<%=c.getImg() %> width="100%" id="ProductImg">

        </div>
        <div class="col-2">
            <p>Prodotto</p>
            <h1><%=c.getNome() %></h1>
            <h4><%out.println(String.format("%.2f&euro;", c.getPrezzo()));%></h4>
            <a href="AggiungiCarrelloServlet?id=<%=c.getIdcorso()%>&action=corsi" class="btn">Aggiungi al carrello</a>

            <h3>Product Details<i class="fa fa-indent"></i></h3>
            <br>
            <strong>Descrizione</strong>
            <p> <%=c.getDescrizione() %></p>
            
        </div>
    </div>
</div>
<!--------- Title --------->
    <div class="small-container">
        <div class="row row-2">
            <h2>Altri prodotti</h2>
            <a href="products.jsp"><p>View More</p></a>
        </div>
    </div>
<!--------- Products --------->
<div class="small-container">
    <div class="row">
    <% for(i=0; i<2; i++){
    	CorsoBean cc= ce.get(i);
    	%>
        <div class="col-4">
            <img src=<%=cc.getImg()%>>
            <h4 align="center"><%=cc.getNome() %></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", cc.getPrezzo()));%></p>
        </div>
        <%} %>
    </div>
</div>
<!--------- Footer --------->
 <%@ include file="includes/footer.jsp" %>
<!--------- Js for Menu--------->
<!--------- Js for Back To Top Menu--------->
    <script>
        var ProductImg = document.getElementById("ProductImg");
        var SmallImg = document.getElementsByClassName("small-img");

            SmallImg[0].onclick =function(){

                ProductImg.src = SmallImg[0].src;

            }

            SmallImg[1].onclick =function(){

                ProductImg.src = SmallImg[1].src;

            }
            SmallImg[2].onclick =function(){

                ProductImg.src = SmallImg[2].src;

            } 
            SmallImg[3].onclick =function(){

            ProductImg.src = SmallImg[3].src;

            }        
    </script>
<!--------- Js for Product Gallery --------->
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