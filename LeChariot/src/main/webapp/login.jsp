<%@ page import= "model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 UtenteBean auth = (UtenteBean) request.getSession().getAttribute("auth");
	if(auth!=null){
		response.sendRedirect("index.jsp");
	}
	
	Boolean ctrl = (Boolean) request.getSession().getAttribute("ctrl");
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LeChariot</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="icon" href="images/chRIOT.ico">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
                $("input").focus(function () {
                }, function () {
                    $(this).css("border-bottom-color", "#ff532b");
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
        <div class="container">
        <a href="index.jsp"><img class="logo_cover_login" src="images/5.png"></a>
            <div class="forms">
           
                <div class="form login">
                    <span class="title">Login</span>
                    <form action="LoginServlet" method="post">
                        <div class="input-field">
                            <input type="text" class="form-control" name="login-email" placeholder="Enter your email" required>
                            <i class="uil uil-envelope"></i>
                        </div>
                       <div class="input-field">
                        <input type="password" class="password" name="login-password" placeholder="Inserisci Password" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePW"></i>
                    </div>

                        <div class="checkbox-text">
                            <div class="checkbox-content">
                                <input type="checkbox" id="logCheck">
                                <label for="logCheck" class="text">Ricordami</label>
                            </div>

                            <a href="recoverypsw.jsp" class="text">Password dimenticata?</a>
                        </div>
       
                        <%if(ctrl){ %>
                        <div class= "container" >
                        	<div class="w3-container w3-red">
 								<h6 align="center">Email e/o password errati!</h6>
                        	</div>
                        	</div>
                        	<%}
                        ctrl=false;
                        %>
                        
                        <div class="input-field button">
                            <input type= "submit" value= "Accedi">
                        </div>
                    </form>

                    <div class="login-signup">
                        <span class="text">Non sei registrato?</span>
                        <a href="#" class="text signup-link">Registrati ora</a>
                    </div>
                </div>
                
          
                <!--Registrazione-->
               <div class="form signup">
                    <span class="title">Registration</span>
                    <form name="loginForm" action="RegistrazioneServlet" method="post">
                        <div class="input-field">
                            <input name="nome" onkeydown= "return /[a-z]/i.test(event.key)" placeholder="Immetti nome" required>
                            <i class="uil uil-user"></i>
                        </div>
                        <div class="input-field">
                            <input name="cognome" onkeydown= "return /[a-z]/i.test(event.key)" placeholder="Immetti cognome" required>
                            <i class="uil uil-user"></i>
                        </div>
                        <div class="input-field">
                            <input name="indirizzo" type="text" placeholder="Immetti indirizzo" required>
                            <i class="uil uil-map-marker"></i>
                        </div>
                        <div class="input-field">
                            <input name="username" type="text" placeholder="Immetti username" required>
                            <i class="uil uil-map-marker"></i>
                        </div>
                        <div class="input-field">
                            <input name="citta" type="text" placeholder="Immetti Citta'" required>
                            <i class="uil uil-map-marker"></i>
                        </div>
                        <div class="input-field">
                            <input name="cap" type="text" placeholder="Immetti CAP" required>
                            <i class="uil uil-map-marker"></i>
                        </div>
            
                        <div class="input-field">
                            <input name="email" type="email" placeholder="Immetti email" required>
                            <i class="uil uil-envelope"></i>
                        </div>
                        <div class="input-field">
                            <input name="bday" type="date" placeholder="Immetti data di nascita"required>
                            <i class="uil uil-calendar-alt"></i>
                        </div>
                        <div class="input-field">
                            <input name="pass1" type="password" class="password" placeholder="Immetti password" required>
                            <i class="uil uil-lock icon"></i>            
                        </div>
                        <div class="input-field">
                            <input name="pass2" type="password" class="password" placeholder="Ripeti password" required>
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePW"></i>
                        </div>

                        <div class="checkbox-text">
                            <div class="checkbox-content">
                                <input type="checkbox" id="logCheck" required>
                                <label for="sigCheck" class="text">Registrandoti accetti i
                                    Termini di iscrizione </label>
                            </div>
                            <a href="recoverypsw.jsp" class="text">Password dimenticata?</a>
                        </div>
                        <div class="input-field button">
                            <a href="index.jsp"><input type="submit" value="Registrati"></a>
                        </div>
                    </form>
                    <div class="login-signup">
                        <span class="text">Hai gia' un account?</span>
                        <a href="#" class="text login-link">Accedi</a>
                    </div>
                </div>
            </div>
        </div>
    
    <script src="scripts/script.js"></script>
    
</body>
</html>