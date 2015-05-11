<!DOCTYPE html>
<%@page import="jspBeans.Organization"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jspBeans.Item"%>
<%@page import="Model.Model"%>
<html lang="en">
<head>
	 <meta charset="utf-8">
      <title>Admin | Post Item</title>
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
      <link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">

 </head>
 <body>
  <%
  
  
  String orgName = null;
  ArrayList<Item> listItems = new ArrayList();
  session = request.getSession();
  Organization org = (Organization) session.getAttribute("admin");
  if (org == null)
      response.sendRedirect("login.jsp");
  else
  {
    orgName = org.getOrg_name();
    listItems = Model.getAllItems(org.getOrg_id());
  }
  
  String message = request.getParameter("msg");
  
  %>
  <%if (message != null) { 
  		if (message.equals("successAdd")) {%>
			<div class="alert alert-success">
			   <a href="#" class="close" data-dismiss="alert">
			      &times;
			   </a>
			   <strong>Item successfully added!</strong>
			</div>
		<%} 
		else if (message.equals("errorAdd")){%>
		  <div class="alert alert-error">
			   <a href="#" class="close" data-dismiss="alert">
			      &times;
			   </a>
			   <strong>Error while adding item.</strong> Your item's quantity should be greater than 0.
			</div>
		  
		<%} %>
<%} %>   
     	<nav class="navbar navbar-custom">
                <div class="container-fluid">
                  <div class="dropdown navbar-header">
                    <button class="menu-button dropdown-toggle" type="button" id="categories" data-toggle="dropdown" aria-expanded="true"><span class="glyphicon glyphicon-align-justify"></button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="categories">
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="admin.jsp">Admin Dashboard</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#contact">Contact Us</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#settings">Settings</a></li>
                    </ul>
                  </div>
                  <div class="navbar-header">
                      <a class="navbar-link navbar-brand" href="admin.jsp">Onboard</a>
                  </div>
                  <div>
                    
                    
                    <!-- <input type="text" class="navbar-search navbar-searchbar" placeholder="Search">
                     <button type="button" class="navbar-search navbar-searchbutton"><span class="glyphicon glyphicon-search"></span></button> -->
                    <ul class="navbar-right">
                      <li><a class="navbar-acct" href="admin-orders-view.jsp"><span class="glyphicon glyphicon-user navbar-acct"></span> <%=orgName%> </a></li>
                      <li><a class="navbar-acct" href="logout"><span class="glyphicon glyphicon-off navbar-acct"></span>Log Out</a></li>
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
                 <li><a href="post-item.jsp"> Create New</a></li>
                 <li><a href="admin-orders-view.jsp"> View All</a></li>
                 <li class="nav-header">Members</li>
                 <li><a href="access.jsp"> Manage Access</a></li>
                 <li class="nav-header">NOTIFICATIONS</li>
                 <li><a href="inbox.jsp">Inbox <span class="badge">0</span></a></li>
               </ul>
             </div><!--/.well -->
           </div><!--/span-->
      <div class="col-md-3"></div>
      <div class="col-md-9">
      <form class="postform-shirts" id="postshirts" name = "postshirts" action = "addItem" method = "post">
          <h3>Post Item</h3>
          <hr class="break"/>
          <label class="col-sm-2">Title:</label>
          <span class=""><input type="text" name="itemName" class="col-sm-7" required></span>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div id="sizeRange">
            <label class="form-space col-sm-2" for="sizeRange">Size Range:</label>
            <table class="form-pricesizes-table col-sm-6" id="sizeRange">
              <thead>
                <tr>
                  <th>Size</th>
                  <th>In-Stock</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> XS</td>
                  <td><input type="number" class="form-qty" name = "xsQty" id="xsQty" min = "0" value = "0"></td>
                </tr>
                <tr>
                  <td> S</td>
                  <td><input type="number" class="form-qty"  min = "0" name = "sQty" id="sQty" value = "0"></td>
                </tr>
                <tr>
                  <td> M</td>
                  <td><input type="number" class="form-qty" min="0" name = "mQty" id="mQty" value = "0" ></td>
                </tr>
                <tr>
                  <td> L</td>
                  <td><input type="number" class="form-qty" min="0" name = "lQty" id="lQty" value = "0"></td>
                </tr>
                <tr>
                  <td> XL</td>
                  <td><input type="number" class="form-qty" min="0" name = "xlQty" id="xlQty" value = "0"></td>
                </tr>
                <tr>
                  <td> XXL</td>
                  <td><input type="number" class="form-qty" min="0" name = "xxlQty" id="xxlQty" value = "0"></td>
                </tr>
                <tr>
                  <td><!--  <input class = "size-group" type="checkbox" name="xxxlarge" id = "xxxlarge" value="XXXL">--> XXXL</td>
                  <td><input type="number" class="form-qty" min="0" name = "xxxlQty" id="xxxlQty" value = "0"></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-space postform" id="priceDesc">
            <!-- <label class="form-space col-sm-2" for="price">Price:</label>
            <span class="form-price"><input type="text" name="price" class="col-sm-1 currencyinput form-price"></span> <!?>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="price">Image:</label>
            <input type="text" name="img-url" class="col-sm-2 form-price" class="form-price" disabled="true">
            <button class="form-price col-sm-1" type="button">Browse</button>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div> -->
            <label class="form-space col-sm-2" for="desc">Description:</label>
            <textarea class="form-price form-textarea col-sm-6" rows="10" cols="50" sizeable="false" name = "desc" required></textarea>
          </div>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-submit form-space col-sm-9">
            <input type="submit" value="Submit">
          </div>
        </form>
    </div> 
    </div>
      </div><!--/row-->

     <div id="footer">
      <div class="wrap">
        <p></p>
      </div>
    </div>

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
    <script>
	$( "#postshirts" ).validate({
	  rules: {
	    xsmall: {
	      require_from_group: [1, ".size-group"]
	    },
	    small: {
	      require_from_group: [1, ".size-group"]
	    },
	  	medium: {
	      require_from_group: [1, ".size-group"]
	    }
	  }
	});
</script>

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
