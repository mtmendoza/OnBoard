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
                <li><a class="navbar-acct" href="home-orders.html"><span class="glyphicon glyphicon-shopping-cart navbar-acct"></span> Orders </a></li>
                <li><a class="navbar-acct" href="#"><span class="glyphicon glyphicon-user navbar-acct"></span> User Name </a>
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

   <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="sidebar-nav">
            <ul class="nav nav-pills nav-stacked menu-itemtype">
              <li><h3>Choose Item Type</h3></li>
              <hr class="break"/>
              <li class="active"><a href="#postshirts" onclick="toggle_visibility('postshirts')">Shirts/Jackets</a></li>
              <li class="active"><a href="#postbagsaccessories" onclick="toggle_visibility('postbagsaccessories')">Bags & Accessories</a></li>
              <li class="active"><a href="#postbooks" onclick="toggle_visibility('postbooks')">Books</a></li>
              <li class="active"><a href="#posttickets" onclick="toggle_visibility('posttickets')">Tickets</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">
              <div class="col-md-1"></div>
      <div class="col-md-9">
      <div class="accordion-toggle">
        <form class="postform-shirts accordion-body collapse" id="postshirts">
          <h3>Shirts/Jackets</h3>
          <hr class="break"/>
          <label class="col-sm-2">Title:</label>
          <span class=""><input type="text" name="itemName" class="col-sm-7"></span>
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
                  <td><input type="checkbox" name="xsmall" value="XS"> XS</td>
                  <td><input type="number" class="form-qty" min="1" id="xsQty"></td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="small" value="S"> S</td>
                  <td><input type="number" class="form-qty" min="1" id="sQty"></td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="medium" value="M"> M</td>
                  <td><input type="number" class="form-qty" min="1" id="mQty"></td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="large" value="L"> L</td>
                  <td><input type="number" class="form-qty" min="1" id="lQty"></td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="xlarge" value="XL"> XL</td>
                  <td><input type="number" class="form-qty" min="1" id="xlQty"></td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="xxlarge" value="XXL"> XXL</td>
                  <td><input type="number" class="form-qty" min="1" id="xxlQty"></td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="xxxlarge" value="XXXL"> XXXL</td>
                  <td><input type="number" class="form-qty" min="1" id="xxxlQty"></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-space postform" id="priceDesc">
            <label class="form-space col-sm-2" for="price">Price:</label>
            <span class="form-price"><input type="text" name="price" class="col-sm-1 currencyinput form-price"></span> <!?>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="price">Image:</label>
            <input type="text" name="img-url" class="col-sm-2 form-price" class="form-price" disabled="true">
            <button class="form-price col-sm-1" type="button">Browse</button>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="desc">Description:</label>
            <textarea class="form-price form-textarea col-sm-6" rows="10" cols="50" sizeable="false"></textarea>
          </div>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-submit form-space col-sm-9">
            <input type="submit" value="Submit">
          </div>
        </form>

        <form class="postform-shirts accordion-body collapse" id="postbagsaccessories">
          <h3>Bags</h3>
          <hr class="break"/>
          <label class="col-sm-2">Title:</label>
          <span class=""><input type="text" name="itemName" class="col-sm-7"></span>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <label class="form-space col-sm-2" for="price">Qty:</label>
          <span class="form-qty"><input type="number" name="price" class="col-sm-1 form-price form-qty"></span>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-space postform" id="priceDesc">
            <label class="form-space col-sm-2" for="price">Price:</label>
            <span class="form-price"><input type="text" name="price" class="col-sm-1 currencyinput form-price"></span> <!?>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="price">Image:</label>
            <input type="text" name="img-url" class="col-sm-2 form-price" class="form-price" disabled="true">
            <button class="form-price col-sm-1" type="button">Browse</button>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="desc">Description:</label>
            <textarea class="form-price form-textarea col-sm-6" rows="10" cols="50" sizeable="false"></textarea>
          </div>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-submit form-space col-sm-9">
            <input type="submit" value="Submit">
          </div>
        </form>

        <form class="postform-shirts accordion-body collapse" id="postbooks">
          <h3>Books</h3>
          <hr class="break"/>
          <label class="col-sm-2">Title:</label>
          <span class=""><input type="text" name="itemName" class="col-sm-7"></span>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <label class="form-space col-sm-2" for="price">Qty:</label>
          <span class="form-qty"><input type="number" name="price" class="col-sm-1 form-price form-qty"></span>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <label class="form-space col-sm-2">Condition:</label>
          <table>
            <tbody class="col-sm-6">
              <tr>
                <td class="form-radio col-sm-2"><input class="form-price col-sm-2" type="radio" name="cond" value="new"> Brand New</td>
                <td class="form-radio col-sm-2"><input class="form-price col-sm-2" type="radio" name="cond" value="old"> Pre-owned</td>
              </tr>
            </tbody>
          </table>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-space postform" id="priceDesc">
            <label class="form-space col-sm-2" for="price">Price:</label>
            <span class="form-price"><input type="text" name="price" class="col-sm-1 currencyinput form-price"></span> <!?>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="price">Image:</label>
            <input type="text" name="img-url" class="col-sm-2 form-price" class="form-price" disabled="true">
            <button class="form-price col-sm-1" type="button">Browse</button>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="desc">Description:</label>
            <textarea class="form-price form-textarea col-sm-6" rows="10" cols="50" sizeable="false"></textarea>
          </div>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-submit form-space col-sm-9">
            <input type="submit" value="Submit">
          </div>
        </form>

        <form class="postform-shirts accordion-body collapse" id="posttickets">
          <h3>Tickets</h3>
          <hr class="break"/>
          <label class="col-sm-2">Title:</label>
          <span class=""><input type="text" name="itemName" class="col-sm-7"></span>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <label class="form-space col-sm-2" for="price">Qty:</label>
          <span class="form-qty"><input type="number" name="price" class="col-sm-1 form-price form-qty"></span>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-space postform" id="priceDesc">
            <label class="form-space col-sm-2" for="price">Price:</label>
            <span class="form-price"><input type="text" name="price" class="col-sm-1 currencyinput form-price"></span> <!?>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="price">Image:</label>
            <input type="text" name="img-url" class="col-sm-2 form-price" class="form-price" disabled="true">
            <button class="form-price col-sm-1" type="button">Browse</button>
            <div class="col-sm-12"></div>
            <div class="col-sm-12"></div>
            <label class="form-space col-sm-2" for="desc">Description:</label>
            <textarea class="form-price form-textarea col-sm-6" rows="10" cols="50" sizeable="false"></textarea>
          </div>
          <div class="col-sm-12"></div>
          <div class="col-sm-12"></div>
          <div class="form-submit form-space col-sm-9">
            <input type="submit" value="Submit">
          </div>
        </form>
      </div>
    </div> 
          </div>
      </div><!--/row-->

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
 </body>
</html>
