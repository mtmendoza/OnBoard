<%-- 
    Document   : admin
    Created on : Mar 25, 2015, 10:03:11 AM
    Author     : Theresa
--%>

<!DOCTYPE html>
<html lang="en">
<head>
	 <meta charset="utf-8">
      <title>Home|Admin </title>
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
                <li><a class="navbar-acct" href="#"><span class="glyphicon glyphicon-user navbar-acct"></span> Organization Name </a></li>
                <li><a class="navbar-acct" href="#"><span class="glyphicon glyphicon-off navbar-acct"></span>Log Out</a></li>
              </ul>
        		</div>
      		</div>
    	</nav>

   <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="sidebar-nav">
            <ul class="nav nav-list">
              <li><h3>ADMINISTRATOR PANEL</h3></li>
              <li class="nav-header">PROJECTS</li>
              <li><a href="#"> Create New</a></li>
              <li><a href="admin-orders-view.jsp"> View All</a></li>
              <li class="nav-header">Members</li>
              <li><a href="#"> Manage Access</a></li>
              <li class="nav-header">NOTIFICATIONS</li>
              <li><a href="#">Inbox <span class="badge">0</span></a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->

        <div class="span9">
          <div class="hero-unit">
            <h1>Hello, USERNAME!</h1>
            <h4>You are now in Organization Name Home</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a ultrices est. Curabitur a pellentesque massa. Cras sed massa libero. In odio diam, euismod eget massa a, faucibus efficitur ipsum. Nam venenatis, purus eget accumsan faucibus, mi quam consequat est, quis dapibus dolor augue vel est. Nullam iaculis gravida aliquam. Vestibulum dictum nulla at cursus venenatis. Quisque feugiat dictum lacinia.</p>
          </div>

          <div class="row-fluid">
            <div class="span4">
               <div class="card">
                 <h2 class="card-heading simple">Heading</h2>
                  <div class="card-body">
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="items.html">View details »</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span4">
               <div class="card">
                 <h2 class="card-heading simple">Heading</h2>
                  <div class="card-body">
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="items.html">View details »</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span4">
               <div class="card">
                 <h2 class="card-heading simple">Heading</h2>
                  <div class="card-body">
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details »</a></p>
                  </div>
               </div>
            </div><!--/span-->
          </div><!--/row-->
          <div class="row-fluid">
            <div class="span4">
               <div class="card">
                 <h2 class="card-heading simple">Heading</h2>
                  <div class="card-body">
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details »</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span4">
               <div class="card">
                 <h2 class="card-heading simple">Heading</h2>
                  <div class="card-body">
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details »</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span4">
               <div class="card">
                 <h2 class="card-heading simple">Heading</h2>
                  <div class="card-body">
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details »</a></p>
                  </div>
               </div>
            </div><!--/span-->
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
