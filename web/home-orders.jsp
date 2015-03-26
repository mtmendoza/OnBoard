<html lang="en"><head>
      <meta charset="utf-8">
      <title>Orders</title>
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

      <link href="http://fonts.googleapis.com/css?family=Roboto:400,300,700" rel="stylesheet" type="text/css">
      <link href="css/bootplus.css" rel="stylesheet">
      <style type="text/css">
      body {
        margin-left: 0px;
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
  String fname = null;
        String lname = null;
        String idnum = null;
        String contact = null;
        String email = null;
        String quantity = null;
  Cookie[] cookies = request.getCookies();
  if (cookies != null)
  {
    for (Cookie cookie : cookies)
    {
        if (cookie.getName().equals("user"))
            userName = cookie.getValue();
        if (cookie.getName().equals("totalOrders"))
            orders = cookie.getValue();
        if (cookie.getName().equals("fname"))
            fname = cookie.getValue();
        if (cookie.getName().equals("lname"))
            lname = cookie.getValue();
        if (cookie.getName().equals("idnum"))
            idnum = cookie.getValue();
        if (cookie.getName().equals("contact"))
            contact = cookie.getValue();
        if (cookie.getName().equals("email"))
            email = cookie.getValue();
        if (cookie.getName().equals("quantity"))
            quantity = cookie.getValue();
        
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
                
                    <li><a class="navbar-acct" href=""><span class="glyphicon glyphicon-shopping-cart navbar-acct"></span> Orders </a></li>
                <li><a class="navbar-acct" href=""><span class="glyphicon glyphicon-user navbar-acct"></span> <%=userName %> </a>
                  <ul class="dropdown-menu" role="menu" aria-labelledby="ordersort">
                <li role="presentation"><button type="button" tabindex="-1" data-toggle="modal" data-target="#org-list" class="login-as"><span class="glyphicon glyphicon-lock navbar-acct"></span> Switch user...</button></li>
                <div></div>
                <li role="presentation"><button type="button" tabindex="-1" data-toggle="modal" data-target="org-list" class="login-as"><span class="glyphicon glyphicon-off navbar-acct"></span> Log Out</button></li>
              </ul>
                </li>
              </ul>
            </div>
          </div>
      </nav>

  <div class="container">
    <div class= "row">
      <div class="span9 center">
              <div class="hero-unit">
                <h3>Your Items!</h3>
                <hr>
                 <div class="container pagecontent">
                    <div class="row">
                      <table class="table-bordered table-revieworders col-md-8">
                        <thead>
                          <tr>
                            <td class="col-sm-1">Item Code</td>
                            <td class="col-sm-1">Status</td>
                            <td class="col-sm-2">Item Name</td>
                            <td class="col-sm-1">Num. of Orders</td>
                            <td class="col-sm-1">Remarks</td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>00001</td>
                            <td>Active</td>
                            <td>Animo University Shirts</td>
                            <td>2</td>
                            <td><a href="all-orders-details.html">Details</a></td>
                          </tr>
                        </tbody>
                      </table>
                    </div> 
                  </div>
                  <h6><a style="color:orange" href="home.jsp">BACK TO DASHBOARD</a></h6>
              </div>

               <div class="hero-unit">
                <h3>MONITOR PURCHASES</h3>
                <hr>
                <% 
                   if(fname == null)
                    out.println("<p>You don't have pending items!</p>");
                   else
                   {
                 out.println("<div class=\"container pagecontent\">");
                    out.println("<div class=\"row\">");
                      out.println("<table class=\"table-bordered table-revieworders col-md-8\">");
                        out.println("<thead>");
                         out.println(" <tr>");
                           out.println(" <td class=\"col-sm-1\">Item Code</td>");
                           out.println("<td class=\"col-sm-1\">Organization</td>");
                            out.println("<td class=\"col-sm-2\">Item Name</td>");
                            out.println("<td class=\"col-sm-1\">Num. of Orders</td>");
                            out.println("<td class=\"col-sm-1\">Remarks</td>");
                          out.println("</tr>");
                        out.println("</thead>");
                        out.println("<tbody>");
                          out.println("<tr>");
                            out.println("<td>00001</td>");
                            out.println("<td>Active</td>");
                            out.println("<td>Nice Item</td>");
                            out.println("<td>" +  quantity + "</td>");
                            out.println("<td>Unclaimed</a></td>");
                         out.println(" </tr>");
                        out.println("</tbody>");
                      out.println("</table>");
                    out.println("</div> ");
                  out.println("</div>");
                   }
                 %>
                
                <h6><a style="color:orange" href="home.jsp">BACK TO DASHBOARD</a></h6>
              </div>
      </div><!--/span-->
    </div>
  </div>

     <div id="footer">
      <div class="wrap">
        <p>FOOTER</p>
      </div>
    </div>

    </div><!--/.fluid-container-->

    <!-- Le javascript
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

</body></html>
