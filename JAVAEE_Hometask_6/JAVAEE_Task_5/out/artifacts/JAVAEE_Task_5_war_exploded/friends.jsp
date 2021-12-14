<%--
  Created by IntelliJ IDEA.
  User: Dauren
  Date: 02.10.2020
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="db.*" %>
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

            <div class="card mt-4" >
                <div class="card-body">
                    <form action="/friendsSearch" method="get">
                        <div class="row">
                            <div class="col-9">
                            <input class="form-control" type="search" name="name" placeholder="Search Friends">
                            </div>
                            <div class="col-3">
                            <button class="btn btn-outline-primary" ><i id="fasearch" class="fa fa-search" aria-hidden="true" ></i>  Search</button>
                            </div>
                          </div>
                    </form>
                </div>
            </div>

            <%
                ArrayList<Users> s_users = (ArrayList<Users>) request.getAttribute("search_users");
                String name = (String) request.getAttribute("name");
                if(s_users!=null){%>

            <div class="card mt-4 mb-3">
                <div class="card-body">
                   <h4>Search results for: "<%=name%>"</h4>
                </div>
            </div>

                   <% for (Users u : s_users){
            %>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row no-gutters">
                    <div class="col-md-4" style="text-align: center">
                        <img style="height: 120px;width: 120px;margin-top: 20px;margin-bottom:20px;border-radius: 360px;"  src="<%=u.getPicture_url()%>" class="card-img" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"><%=u.getFull_name()%></h5>
                            <%
                                int age4 = 2020- Integer.parseInt(u.getBirth_date().substring(0,4));

                            %>
                            <p style="font-weight: bolder;margin-top: 5px;"><%=age4%> years old</p>
                            <%
                                RequestFriend r = DBManager.RequestsF(u,currentUser);
                                if(r!=null){
                                if(r.getRequest_sender().getId().equals(currentUser.getId()) && r.getUser().getId().equals(u.getId())){
                            %>
                            <button class="btn btn-outline-primary btn-sm" disabled>Request Sent</button>
                            <%
                                }else{
                            %>
                            <form action="/addFriend" method="post">
                                <input type="hidden" name="name" value="<%=name%>">
                                <input type="hidden" name="sender_id" value="<%=currentUser.getId()%>">
                                <input type="hidden" name="id" value="<%=u.getId()%>">
                            <button class="btn btn-outline-primary btn-sm" >Add To Friend</button>
                            </form>
                            <%
                               }}else{
                           %>

                            <form action="/addFriend" method="post">
                                <input type="hidden" name="name" value="<%=name%>">
                                <input type="hidden" name="sender_id" value="<%=currentUser.getId()%>">
                                <input type="hidden" name="id" value="<%=u.getId()%>">
                                <button class="btn btn-outline-primary btn-sm" >Add To Friend</button>
                            </form>

                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

            <%
                }}
                else{
            %>


            <%

                ArrayList<Friends> friends = (ArrayList<Friends>) request.getAttribute("friends");
                ArrayList<RequestFriend> requests = (ArrayList<RequestFriend>) request.getAttribute("requests");

                if(requests!=null){

            %>

            <div class="card mt-4">
                <div id="card-h" class="card-header" style="background-color: #f7f7f7;">You have <%=requests.size()%> new requests</div>

<%
    for(RequestFriend r : requests){
%>


                        <div class="row no-gutters">
                            <div class="col-md-4" style="text-align: center">
                                <img style="height: 120px;width: 120px;margin-top: 20px;margin-bottom:20px;border-radius: 360px;" src="<%=r.getRequest_sender().getPicture_url()%>" class="card-img" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%=r.getRequest_sender().getFull_name()%></h5>
                                    <%
                                        int age3 = 2020- Integer.parseInt(r.getUser().getBirth_date().substring(0,4));

                                    %>
                                    <p style="font-weight: bolder;margin-top: 5px;"><%=age3%> years old</p>
                                    <div class="row">
                                        <div class="col-3">
                                    <form action="/confirm" method="post">
                                        <input type="hidden" name="id" value="<%=r.getId()%>" >
                                        <button class="btn btn-outline-primary btn-sm">Confirm</button>
                                    </form>
                                        </div>
                                        <div class="col-3">
                                    <form action="/reject" method="post">
                                        <input type="hidden" name="id" value="<%=r.getId()%>" >
                                        <button class="btn btn-outline-primary btn-sm">Reject</button>
                                    </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



<%
    }
%>


            </div>

            <%
                    }
            %>


                <%if(friends!=null){
                    for(Friends f : friends){
            %>

            <div class="card mt-3" style="max-width: 540px;">
                <div class="row no-gutters">
                    <div class="col-md-4" style="text-align: center">
                        <img style="height: 120px;width: 120px;margin-top: 20px;margin-bottom:20px;border-radius: 360px;" src="<%=f.getFriend().getPicture_url()%>" class="card-img" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <a href="/friendpage?id=<%=f.getFriend().getId()%>" style="color: black;font-weight: bolder;font-size: large" class="card-title"><%=f.getFriend().getFull_name()%></a><br/>
                            <%
                                int age2 = 2020- Integer.parseInt(f.getFriend().getBirth_date().substring(0,4));

                            %>
                            <p style="font-weight: bolder;margin-top: 5px;"><%=age2%> years old</p>
                            <button class="btn btn-outline-primary btn-sm">Message</button>
                        </div>
                    </div>
                </div>
            </div>
                <%
                    } }}
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

