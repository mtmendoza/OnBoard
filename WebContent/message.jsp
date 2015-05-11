<%@page import="jspBeans.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jspBeans.User"%>
<%@page import="jspBeans.Notification"%>
<%@page import="Model.Model"%>

<html lang="en"><head>
      <meta charset="utf-8">
      <title>Message</title>
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
  String userName = null, id = null;
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
  ArrayList<Notification> msg = Model.getMessages(Integer.parseInt(id));
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


                    <!--<form style="margin: 0; padding: 0;" action = "searchItems" name = "searchForm"> <input style = "display:inline;" type="text" name = "searchText" class="navbar-search navbar-searchbar" placeholder="Search Items" id="search-field" onkeyup="searchItems()">
                    <!--table id="complete-table" class="popupBox" /
                    <button style = "display:inline;" type="submit" class="navbar-search navbar-searchbutton"><span class="glyphicon glyphicon-search"></span></button><!--</form>-->
                    <ul class="navbar-right">
                        <% if (userName != null)
                            {%>
                        <li><a class="navbar-acct" href="home-orders.jsp"><span class="glyphicon glyphicon-shopping-cart navbar-acct"></span> Orders </a></li>
                   <li><a class="navbar-acct" href = "" data-toggle="dropdown" class="dropdown-toggle"><span class="glyphicon glyphicon-user navbar-acct"></span> <%=userName %> </a>
                       
                       <ul class="dropdown-menu" role="menu" aria-labelledby="ordersort">
                            <li role="presentation"><button type="button" tabindex="-1" class="login-as" onclick="location.href='user-inbox.jsp'"><span class="glyphicon glyphicon-inbox navbar-acct"></span> User Inbox</button></li>
                            <div></div>
                            <%if (user.getOrgsManaged().size() > 0) {%>
                            <li role="presentation"><button type="button" tabindex="-1" data-toggle="modal" data-target="#org-list" class="login-as"><span class="glyphicon glyphicon-lock navbar-acct"></span> Switch user...</button></li>
                            <div></div>
                            <% } %>
                            <li role="presentation"><button type="button" tabindex="-1" class="login-as" onclick="location.href='logout'"><span class="glyphicon glyphicon-off navbar-acct"></span> Log Out</button></li>
                        </ul>
                  </li>
                            <%} else
                            {%>
                        <li><a class="navbar-acct" href="login.jsp"> <span class="glyphicon glyphicon-user navbar-acct"></span> Log In</a></li>
                        <li><a class="navbar-acct" href="signup.jsp">Register Now!</a></li>
                            <% } %>

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
              <!--<li class="nav-header">Categories</li>
              <li><a href="#">Shirts</a></li>
              <li><a href="#">Tickets</a></li>
              <li><a href="#">Bags</a></li>
              <li><a href="#">Other Apparels</a></li>  -->
              <li class="nav-header">Organizations</li>
              <% for (int i = 0; i < Model.getAllOrgs().size(); i++)
              { 
                  String name = Model.getAllOrgs().get(i).getOrg_name();
                  int idorg  = Model.getAllOrgs().get(i).getOrg_id();
              %>
              <li><a href="index.jsp?org=<%=idorg%>"><%=name%></a></li>
              <% } %>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->

          <div class="span9">
            <div class= "row" style="margin-left: 0 px; margin-right: 0px;">
                      <div class="hero-unit" style="height:610px;">
                        <h2>CREATE MESSAGE</h2>
                        <hr>
                         <div class="pagecontent">
                            <div class="row" style="padding-left:30px; margin-right:0px;">
                              <!-- <table class="table-bordered table-revieworders">
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
                              </table> -->
                              <h3 style="display:inline-block">TO:</h3> <input type="text">
                              <h3 style="display:inline-block; margin-left:30px;">SUBJECT:</h3>
                              <input type="text"><br>
                              <h3 style="display:inline-block">MESSAGE:</h3><br>
                              <input type="text" style="width:500px; height: 200px;">
                            </div> 
                          </div>
                          <br>
                          <button><a style="color:orange;"href="#">SEND</a></button>
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