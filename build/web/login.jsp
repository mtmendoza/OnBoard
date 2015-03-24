<!DOCTYPE html>
<html lang="en">
<head>
	<title>Welcome!</title>
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
 	<nav class="navbar navbar-custom">
  		<div class="navbar-header">
            <a class="navbar-link navbar-brand" href="index-login.html">Onboard</a>
        </div>
  </nav>
  <div class="container pagecontent">
    <div class="row">
      
      <!-- Article main content -->
      <article class="col-xs-12 maincontent">
        <div class="headroom"></div>
        
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
          <div class="panel panel-default">
            <div class="panel-body">
              <h3 class="thin text-center">Sign in to your account</h3>
              <p class="text-center text-muted">Don't have an account? Click <a style="color:blue;" href="signup.jsp">Register</a>
              to sign up for free! </p>
              <hr>
              
              <form action= "LoginServlet" method="post">
                <div class="top-margin">
                  <label>Username/Email <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" name = "user">
                </div>
                <div class="top-margin">
                  <label>Password <span class="text-danger">*</span></label>
                  <input type="password" class="form-control" name = "pw">
                </div>

                <hr>

                <div class="row">
                  <div class="col-lg-8">
                    <b><a href="">Forgot password?</a></b>
                  </div>
                  <div class="col-lg-4 text-right">
                    <button class="btn btn-action" type="submit">Sign in</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </article>
    </div>
    <div class="row navbar-fixed-bottom">
      <div class = "col-md-12">
        <hr class = "break"/>
        <ul>
          <li class = "footer">? 2014</li>
          <li class = "footer"><a href = "#aboutus">About Us</a></li>
          <li class = "footer"><a href = "#contactus">Contact Us</a></li>
        </ul>
        <p style = "padding-left:4em">Icons from Glyphicons Free.</p>
    </div>
	</div>
 </body>
</html>