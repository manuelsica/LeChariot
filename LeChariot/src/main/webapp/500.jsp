<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 Page Error | LeChariot</title>
    <link rel="stylesheet" href="css/error.css">
    <link rel="icon" href="images/chRIOT.ico">
</head>
<body>
<!--------- 500 --------->
    <div id="container">
        <div class="content">
            <h2>500</h2>
            <h4>500 Internal Server Error</h4>
            <p>"Il server ha riscontrato un errore interno e non ha potuto completare la richiesta."</p>
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