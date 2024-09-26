<%-- 
    Document   : logIn
    Created on : 15-May-2024, 00:12:47
    Author     : SYN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>log in</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="assets/images/login.jpg" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <h3>Log In</h3>
                                    <p class="mb-4">Enter your Information down here.</p>
                                </div>
                                <form action="logInServlet" method="post">
                                    <div class="form-group first">
                                        <input type="text" class="form-control" id="username" name="username" placeholder="username" />

                                    </div>
                                    <div class="form-group last mb-4">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="password" /> 

                                    </div>



                                    <input type="submit" value="Log In" class="btn btn-block btn-primary bb">

                                    <a href="signIn.jsp" class="d-block text-left my-4 interactive-signin">Create an account ?</a>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </body>
</html>






