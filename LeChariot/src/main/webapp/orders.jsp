<%@ page import= "model.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null)
    	request.setAttribute("auth", auth);
    
	OrdineDAO odao = new OrdineDAO();
	ArrayList<OrdineBean> o = odao.doRetrieveAll(auth.getEmail());
    if(auth!=null)
    	request.setAttribute("ordine", o);
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordini | LeChariot</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link rel="icon" href="images/chRIOT.ico">
</head>
<body>
<!--------- Header --------->
<%@ include file="includes/header-2.jsp" %>
<!--------- Cart Items Details --------->
<h2 class="title">Stato Ordini</h2>
        <div class="small-container cart-page">
            <table>
                <tr>
                    <th>Order Number</th>
                    <th>Date</th>
                    <th>Products</th>
                    <th>State</th>
                </tr>
               </table>
               <table>
                  
                    <%if(o!=null) {
                    	for(OrdineBean f : o){
                    %>
                     <tr>
                      <td>
                        <div class="cart-info">
                            <img src="images/idk.png" >
                            <div>
                                <p>Ordine n°<%=f.getNumero() %></p>
                                <small>Total Price: <%out.println(String.format("%.2f&euro;", f.getTotale()));%></small>
                                <br>
                            </div>
                        </div>
                    </td>
                    <td><%String m = f.getDate().toLocaleString();
                    out.println(m);
                    %></td>
                    <td><%=f.getProdotti() %></td>
                    <td></td>
                    <td><%=f.getStato() %></td>
                </tr>
			<%}
                    	}%>
            </table>
        </div>
<%@ include file="includes/footer.jsp" %>
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