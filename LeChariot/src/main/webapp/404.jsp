<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Page Error | LeChariot</title>
    <link rel="stylesheet" href="css/error.css">
    <link rel="icon" href="images/chRIOT.ico">
</head>
<body>
<!--------- 404 --------->
    <div id="container">
        <div class="content">
            <h2>404</h2>
            <h4>Oops! Page not Found</h4>
            <p>"Chissà cosa avrebbe scoperto Colombo
                se l'America non gli avesse sbarrato la strada."</p>
            <p>Jonathan Swift</p>
            <a href="index.jsp">Torna alla Home</a>
        </div>
    </div>
<!--------- Js For Background move --------->
    <script>
        var container = document.getElementById('container');
        window.onmousemove=function(e){

            var x = e.clientX/5,
                y = e.clientY/5;

                container.style.backgroundPositionX= x + 'px';
                container.style.backgroundPositionY= y + 'px';
        }
    </script>  
</body>
</html>