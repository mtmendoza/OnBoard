<!DOCTYPE html>
<html lang="en">
<head>
	<title>Register an Account</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
	</script>
 	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
 	</script>
 	<link rel="stylesheet" type="text/css" href="styles.css">
 	<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">
 </head>
 <body>
     	<nav class="navbar navbar-custom" style="margin-bottom:0px;">
          <div class="navbar-header">
                <a class="navbar-link navbar-brand" href="index.jsp">Onboard</a>
            </div>
      </nav>
  <div class="container pagecontent">
        <div class="headroom"></div>        
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
          <div class="panel panel-default">
            <div class="panel-body">
              <h3 class="thin text-center">Register a New Account</h3>
              <p class="text-center text-muted">Have an account already? <a style="color:blue;" href="login.jsp">Login</a> here! </p>
              <hr>
            <form id = "signUpForm" action = "register" method = "post" class="form-signin">
                <div class=" row top-margin">
                  <div class="col-sm-6">
                    <label class="control-label">First Name <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name = "first_name" placeholder = "First Name" required>
                  </div>
                 
                  <div class="col-sm-6">
                    <label>Last Name <span class="text-danger">*</span> </label>
                    <input type="text" class="form-control" name = "last_name" placeholder = "Last Name" required>
                  </div>
                </div>
                <div class=" row top-margin">
                  <div class="col-sm-6">
                    <label>Email Address <span class="text-danger">*</span> </label>
                    <input type="text" class="form-control" name = "email" placeholder = "Email" id = "email" required>
                  </div>
                  <div class="col-sm-6">
                    <label>DLSU ID Number <span class="text-danger">*</span> </label>
                    <input type="text" class="form-control" name = "id_num" id = "id_num" placeholder = "ID Number" required>
                  </div>
                </div>
                <div class="row top-margin">
                  <div class="col-sm-6">
                    <label>Password <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" name = "pwd" placeholder = "Password" id = "pwd" required>
                  </div>
                  <div class="col-sm-6">
                    <label>Confirm Password <span class="text-danger" >*</span></label>
                    <input type="password" class="form-control" name = "confirmpwd" placeholder = "Re-enter Password" id = "confirmpwd" required>
                  </div>
                </div>
                <hr>
                <div class="row">
                     <div class="col-lg-8">
                        <div class="col-lg-12 text-right">
                        <button class="btn btn-action" type="submit">Register</button>
                        </div>
                    </div>
            
                </div>
              </form>
            </div>
          </div>

    </div>
    </div>
    <!--  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>-->
	<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
    
    <script>
	$( "#signUpForm" ).validate({
	  rules: {
		email: {
			email:true
		},  
	    pwd: "required",
	    confirmpwd: {
	      equalTo: "#pwd"
	    },
	    id_num : {
	    	remote: "checkID.jsp"
	    }
	  },
	  messages: {
          id_num: {
              remote: "That ID number already exists."
          }
	  }
	});
	</script>

    <!--<div class="row navbar-fixed-bottom">
      <div class = "col-md-12">
        <hr class = "break"/>
        <ul>
          <li class = "footer">? 2014</li>
          <li class = "footer"><a href = "#aboutus">About Us</a></li>
          <li class = "footer"><a href = "#contactus">Contact Us</a></li>
        </ul>
        <p style = "padding-left:4em">Icons from Glyphicons Free.</p>
    </div>
  </div>-->
 </body>
</html>