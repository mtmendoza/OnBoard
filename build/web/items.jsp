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
       
       <%
  String userName = null;
  String orders = null;
  Cookie[] cookies = request.getCookies();
  if (cookies != null)
  {
    for (Cookie cookie : cookies)
    {
        if (cookie.getName().equals("user"))
            userName = cookie.getValue();
    }
    
    for (Cookie cookie : cookies)
    {
        if (cookie.getName().equals("totalOrders"))
            orders = cookie.getValue();
    }
  }
  %>

        <nav class="navbar navbar-custom">
          <div class="container-fluid">
            <div class="dropdown navbar-header">
              <button class="menu-button dropdown-toggle" type="button" id="categories" data-toggle="dropdown" ><span class="glyphicon glyphicon-align-justify"></button>
              <ul class="dropdown-menu" role="menu" aria-labelledby="categories">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="home.jsp">Dashboard</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#contact">Contact Us</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#settings">Settings</a></li>
              </ul>
            </div>
            <div class="navbar-header">
                <a class="navbar-link navbar-brand" href="home.jsp">Onboard</a>
            </div>
            <div>
              <input type="text" class="navbar-search navbar-searchbar" placeholder="Search">
               <button type="button" class="navbar-search navbar-searchbutton"><span class="glyphicon glyphicon-search"></span></button>
               <ul class="navbar-right">
                   <li><a class="navbar-acct" href="home-orders.jsp"><span class="glyphicon glyphicon-shopping-cart navbar-acct"></span> Orders </a></li>
                <li><a class="navbar-acct" href="#"><span class="glyphicon glyphicon-user navbar-acct"></span><%=userName %></a></li>
                  <ul class="dropdown-menu" role="menu" aria-labelledby="ordersort">
                <li role="presentation"><button type="button" tabindex="-1" data-toggle="modal" data-target="#org-list" class="login-as"><span class="glyphicon glyphicon-lock navbar-acct"></span> Switch user...</button></li>
                <div></div>
                <li role="presentation"><button type="button" tabindex="-1" data-toggle="modal" data-target="org-list" class="login-as"><span class="glyphicon glyphicon-off navbar-acct"></span> Log Out</button></li>
              </ul>
              </ul>
            </div>
          </div>
      </nav>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header"><a href="home.jsp">Dashboard</a></li>
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

        <! Modal >
    <div class="modal modal-alert-custom fade" id="org-list" tabindex="-1" role="dialog" aria-labelledby="checkerLabel1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
            <h4 class="modal-title" id="checkerLabel1">Organizations Managed </h4>
          </div>
          <div class="modal-body">
            <p>Manager ID: 150001</p> <! must be gotten from sql>
            <table class="table">
              <thead>
                <tr>
                  <th>Organization</th> <!sql too>
                  <th>Password</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>La Salle Computer Society</td>
                  <td><input type="password"> <button class="btn btn-default btn-xs" type="button">Log In</button></td>
                </tr>
                <tr>
                  <td>Computer Studies Government</td>
                  <td><input type="password"> <button class="btn btn-default btn-xs" type="button">Log In</button></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <center>
              <button type="button" class="btn btn-default btn-m" data-dismiss="modal">Close</button>       
            </center>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div>

        <div class="span9">
          <div class="image-left">IMAGE BOX</div>
            <div>
          <div class="hero-unit">
              <h1>NICE ITEM</h1>
              <h3>Organization Name</h3>
              <p>Very nice item. Must buy.</p>
            </div>
          </div>

          <div class="row-fluid">
              <div class="hero-unit">
                <div>
                    <form action = "processOrder" method ="post"> 
                  <h3>Order Item</h3>
                  <hr>
                  First Name: <input type="text" name="fname"><br>
                  Last Name: <input type="text" name="lname"><br>
                  ID Number: <input type="text" name="idnum"><br>
                  Contact # :  <input type="text" name="contact"><br>
                  Email Address: <input type="text" name="email"><br>
                  <br>
                  Quantity: <input type="number" name="quantity"><br>
                  <hr>
                  <h3>Sub-Total: <%=orders %></h3> 
                  <button class="btn-primary btn-right" type = "submit"><a style="color:white"> Process Order</a></button>
                    </form>
                </div>
              </div>
          </div><!--/row-->
        </div><!--/span-->
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
