<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>HOME</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
</head>

<body>
    <?php
        include_once "function.php";
        $result=get_all_book($conn);
        echo <<<EOL
        <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-secondary text-uppercase" id="mainNav">
            <div class="container"><a class="navbar-brand js-scroll-trigger" href="home.html">Newbie</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" aria-controls="navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><input class="nav-item mx-0 mx-lg-1 search" type="search" placeholder="SEARCH"/></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login.html">Login</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="notification.html">Notification</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        EOL;
        echo <<<EOL
        <div class="row" style="padding: 200px 40px 40px 40px;">
        EOL;
        foreach($result as $sl)
        {     
            $id=$sl['BOOKID'];
            $namebook=$sl['TITLE'];
            $nameuser=$sl['NAME'];
        echo <<<EOL
            <div class="col-md-6 col-lg-4 col-xl-3 offset-xl-0 text-center" style="padding: 15;padding-bottom: 15px;">
                <a class="d-block mx-auto portfolio-item" data-toggle="modal" href="notification.html" onclick="location.replace('notification.html'),'_top' ">
                    <div class="portfolio-item-caption position-absolute h-100 w-100"></div><img class="img-fluid" src="assets/img/{$id}.png" style="/*position: absolute;*/margin: auto;top: 0;left: 0;right: 0;bottom: 0;height: 300px;width: 250px;">
                    <h5 style="text-align: center;">{$namebook}</h5>                    
                </a>
                <a href="notification.html" onclick="location.replace('notification.html'),'_top' "><button class="btn btn-primary" type="button" >EXCHANGE</button></a>
                    <h5 style="text-align: center;">{$nameuser}</h5>
            </div>
        EOL;
        }
        echo "</div>";
    ?>
    <footer class="footer text-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase mb-4">Location</h4>
                    <p>UIT - HCM - VN</p>
                </div>
                <div class="col-md-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase">about us</h4>
                    <ul class="list-inline">
                        <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="https://facebook.com"><i class="fa fa-facebook fa-fw"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <div class="copyright py-4 text-center text-white">
        <div class="container"><small>Copyright ©&nbsp;Newbie 2020</small></div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="assets/js/freelancer.js"></script>
</body>

</html>