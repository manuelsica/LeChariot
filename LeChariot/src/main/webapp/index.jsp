<%@ page import= "model.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "connection.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    	if(auth!=null){
    		request.setAttribute("auth", auth);
    	}
    	
    	ProdottoFisicoDAO pdao= new ProdottoFisicoDAO();
        ArrayList<ProdottoFisicoBean> prodotti= pdao.getAllProducts();
        
        CorsoDAO cdao= new CorsoDAO();
        ArrayList<CorsoBean> c = cdao.getAllProducts();
        
        ConsulenzaDAO cn = new ConsulenzaDAO();
        ArrayList<ConsulenzaBean> cd = cn.getAllProducts();
        
        ProdottoFisicoBean ptr = (ProdottoFisicoBean) request.getSession().getAttribute("image");
        if(ptr!=null){
        	request.setAttribute("image", ptr);
        }
        boolean ctrl=false;
        request.getSession().setAttribute("ctrl", ctrl);
              
        
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeChariot | Tarot E-Commerce</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="images/chRIOT.ico">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<body>
<!--------- Header --------->
<%@ include file="includes/header.jsp" %>
<!--------- featured categories --------->
    <div class="categories">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <img src="https://images.unsplash.com/photo-1600430188203-bbb8dac79646?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8dGFyb3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60">
                </div>
                <div class="col-3">
                    <img src="https://images.unsplash.com/photo-1593259213062-57b0ce5906cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dGFyb3QlMjBkZWNrfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60">
                </div>
                <div class="col-3">
                    <img src="https://images.unsplash.com/photo-1600429753199-5376c2738737?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGFyb3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60">
                </div>
            </div>
        </div>
    </div>
<!--------- Recommended Products --------->
<div class="small-container">
    <h2 class="title">Recommended Products</h2>
    <div class="row">
    <% if(!cd.isEmpty()){
  	  for(int i=0; i<2; i++){
    	ConsulenzaBean cc= cd.get(i);
    	%>
        <div class="col-4">
            <a href="consulenza-details.jsp?id=<%=cc.getId()%>" ><img src=<%=cc.getImg()%>></a>
            <h4 align="center"><%=cc.getNome() %></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", cc.getPrezzo()));%></p>
        </div>
        <%} 
         }%>
       
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
    </div>
<!--------- Latest Products --------->
    <h2 class="title">Latest Products</h2>
    <div class="row">
        
    	<% if(!prodotti.isEmpty()){
    		for(int i=0; i<5; i++){ 
    		ProdottoFisicoBean b = prodotti.get(i);%>
   
        <div class="col-4">
            <a href="pfisico-details.jsp?id=<%=b.getIdpf()%>" ><img src= <%=b.getImage()%>></a>
            <h4 align="center"><%=b.getNome()%></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", b.getPrezzo()));%></p>
       
    </div>
    <% }
    	} %>
    	
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
    		for(int t=0;t<2;t++){
    			ConsulenzaBean b=cd.get(t); %>
   
        <div class="col-4">
            <a href="consulenza-details.jsp?id=<%=b.getId()%>" ><img src=<%=b.getImg()%>></a>
            <h4 align="center"><%=b.getNome()%></h4>
            <p align="center"><%out.println(String.format("%.2f&euro;", b.getPrezzo()));%></p>
       
    </div>
    <% }
    	} %>
             </div>
        </div>
    </div>
</div>
<!--------- Special --------->
<div class="special">
        <div class="small-container">
            <div class="row">
            <% if (auth!=null && ptr!=null){ %>
                <div class="col-2">
                    <img src=<%=ptr.getImage()%> class="special-img">
                </div>
                <div class="col-2">
                    <p>Uno dei pochi E-Commerce italiani</p>
                    <h1>Veri Cristalli</h1>
                    <small>LeChariot si prende cura dei propri clienti,
                        garantendo la qualità dei nostri cristalli, veri al 100%!
                    </small>
                    <br>
                    <b><small>Il cristallo del tuo mese di nascita e' il seguente: <%=ptr.getNome() %>! Acquistalo ora!</small></b>
                    <br><a href="pfisico-details.jsp?id=<%=ptr.getIdpf() %>" class="btn">Buy Now &#8594;</a>
                </div>
                <%} else { %>
                 <div class="col-2">
                    <img src="images/default.png" class="special-img">
                </div>
                <div class="col-2">
                    <p>Uno dei pochi E-Commerce italiani</p>
                    <h1>Veri Cristalli</h1>
                    <small>LeChariot si prende cura dei propri clienti,
                        garantendo la qualità dei nostri cristalli, veri al 100%!
                    </small>
                    <br>
                    <b><small>Entra a far parte della community e scopri il cristallo del tuo mese di nascita!</small></b>
                    <br><a href="login.jsp" class="btn">LogIn &#8594;</a>
                </div>
                </form>
                <%} %>
            </div>
        </div>
    </div>
<!--------- Testimonial --------->
    <div class="testimonial">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <i class ="fa fa-quote-left"></i>
                    <p>Mi son ritrovata per caso su questo sito e me ne sono subito innamorata.
                       LeChariot offre dei gioielli bellissimi luminosi, delle pietre che chiunque le veda ne rimane abbagliato.
                       I prodotti sono quasi piu' belli che in foto, 
                       arrivati puntuali nelle loro belle scatoline o sacchettini, con un buon imballaggio per proteggerli e accluso il significato delle gemme.
                    </p>
                    <div class="rating">
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star-o"></i>
                    </div>
                    <img src="images/user-1.png">
                    <h3>Silvana Moretti</h3>
                </div>
                <div class="col-3">
                    <i class ="fa fa-quote-left"></i>
                    <p>Ho provato piu' tarologi ma alcuni son risultati un bluff.
                        Poi per caso ho sentito parlare di questo sito e devo dire che durante la lettura ho trovato molta empatia
                        Ha guardato al mio benessere e non al suo, caricandosi delle mie negativita' , e 
                        facendo il possibile per aiutarmi. Una grande professionista, dal cuore immenso. 
                        Senza il suo aiuto, non mi sarei mai liberato, dai blocchi che mi impedivano di vivere una vita normale.</p>
                    <div class="rating">
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star-o"></i>
                    </div>
                    <img src="images/user-2.png">
                    <h3>Anacleto Sabbatini</h3>
                </div>
                <div class="col-3">
                    <i class ="fa fa-quote-left"></i>
                    <p>Questo e' stato il miglior corso che abbia mai frequentato.
                       Ho trovato cosi' tante informazioni che ho avuto la sensazione di ritrovare nei Tarocchi tanti amici mai conosciuti cosi' a fondo.
                       Il mio viaggio per la realizzazione spirituale, la crescita e la scoperta della coscienza superiore hanno fatto passi da gigante dopo questo corso.
                       Rende lo studio dei Tarocchi piu' semplice ed efficiente rispetto a qualsiasi altro programma io abbia mai provato. Non cercate oltre. 
                       Avete trovato il corso giusto.
                    </p>
                    <div class="rating">
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star"></i>
                        <i class ="fa fa-star-o"></i>
                    </div>
                    <img src="images/user-3.png">
                    <h3>Lilla Ricci</h3>
                </div>
            </div>
        </div>
    </div>
<!--------- Footer --------->
    <%@include file= "includes/footer.jsp"%>
<!--------- Js for Menu--------->
  
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