<%@page import="jspBeans.User"%>
<%@page import="jspBeans.Item"%>
<%@page import="Model.Model"%>
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
  String userName = null, id  = null;
  Cookie[] cookies = request.getCookies();
  
  if (cookies != null)
  {
    for (Cookie cookie : cookies)
    {
        if (cookie.getName().equals("user_name"))
            userName = cookie.getValue();
        
         if (cookie.getName().equals("user_id"))
            id = cookie.getValue();
    }
  }
  
  if (userName == null)
      response.sendRedirect("login.jsp");
  
  else
  {
      session = request.getSession();
      session.setAttribute("user", Model.getUser(id));
  }
  User user = Model.getUser(id);
  String item_id = request.getParameter("item");
  Item item = Model.getItem(Integer.valueOf(item_id));
  %>

        <nav class="navbar navbar-custom">
          <div class="container-fluid">
            <div class="dropdown navbar-header">
              <button class="menu-button dropdown-toggle" type="button" id="categories" data-toggle="dropdown" ><span class="glyphicon glyphicon-align-justify"></button>
              <ul class="dropdown-menu" role="menu" aria-labelledby="categories">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp">Dashboard</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#contact">Contact Us</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#settings">Settings</a></li>
              </ul>
            </div>
            <div class="navbar-header">
                <a class="navbar-link navbar-brand" href="index.jsp">Onboard</a>
            </div>
            <div>
              <input type="text" class="navbar-search navbar-searchbar" placeholder="Search">
               <button type="button" class="navbar-search navbar-searchbutton"><span class="glyphicon glyphicon-search"></span></button>
               <ul class="navbar-right">
                   <li><a class="navbar-acct" href="home-orders.jsp"><span class="glyphicon glyphicon-shopping-cart navbar-acct"></span> Orders </a></li>
                <li><a class="navbar-acct" href="#"><span class="glyphicon glyphicon-user navbar-acct"></span><%=userName %></a></li>
                <li><a class="navbar-acct" href="LogoutServlet"><span class="glyphicon glyphicon-off navbar-acct"></span>Log Out</a></li>
              </ul>
            </div>
          </div>
      </nav>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header"></li>
              <li class="nav-header">Categories</li>
              <li><a href="#">Shirts</a></li>
              <li><a href="#">Tickets</a></li>
              <li><a href="#">Bags</a></li>
              <li><a href="#">Other Apparels</a></li>
              <li class="nav-header">Organizations</li>
              <% for (int i = 0; i < Model.getAllOrgs().size(); i++)
              { 
                  String name = Model.getAllOrgs().get(i).getOrg_name();
                  int idorg  = Model.getAllOrgs().get(i).getOrg_id();
              %>
              <li><a href="index.jsp?org=<%=idorg%>"><%=name%></a></li>
              <% } %>
              <li class="nav-header">Ending Sales</li>
              <li><a href="#">University Week Shirt 2015</a></li>
              <li><a href="#">Remix '14 Count 7</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->

        <div class="span9">
          <div class="image-left"></div>
            <div>
          <div class="hero-unit">
              <h1><%=item.getItem_name().toUpperCase()%></h1>
              <h3><%=item.getOrg().getOrg_name()%></h3>
              <p><%=item.getItem_desc()%></p>
            </div>
          </div>

          <div class="row-fluid">
              <div class="hero-unit">
                <div>
                    <form action = "order" method ="post"> 
                  <h3>Order Item</h3>
                  <hr>
                  First Name: <%=user.getFirst_name()%><br>
                  Last Name: <%=user.getLast_name()%><br>
                  E-Mail: <%=user.getEmail()%><br>
                  ID Number: <%=user.getUser_id()%><br>
                  Contact # :  <input type="text" name="contact"><br>
                  Quantity: <input type="number" name="item_qty"><br>
                  <input type = "hidden" name ="item_id" value ="<%=item_id%>">
                  <hr>
                  <!--<h3>Sub-Total:</h3> -->
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