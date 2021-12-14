<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Post" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13.10.2020
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <img src="<%=currentUser.getPicture_url()%>" style="width: 250px; height: 250px">
            <br/>
            <br/>
            <div class="list-group" id="list-tab" role="tablist" style="width: 250px">

                <%
                    String year = currentUser.getBirth_date().substring(0,4);
                    int age = 2020 - Integer.parseInt(year);
                %>
                <a class="list-group-item list-group-item-action" href="/profile" role="tab" aria-controls="home"><strong style="color: #000;"><%=currentUser.getFull_name()%>,<%=age%>year</strong></a>


                <a class="list-group-item list-group-item-action" href="/edit" role="tab" aria-controls="/edit"><strong style="color: #000";><img src="img/profile.png" style="width: 25px ;height: 25px">My Profile</strong></a>
                <a class="list-group-item list-group-item-action" href="#list-settings" role="tab" aria-controls="settings"><strong style="color: #000";><<img src="img/setting-gears.png" style="width: 25px ;height: 25px">Settings</strong></a>
                <a class="list-group-item list-group-item-action" href="/logout" role="tab" aria-controls="settings"><strong style="color: #000";><img src="img/logout.png" style="width: 25px ;height: 25px">Logout</strong></a>

            </div>
        </div>
        <div class="col-sm-6">
            <h4 class="mb-4">Edit Profile</h4>

            <%
                String success = request.getParameter("success");
                if(success !=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                User's  changed successfully!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                <%
                    }
                %>
                <form action="/editProfile" method="post">
                    <div class="form-group">
                        <label>Email Address:</label>
                        <input type="text" required class="form-control" name="email" value="<%=currentUser.getEmail()%>">
                    </div>

                    <div class="form-group">
                        <label>Full name:</label>
                        <input type="text" required class="form-control" name="full_name" value="<%=currentUser.getFull_name()%>">

                    </div>

                    <div class="form-group">
                        <label>Birthdate:</label>
                        <div class="from-group row">
                            <div class="col-10">
                        <input class="form-control" value="<%=currentUser.getBirth_date()%>" name="birthdate" type="date" style="width: 540px">

                    </div>
                        </div>
                    </div>

                    <div class="form-group">
                       <button class="btn btn-success">Update Profile</button>
                        </div>

                </form>
           <br/>
    <br/>
            <h4 class="mb-4">Edit Picture</h4>
    <%
        String success1 = request.getParameter("success_1");
        if (success1 != null) {

    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        User's picture changed successfully!
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">x</span>
        </button>
    </div>
    <%
        }
    %>
    <form action="/editPicture" method="post">
        <div class="form-group">
            <label>URL:</label>
            <input type="text" required class="form-control" name="picture">
        </div>

        <div class="form-group">
            <button class="btn btn-success">Update URL</button>
        </div>
    </form>
    <br/>
    <h4 class="mb-4">Update Password</h4>
            <%
                String success2 = request.getParameter("success_2");
                if (success2 != null) {

            %>

            <div class = "alert alert-success alert-dismissible fade show" role="alert">
                User's password changed successfully!
                <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String passworderror = request.getParameter("passworderror");
                if (passworderror != null){
            %>
            <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                Password are not same!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String passworderrorOld = request.getParameter("passworderrorOld");
                if (passworderrorOld != null){
            %>
            <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                User's old password wrong!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
            <%
                }
            %>


            <form action="/updatePassword" method="post">
                <input type="hidden" required class="form-control" name="email" value="<%=currentUser.getEmail()%>">
                <div class="form-group">
                    <label>Old Password:</label>
                    <input type="password" required class="form-control" name="old_password">
                </div>

                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" required class="form-control" name="password">
                </div>

                <div class="form-group">
                    <label>Re-Password:</label>
                    <input type="password" required class="form-control" name="re_password">
                </div>

            <div class="form-group">
                <button class="btn btn-success">Update Password</button>
            </div>
        </form>


        </div>
        <div class="col-sm-3">
            <div class="card" style="width: 280px;">
                <div class="card-header" style="background-color: #ffb5b3">
                <strong style="color: #000;">Latest Birthdays </strong>

            </div>
            <div clas="card-body">
                <p class="card-text">Musa Uatbaev,tomorrow</p>
                <p class="card-text">Azamat Tolegenov,02 October</p>
                <p class="card-text">Yerik Utemuratov, 05 October</p>
            </div>
        </div>
        <br/>

        <div class="card" style="width: 280px;">
            <div class="card-header" style="background-color: #ffb5b3">
                <strong >My Games</strong>
            </div>
            <div class="card-body" style="color: #000">
                <p class="card-text"><strong><img src="img/football.png">FOOTBALL ONLINE</strong> </p>
                <p class="card-text"><strong><img src="img/ping-pong.png">PING PONG ONLINE</strong> </p>
                <p class="card-text"><strong><img src="img/chess-pieces.png">CHESS MASTERS</strong> </p>
                <p class="card-text"><strong><img src="img/car-fill-from-frontal-view.png">RACES ONLINE</strong></p>


            </div>
        </div>
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
