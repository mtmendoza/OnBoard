
<%@page import="Model.Model"%>
<%@page import="jspBeans.Organization"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jspBeans.Item"%>
<%@page import="jspBeans.User"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Home</title>
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

    </head>
    <body>

        <%
            String userName = null;
            String id = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null)
            {
                for (Cookie cookie : cookies)
                {
                    if (cookie.getName().equals("user_name"))
                    {
                        userName = cookie.getValue();
                    }
                    if (cookie.getName().equals("user_id"))
                    {
                        id = cookie.getValue();
                    }
                }
            }

            if (userName != null)
            {
                session = request.getSession();
                session.setAttribute("user", Model.getUser(id));
            }
            ArrayList<Item> listItems = Model.getAllItems();

            /*session = request.getSession();
             User user = (User) session.getAttribute("userAccount");
             if (user != null)
             {
             userName = user.getFullName();
             }*/
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
                        <% if (userName != null)
                    {%>
                        <li><a class="navbar-acct" href="home-orders.jsp"><span class="glyphicon glyphicon-shopping-cart navbar-acct"></span> Orders </a></li>
                        <li><a class="navbar-acct" href="#"><span class="glyphicon glyphicon-user navbar-acct"></span> <%=userName%> </a></li>
                        <li><a class="navbar-acct" href="LogoutServlet"><span class="glyphicon glyphicon-off navbar-acct"></span>Log Out</a></li>
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
                            <li class="nav-header">Categories</li>
                            <li><a href="#">Shirts</a></li>
                            <li><a href="#">Tickets</a></li>
                            <li><a href="#">Bags</a></li>
                            <li><a href="#">Other Apparels</a></li>
                            <li class="nav-header">Organizations</li>
                                <% for (int i = 0; i < Model.getAllOrgs().size(); i++)
                                    {
                                        String name = Model.getAllOrgs().get(i).getOrg_name();
                                        int idorg = Model.getAllOrgs().get(i).getOrg_id();
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
                    <div class="hero-unit">
                        <% if (userName != null)
                {%>
                        <h1>Hello, <%=userName%>!</h1>
                        <p>Good morning friend, you are so awesome. Everything is awesome. Everything is cool when you are part of a team.</p>
                        <% } else
            { %>
                        <h1>Hello, GUEST!</h1>
                        <p>Why don't you register guest? Login now to order items!</p>
                        <% } %>
                    </div>

                    <%
              for (int ctr = 0; ctr < listItems.size();)
              { %>
                    <div class="row-fluid">
                        <% for (int col = 0; col < 3 && ctr < listItems.size(); col++)
                    {%>
                        <div class="span4">
                            <div class="card">
                                <h2 class="card-heading simple"><%=listItems.get(ctr).getItem_name()%></h2>
                                <div class="card-body">
                                    <p><%=listItems.get(ctr).getItem_desc()%></p>
                                    <p><% if (userName != null)
                        {%> 
                                        <a class="btn" href="items.jsp?item=<%=listItems.get(ctr).getItem_id()%>">View details »</a>
                                        <% } %></p> 
                                </div>
                            </div>
                        </div>
                        <%ctr++;
                    }%>
                    </div>    
                    <%}%>

                    <hr>



                </div><!--/.fluid-container-->
                <div id="footer">
                    <div class="wrap">
                        <p>FOOTER</p>
                    </div>
                </div>
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


                </body>
                </html>