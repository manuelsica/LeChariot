<%@ page import= "model.*" %>
<%@ page import= "connection.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    }else if(auth== null){
    	response.sendRedirect("login.jsp");
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
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
        rel="stylesheet">
        <link rel="icon" href="images/chRIOT.ico">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
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
    </script>
</head>

<body>
    <!--------- Header --------->
   <%@ include file="includes/header-2.jsp" %>
    <!--------- Cart Items Details --------->
    <div class="container-card">
        <div class="card-container">
            <div class="front">
                <div class="image">
                    <img src="images/chip.png" alt="">
                </div>
                <div class="card-number-box">################</div>
                <div class="flexbox">
                    <div class="box">
                        <span>card holder</span>
                        <div class="card-holder-name">full name</div>
                    </div>
                    <div class="box">
                        <span>expires</span>
                        <div class="expiration">
                            <span class="exp-month">mm</span>
                            <span class="exp-year">yy</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="back">
                <div class="stripe"></div>
                <div class="box">
                    <span>cvv</span>
                    <div class="cvv-box"></div>
                    <img src="images/visa.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="total-price-pay">
        <table>
            <tr>
                <td>Subtotal</td>
                <td><% out.println(String.format("%.2f&euro;", carrello.getTotal())); %></td>
            </tr>
            <tr>
                <td>IVA</td>
                <td>22%</td>
            </tr>
            <tr>
                <td>Total</td>
                <td><%out.println(String.format("%.2f&euro;", carrello.getTotal()*0.22)); %></td>
            </tr>
        </table>
    </div>
    <div class="container-card">
        <form action="CheckOutServlet" method="post">
            <div class="inputBox">
                <span>Numero della carta</span>
                <input type="text" name="numero" maxlength="16" class="card-number-input" required>
            </div>
            <div class="inputBox">
                <span>Nome riportato sulla carta</span>
                <input type="text" maxlength="20" class="card-holder-input" required>
            </div>
            <div class="flexbox">
                <div class="inputBox">
                    <span>Scadenza MM</span>
                    <select name="" id="" class="month-input">
                        <option value="month" selected disabled>month</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>Scadenza YY</span>
                    <select name="" id="" class="year-input">
                        <option value="year" selected disabled>year</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>cvv</span>
                    <input type="text" maxlength="3" class="cvv-input" required>
                </div>
                <div class="row">
                </div>
            </div>
           
           		  <input type="submit" value="Procedi" class="submit-btn">
          
        </form>
    </div>
    </div>
    <!--------- Footer --------->
    <%@ include file="includes/footer.jsp" %>
    <!--------- Js for Menu--------->
    <script>

        var MenuItems = document.getElementById("MenuItems");

        MenuItems.style.maxHeight = "0px";

        function menutoggle() {

            if (MenuItems.style.maxHeight == "0px") {

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
    <!--------- Js for Front/Retro Credit Card--------->
    <script>

        document.querySelector('.card-number-input').oninput = () => {
            document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
        }

        document.querySelector('.card-holder-input').oninput = () => {
            document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
        }

        document.querySelector('.month-input').oninput = () => {
            document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
        }

        document.querySelector('.year-input').oninput = () => {
            document.querySelector('.exp-year').innerText = document.querySelector('.year-input').value;
        }

        document.querySelector('.cvv-input').onmouseenter = () => {
            document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
            document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
        }

        document.querySelector('.cvv-input').onmouseleave = () => {
            document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
            document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
        }

        document.querySelector('.cvv-input').oninput = () => {
            document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
        }

    </script>
</body>

</html>