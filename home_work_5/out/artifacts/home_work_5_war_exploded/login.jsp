<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13.10.2020
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-sm-6 offset-3">
            <h4 class="mb-4">
                Sign in
            </h4>
            <%
                String passError = request.getParameter("passworderror");
                if (passError != null) {

            %>

            <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect password!
                <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String emailError = request.getParameter("emailerror");
                if (emailError != null){
            %>
            <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect email!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
<%
    }
%>
            <form action="/auth" method="post">
                <div class="form-group">
                    <label>Email Adsress:</label>
                    <input type="text" required class="form-control" name="email">
                </div>

                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" required class="form-control" name="password">
                </div>

                <div class="form-group">
                <button class="btn btn-success">LOGIN</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="sticky-bottom text-write" style="background-color: lightgray;margin-top: 200px">
    <div class="row justify-content-center">
        <div class="col-5">
            <div class="d-flex justify-content-center">
                <p class="mt-4 mb-4" style="color: black">Copyright © aralasu.kz 2020</p>
            </div>

        </div>
    </div>

</div>
</body>
</html>
