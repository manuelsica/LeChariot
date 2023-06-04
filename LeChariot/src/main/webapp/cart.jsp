<%@ page import= "model.*" %>
<%@ page import= "connection.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }
    
    Carrello carrello = (Carrello) session.getAttribute("carrello");
    ArrayList<ProdottoFisicoBean> pfisici = null;
	ArrayList<CorsoBean> corsi= null;
	ArrayList<ConsulenzaBean> cons= null;
    if(carrello==null){   
    	carrello = new Carrello();
    }
    	pfisici= carrello.getPF();
    	corsi= carrello.getCorsi();
    	cons=carrello.getCons();
		request.setAttribute("carrello", carrello);
    
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello | LeChariot</title>
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
<!--------- Cart Items Details --------->
<h2 class="title">Carrello</h2>
        <div class="small-container cart-page">
        <table>
         <tr>
                    <th>Product</th>
                    <th>  </th>
                    <th>Subtotal</th>
               
                <tr>
                </table>
            <table>
               
                <%if(pfisici!=null){
                for(ProdottoFisicoBean f: pfisici) {%>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src=<%=f.getImage() %>>
                            <div>
                                <p><%=f.getNome() %></p>
                                <small>Price: <%out.println(String.format("%.2f&euro;", f.getPrezzo()));%></small>
                                <br>
                                <a href="RimuoviCarrelloServlet?action=fisico&id=<%=f.getIdpf()%>">>Remove</a>
                            </div>
                        </div>
                    </td>
                    <td><input type="number" value=<%=f.getQuantita()%>></td>
                    <td><% out.println(String.format("%.2f&euro;", f.getPrezzo() * f.getQuantita())); %></td>
                       </tr>
                    <%}
                }%>
             
                
                <tr>
                <%if(corsi!=null){
                for(CorsoBean f : corsi) {%>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src=<%=f.getImg() %>>
                            <div>
                                <p><%=f.getNome() %></p>
                                <small>Price: <%out.println(String.format("%.2f&euro;", f.getPrezzo()));%></small>
                                <br>
                                <a href="RimuoviCarrelloServlet?action=corso&id=<%=f.getIdcorso()%>">Remove</a>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td><%out.println(String.format("%.2f&euro;", f.getPrezzo()));%></td>
                    </tr>
                    <% } 
                    }%>
                
             
                <% if(cons!=null){
                for(ConsulenzaBean f: cons){ %>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src=<%=f.getImg() %>>
                            <div>
                                <p><%=f.getNome() %></p>
                                <small>Price: <%out.println(String.format("%.2f&euro;", f.getPrezzo()));%></small>
                                <br>
                                <a href="RimuoviCarrelloServlet?action=cons&id=<%=f.getId()%>">Remove</a>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td><%out.println(String.format("%.2f&euro;", f.getPrezzo()));%></td>
                    </tr>
                    <%}
                }%>
         
               
            </table>

            <div class="total-price">

                <table>
                    <tr>
                        <td>Subtotal</td>
                        <td><%if(carrello!=null){
                        out.println(String.format("%.2f&euro;", carrello.getTotal()));
                        }else{
                        	out.println("0.00");
                        }
                        %></td>
                    </tr>
                     <tr>
                        <td>Tax</td>
                        <td>22%</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td><%if(carrello!=null){
                        out.println(String.format("%.2f&euro;", carrello.getTotal()*0.22+carrello.getTotal()));
                        }else{
                        	out.println("0.00");
                        }
                        %></td>
                    </tr>
                    <tr>
                  		<td><a href="RimuoviCarrelloServlet?action=clear" class="btn">Rimuovi Carrello</a></td>
                        <td><a href="checkoutpage.jsp" class="btn">Acquista</a></td>
                         </tr>
                    </tr>
                    
                </table>
            </div>
            </table>
        </div>
<!--------- Footer --------->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Download Our App</h3>
                    <p>Download App for Android and iOs mobile Phone</p>
                    <div class="app-logo">
                        <img src="images/play-store.png">
                        <img src="images/app-store.png">
                    </div>
                </div>
                <div class="footer-col-2">
                    <img src="images/logo-white.png">
                    <p>Tarot | E-Commerce </p>
                </div>
                <div class="footer-col-3">
                    <h3>Useful links:</h3>
                    <ul>
                        <li>Home</li>
                        <li>Shop</li>
                        <li>Login</li>
                    </ul>
                </div>
                <div class="footer-col-4">
                    <h3>Follow us:</h3>
                    <ul>
                        <li>Facebook</li>
                        <li>Twitter</li>
                        <li>Instagram</li>
                    </ul>
                </div>
            </div>
            <hr>
            <p class="copyright">Copyright 2022 - LeChariot</p>
        </div>
    </div>
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