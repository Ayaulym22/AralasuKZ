<%--
  Created by IntelliJ IDEA.
  User: Dauren
  Date: 02.10.2020
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <%@include file="includes/head.jsp"%>
</head>
<body  >
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="row mb-4">
        <div class="col-sm-6 offset-3">

            <div class="title_name">
            <h4 class = "mb-4">Create new Account</h4>
            </div>
            <%
                String passworderror = request.getParameter("re-passworderror");
                if(passworderror!=null){
            %>

            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Passwords are not the same!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>

            <%
                String emailerror = request.getParameter("emailerror");
                if(emailerror!=null){
            %>

            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                This email exists!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>


            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>

            <div class="alert alert-success alert-dismissible fade show" role="alert">
                You successfully create account!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>

            <form action="/register" method="post">
                <div class="form-group">
                    <label class="col-form-label">Email address</label>
                    <input class="form-control" type="email" placeholder="Input your email" name="email" required>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Password</label>
                    <input class="form-control" type="password" placeholder="Input your password" name="password" required>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Re-Password</label>
                    <input class="form-control" type="password" placeholder="Input your password" name="re-password" required>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Full Name</label>
                    <input class="form-control" type="text" placeholder="Input your full name" name="full_name" required>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Birthdate</label>
                    <input class="form-control" type="date" name="birthdate" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-primary">Sign Up</button>
                </div>


            </form>




        </div>
    </div>
</div>

</body>
</html>

