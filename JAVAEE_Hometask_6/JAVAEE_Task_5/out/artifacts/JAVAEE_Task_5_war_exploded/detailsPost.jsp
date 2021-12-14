<%--
  Created by IntelliJ IDEA.
  User: Dauren
  Date: 02.10.2020
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %>
<%@ page import="db.Posts" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <%@include file="includes/head.jsp"%>
    <script src="vendor/tinymce/tinymce.min.js"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
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


            <%
                String successfull = request.getParameter("success");
                if(successfull!=null){
            %>

            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Post updated successfully!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>

            <%
                Posts post = (Posts)request.getAttribute("post");
                if(post!=null){
            %>

            <div class="card" style="margin-top: 20px;">
                <div class="card-body">
                    <h5 class="card-title"><%=post.getTitle()%></h5>
                    <p class="card-text"><%=post.getShort_content()%></p>
                    <p class="card-text"><%=post.getContent()%></p>
                </div>
                <div class="card-footer">
                    <%
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(post.getPost_date());
                        int m = calendar.get(Calendar.MONTH);
                        int d = calendar.get(Calendar.DAY_OF_MONTH);
                        int y = calendar.get(Calendar.YEAR);
                        String month ="";
                        switch (m){
                            case 1:month = "January";break;
                            case 2:month = "February";break;
                            case 3:month = "March";break;
                            case 4:month = "April";break;
                            case 5:month = "May";break;
                            case 6:month = "June";break;
                            case 7:month = "July";break;
                            case 8:month = "August";break;
                            case 9:month = "September";break;
                            case 10:month = "October";break;
                            case 11:month = "November";break;
                            case 12:month = "December";break;

                        }
                    %>
                    <p class="card-text">Posted on <%=month+" "+d+", "+y%> by <strong style="color: #180c7a"><%=post.getUser().getFull_name()%></strong></p>
                </div>
            </div>
            <%
                if(post.getUser().getId()== currentUser.getId()){
            %>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Edit" >Edit</button>
            <button type="button" style="float: right" class="btn btn-danger" data-toggle="modal" data-target="#Delete" >Delete</button>
            <%
                    } }
            %>
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








<div class="modal fade" id="Edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/editPost" method="post">
                <div class="modal-body">
                    <%
                        if(post!=null){
                    %>
                    <div class="form-group">
                        <input type="hidden" value="<%=post.getId()%>" name="id">
                        <label class="col-form-label" >TITLE:</label>
                        <input type="text" class="form-control" value="<%=post.getTitle()%>" name="title">
                    </div>
                    <div class="form-group">
                        <label  class="col-form-label" >SHORT CONTENT:</label>
                        <textarea type="text" style="min-height: 200px;" class="form-control" name="short_content"><%=post.getShort_content()%></textarea>
                    </div>
                    <div class="form-group">
                        <label  class="col-form-label" >CONTENT:</label>
                        <textarea type="text" style="min-height: 200px;" class="form-control" name="content"><%=post.getContent()%></textarea>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Edit</button>
                </div>
            </form>
        </div>
    </div>
</div>




<div class="modal fade" id="Delete" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Are you sure to delete?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
<%--            <div class="modal-body">--%>

<%--            </div>--%>
            <div class="modal-footer">
                <form action="/deletePost" method="post">
                    <input type="hidden" name="id" value="<%=post.getId()%>">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
                    <button type="submit" class="btn btn-danger">YES</button>
                </form>
            </div>
        </div>
    </div>
</div>



</body>
</html>

