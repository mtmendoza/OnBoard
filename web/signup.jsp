<!DOCTYPE html>
<html lang="en">
<head>
	<title>Onboard - Registration</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
	</script>
 	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
 	</script>
 	<link rel="stylesheet" type="text/css" href="styles.css">
 </head>
 <body>
     	<nav class="navbar navbar-custom" style="margin-bottom:0px;">
          <div class="navbar-header">
                <a class="navbar-link navbar-brand" href="index.jsp">Onboard</a>
            </div>
            <div>
              <input type="text" class="navbar-search navbar-searchbar" placeholder="Search">
              <button type="button" class="navbar-search navbar-searchbutton"><span class="glyphicon glyphicon-search"></span></button>
            </div>
          </div>
      </nav>
  <div class="container pagecontent">
    <div class="row">
      <article class="col-xs-12 maincontent">
        <header class="page-header">
          <h1 class="page-title">Registration</h1>
        </header>
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
          <div class="panel panel-default">
            <div class="panel-body">
              <h3 class="thin text-center">Register a new account</h3>
              <p class="text-center text-muted">Already have an account? <a href="login.jsp">Login</a>.</p>
              <hr>
              <form>
                <div class="top-margin">
                  <label>First Name</label>
                  <input type="text" class="form-control">
                </div>
                <div class="top-margin">
                  <label>Last Name</label>
                  <input type="text" class="form-control">
                </div>
                <div class="top-margin">
                  <label>Email Address <span class="text-danger">*</span></label>
                  <input type="text" class="form-control">
                </div>
                <div class="row top-margin">
                  <div class="col-sm-6">
                    <label>Password <span class="text-danger">*</span></label>
                    <input type="text" class="form-control">
                  </div>
                  <div class="col-sm-6">
                    <label>Confirm Password <span class="text-danger">*</span></label>
                    <input type="text" class="form-control">
                  </div>
                </div>
                <hr>
                <div class="row">
                  <!---<div class="col-lg-8">
                    <label class="checkbox"><input type="checkbox"> I've read the <a href="page_terms.html">Terms and Conditions</a></label>  
                  </div>-->
                  <div class="col-lg-8"></div>
                  <div class="col-lg-4 text-right">
                      <button class="btn btn-action" type="submit"><a href = "index.jsp">Register</a></button>
                  </div>
                </div>
              </form>
            </div>
          </div>
      </article>
    </div>

    <div class="row navbar-fixed-bottom">
      <div class = "col-md-12">
        <hr class = "break"/>
        <ul>
          <li class = "footer">© 2014</li>
          <li class = "footer"><a href = "#aboutus">About Us</a></li>
          <li class = "footer"><a href = "#contactus">Contact Us</a></li>
        </ul>
        <p style = "padding-left:4em">Icons from Glyphicons Free.</p>
    </div>
  </div>
 </body>
</html>