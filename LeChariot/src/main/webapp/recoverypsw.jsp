<%@ page import= "model.*" %>
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
    <title>LeChariot</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="css/form.css">
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
            <!--Login-->
            <div class="forms">
                <div class="form login">
                    <span class="title">Password dimenticata</span>
                    <form action="RecuperoPassServlet" method="post">
                        <div class="input-field">
                            <input type="text" name="email" placeholder="Inserisci email" required>
                            <i class="uil uil-envelope"></i>
                        </div>
                        <div class="input-field">
                            <input type="password" name="pass1" class="password" placeholder="Inserisci Nuova Password" required>
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePW"></i>
                        </div>
                        <div class="input-field">
                            <input type="password" name="pass2" class="password" placeholder="Conferma Password" required>
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePW"></i>
                        </div>
                        <div class="checkbox-text">
                            <div class="checkbox-content">
                            </div>
                            <a href="login.jsp" class="text">Torna al Login</a>
                        </div>                       
                        <div class="input-field button">
                            <input type="submit" value="Conferma">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
    <script src="scripts/script.js"></script>
</body>
</html>