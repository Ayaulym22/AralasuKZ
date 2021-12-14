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
                        ArrayList<Posts> posts = (ArrayList<Posts>)request.getAttribute("posts");
                        if(posts!=null){
                    %>
                    <%
                        for(Posts p : posts){
                    %>
                    <div class="card" style="margin-top: 20px;">
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getTitle()%></h5>
                            <p class="card-text"><%=p.getShort_content()%></p>
                            <a href="/detailsPost?id=<%=p.getId()%>" class="btn btn-outline-primary">More</a>
                        </div>
                        <div class="card-footer">
                            <%
                                Calendar calendar = Calendar.getInstance();
                                calendar.setTime(p.getPost_date());
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
                            <p class="card-text">Posted on <%=month+" "+d+", "+y%> by <strong style="color: #180c7a"><%=p.getUser().getFull_name()%></strong></p>
                        </div>
                    </div>


                    <%
                            }}
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

</body>
</html>

