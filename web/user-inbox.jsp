<html lang="en"><head>
      <meta charset="utf-8">
      <title>View Item</title>
      <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">

    <!-- Le styles -->
      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
      </script>
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
      </script>
	  <script src = 'scripts.js'> </script>

      <link href="http://fonts.googleapis.com/css?family=Roboto:400,300,700" rel="stylesheet" type="text/css">
      <link href="css/bootplus.css" rel="stylesheet">
      <style type="text/css">
      body {
   
        padding-bottom: 40px;
      }
      .hero-unit {
          padding: 60px;
      }
      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
      </style>
      <link href="css/bootplus-responsive.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="styles.css">
      <link rel="stylesheet" type="text/css" href="css/footer_style.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
   </head>

   <body>

        <nav class="navbar navbar-custom">
          <div class="container-fluid">
            <div class="dropdown navbar-header">
              <button class="menu-button dropdown-toggle" type="button" id="categories" data-toggle="dropdown" aria-expanded="true"><span class="glyphicon glyphicon-align-justify"></button>
              <ul class="dropdown-menu" role="menu" aria-labelledby="categories">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="index-home.html">Dashboard</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#contact">Contact Us</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#settings">Settings</a></li>
              </ul>
            </div>
            <div class="navbar-header">
                <a class="navbar-link navbar-brand" href="#">Onboard</a>
            </div>
            <div>
              <input type="text" class="navbar-search navbar-searchbar" placeholder="Search">
               <button type="button" class="navbar-search navbar-searchbutton"><span class="glyphicon glyphicon-search"></span></button>
               <ul class="navbar-right">
                <li><a class="navbar-acct" href="home-orders.html"><span class="glyphicon glyphicon-shopping-cart navbar-acct"></span> Orders </a></li?
                <li><a class="navbar-acct" href="#"><span class="glyphicon glyphicon-user navbar-acct"></span> User Name </a></li>
                <li><a class="navbar-acct" href="index-login.html"><span class="glyphicon glyphicon-off navbar-acct"></span>Log Out</a></li>
              </ul>
            </div>
          </div>
      </nav>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header"><a href="#"></a></li>
              <li class="nav-header">Categories</li>
              <li class="active"><a href="#">Shirts</a></li>
              <li><a href="#">Tickets</a></li>
              <li><a href="#">Bags</a></li>
              <li><a href="#">Other Apparels</a></li>
              <li class="nav-header">Organizations</li>
              <li><a href="#">Harlequin Theatre Guild</a></li>
              <li><a href="#">OVPIA</a></li>
              <li><a href="#">OTREAS</a></li>
              <li><a href="#">USG</a></li>
              <li><a href="#">CSG</a></li>
              <li><a href="#">Outdoor Club</a></li>
              <li class="nav-header">Ending Sales</li>
              <li><a href="#">University Week Shirt 2015</a></li>
              <li><a href="#">Remix '14 Count 7</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->

          <div class="span9">
            <div class= "row" style="margin-left: 0 px; margin-right: 0px;">
                      <div class="hero-unit" style="height:330px;">
                        <h2>YOUR MESSAGES</h2>
                        <hr>
                         <div class="pagecontent">
                            <div class="row" style="padding-left:30px; margin-right:0px;">
                              <table class="table-bordered table-revieworders">
                                <thead>
                                  <tr>
                                    <td class="col-sm-1">From</td>
                                    <td class="col-sm-1">Status</td>
                                    <td class="col-sm-2">Subject</td>
                                    <td class="col-sm-1">Date</td>
                                    <td class="col-sm-1">Action</td>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>S. Username</td>
                                    <td>Read</td>
                                    <td>Sample Subject Message</td>
                                    <td>4/16/2015</td>
                                    <td><a href="#">Delete</a></td>
                                  </tr>
                                  <tr>
                                    <td>S. Username</td>
                                    <td>Unread</td>
                                    <td>Sample Subject Message</td>
                                    <td>4/16/2015</td>
                                    <td><a href="#">Delete</a></td>
                                  </tr>
                                </tbody>
                              </table>
                            </div> 
                          </div>
                          <br>
                          <button><a style="color:orange;"href="#">CREATE NEW MESSAGE</a></button>
                      </div>
            </div>
          </div><!--/span-->
        </div><!--/row-->
      </div><!--/row-->

      <hr>

     <div id="footer">
      <div class="wrap">
        <p>FOOTER</p>
      </div>
    </div>

    </div><!--/.fluid-container-->

    <!--
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap-transition.js"></script>
    <script src="js/bootstrap-alert.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/bootstrap-dropdown.js"></script>
    <script src="js/bootstrap-scrollspy.js"></script>
    <script src="js/bootstrap-tab.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-button.js"></script>
    <script src="js/bootstrap-collapse.js"></script>
    <script src="js/bootstrap-carousel.js"></script>
    <script src="js/bootstrap-typeahead.js"></script>

   

</body></html>