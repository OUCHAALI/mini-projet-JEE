<%-- 
    Document   : signIn
    Created on : 15-May-2024, 00:13:07
    Author     : SYN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>sign in</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Your custom CSS -->

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
                                    <h3>Sign In</h3>
                                    <p class="mb-4">Enter your Information down here.</p>
                                </div>
                                <form action="signInServlet" method="post">
                                    <div class="form-group first">
                                        <input placeholder="username" type="text" class="form-control" name="username" id="username" required>

                                    </div>
                                    <div class="form-group first">
                                        <input placeholder="email" type="email" class="form-control" id="email" name="email" required>

                                    </div>
                                    <div class="form-group last mb-4">
                                        <input placeholder="password" type="password" class="form-control" id="password" name="password" required>

                                    </div>



                                    <input type="submit" value="Create account" class="btn btn-block btn-primary bb">

                                    <a href="logIn.jsp" class="d-block text-left my-4 interactive-signin">Already have an account ?</a>

                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </body>
</html>

