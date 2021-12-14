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
    <div class="row">
        <div class="col-3">
            <img src="<%=currentUser.getPicture_url()%>" style="height: 250px;margin-top: 20px;" class="card-img-top" alt="...">
            <%
                int age = 2020- Integer.parseInt(currentUser.getBirth_date().substring(0,4));

            %>
            <div class="card" style="margin-top: 20px;" >
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong style="font-weight: bolder"><%=currentUser.getFull_name()%>, <%=age%> years</strong></li>
            <li class="list-group-item"><a href="/profile"><i style="color:#007bff;font-size: 125%  " class="fa fa-address-card" aria-hidden="true"></i>  My Profile</a></li>
            <li class="list-group-item"><a href="#"><i style="color:#007bff;font-size: 125%  " class="fa fa-cogs" aria-hidden="true"></i>  Settings</a> </li>
            <li class="list-group-item"><a style="color:#8f2839; " href="/logout"><i style="color:#8f2839;font-size: 125%  " class="fa fa-sign-out" aria-hidden="true"></i>  Logout</a> </li>
        </ul>
    </div>
    </div>





        <div class="col-6">
           <h2 style="margin-top: 20px;">Edit Profile</h2>
            <%
                String successfull = request.getParameter("successfull");
                if(successfull!=null){
            %>

            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Profile changed successfully!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <form action="/editProfile" method="post">
                <div class="form-group">
                    <label class="col-form-label">Email address</label>
                    <input class="form-control" type="email" required readonly value="<%=currentUser.getEmail()%>">
                </div>
                <div class="form-group">
                    <label class="col-form-label">Full Name</label>
                    <input class="form-control" type="text" value="<%=currentUser.getFull_name()%>" name="full_name">
                </div>
                <div class="form-group">
                    <label class="col-form-label">Birthdate</label>
                    <input class="form-control" type="date" value="<%=currentUser.getBirth_date()%>" name="birthdate">
                </div>
                <div class="form-group">
                    <button class="btn btn-primary">Update Profile</button>
                </div>
            </form>
            <hr/>


                <h2>Edit Picture</h2>

                <form action="/editPicture" method="post">
                    <div class="form-group">
                        <label class="col-form-label">URL</label>
                        <input class="form-control" type="text" value="<%=currentUser.getPicture_url()%>" name="url">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary">Update URL</button>
                    </div>



            </form>
                <hr/>
            <h2>Update Password</h2>


            <%
                String oldpassworderror = request.getParameter("oldpassworderror");
                if(oldpassworderror!=null){
            %>

            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect old password!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>


            <%
                String samepasswords = request.getParameter("samepasswords");
                if(samepasswords!=null){
            %>

            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Old and new password are the same!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>


            <%
            String re_passworderror = request.getParameter("re_passworderror");
            if(re_passworderror!=null){
        %>

            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect re-password!
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
                Password changed successfully!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>






            <form action="/updatePassword" method="post">
                <div class="form-group">
                    <label class="col-form-label">Old Password</label>
                    <input class="form-control" type="password" placeholder="Input your old password" name="old_password">
                </div>
                <div class="form-group">
                    <label class="col-form-label">New Password</label>
                    <input class="form-control" type="password" placeholder="Input your new password" name="new_password">
                </div>
                <div class="form-group">
                    <label class="col-form-label">Re-New Password</label>
                    <input class="form-control" type="password" placeholder="Re type your new password again" name="re_passowrd">
                </div>
                <div class="form-group">
                    <button class="btn btn-primary">Update Password</button>
                </div>
            </form>





        </div>




        <div class="col-3">

            <div class="card text-white mb-3" style="max-width: 18rem;margin-top: 20px;">
                <div class="card-header">Header</div>
                <div class="card-body">
                    <p>Musa Uatbayev, tomorrow</p>
                    <p>Azamat Tolegenov, 02 October</p>
                    <p>Yerik Utemuratov, 05 October</p>
                    <p>Aybek Bagit, 10 October</p>
                </div>
            </div>

            <div class="card text-white mb-3" style="max-width: 18rem;">
                <div class="card-header">Header</div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <a  href="#"> FOOTBALL ONLINE</a>
                        </li>
                        <li class="list-group-item">
                            <a  href="#">PING PONG ONLINE</a>
                        </li>
                        <li class="list-group-item">
                            <a  href="#">CHESS MASTERS</a>
                        </li>
                        <li class="list-group-item">
                            <a  href="#" >RACES ONLINE</a>
                        </li>
                    </ul>



                </div>
            </div>

        </div>



    </div>
</div>

</body>
</html>

