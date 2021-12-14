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
                ArrayList<Chats> chats = (ArrayList<Chats>)request.getAttribute("chats");
                Chats chat  = (Chats)request.getAttribute("chat");
                if(chats!=null){
            %>
            <%
                for(Chats c : chats){
            %>
            <%
                if(!currentUser.getId().equals(c.getOpponent().getId())){
            %>
            <div class="card" style="margin-top: 20px;">
                <div class="row no-gutters">
                    <div class="col-md-4" style="text-align: center">
                        <img style="height: 80px;width: 80px;margin-top: 20px;margin-bottom:20px;border-radius: 360px;"  src="<%=c.getOpponent().getPicture_url()%>" class="card-img" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="row" style="margin-top: 20px;" >

                            <%
                                if(DBManager.isRead(c)){
                            %>
                            <div class="col">
                            <a href="/messageDetails?chat_id=<%=c.getId()%>" class="card-title"><%=c.getOpponent().getFull_name()%></a>
                            <p><%=c.getLatest_message_text()%></p>
                            </div>
                            <div class="col-4" style="float: right;text-align: right;margin-right: 15px">
                                <h6 style="float: right;font-size: 90%"><%=c.getLatest_message_time()%></h6>
                            </div>
                            <%
                                }else{
                            %>
                            <div class="col">
                            <strong><a href="/messageDetails?chat_id=<%=c.getId()%>" class="card-title">***  <%=c.getOpponent().getFull_name()%>  ***</a>
                            <p><%=c.getLatest_message_text()%></p></strong>
                            </div>
                            <div class="col-4" style="float: right;text-align: right;margin-right: 15px">
                                <h6 style="float: right;font-size: 90%"><%=c.getLatest_message_time()%></h6>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>

            </div>
            <%
                }else{
            %>
            <div class="card" style="margin-top: 20px;">
                <div class="row no-gutters">
                    <div class="col-md-4" style="text-align: center">
                        <img style="height: 80px;width: 80px;margin-top: 20px;margin-bottom:20px;border-radius: 360px;"  src="<%=c.getUser().getPicture_url()%>" class="card-img" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="row" style="margin-top: 20px;" >
                            <%
                                if(DBManager.isRead(c)){
                            %>
                            <div class="col">
                            <a href="/messageDetails?chat_id=<%=c.getId()%>" class="card-title"><%=c.getUser().getFull_name()%></a>
                            <p><%=c.getLatest_message_text()%></p>
                            </div>
                            <div class="col-4" style="float: right;text-align: right;margin-right: 15px">
                              <h6 style="float: right;font-size: 90%"><%=c.getLatest_message_time()%></h6>
                              </div>
                            <%
                            }else{
                            %>

                            <div class="col">
                            <strong><a href="/messageDetails?chat_id=<%=c.getId()%>" class="card-title">***  <%=c.getUser().getFull_name()%>  ***</a>
                            <p><%=c.getLatest_message_text()%></p></strong>
                            </div>
                            <div class="col-4" style="float: right;text-align: right;margin-right: 15px">
                                <strong><h6 style="float: right;font-size: 90%"><%=c.getLatest_message_time()%></h6></strong>
                            </div>
                            <%
                                }
                            %>
                        </div>

<%--                            <div class="row" style="margin-top: 25px;" >--%>
<%--                                <div class="col">--%>
<%--                                    <h5 class="card-title"><%=c.getSender().getFull_name()%> </h5>--%>
<%--                                    <p><%=c.getMessage_text()%></p>--%>
<%--                                </div>--%>
<%--                                <div class="col-5" style="float: right;text-align: right;margin-right: 15px">--%>
<%--                                    <h6 style="float: right;font-size: 90%"><%=c.getSent_date()%></h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>





                    </div>
                </div>

            </div>

            <%
                }
            %>
            <%
                    }}
            %>

<%--            <div class="card mt-4" >--%>
<%--                <div class="card-body">--%>
<%--                    <form action="/sendMess" method="get">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-9">--%>
<%--                                <input type="hidden" name="chat_id" value="<%=chat.getId()%>" >--%>
<%--                                <input class="form-control" type="text" name="message" placeholder="Send Message">--%>
<%--                            </div>--%>
<%--                            <div class="col-3">--%>
<%--                                <button class="btn btn-outline-primary" ><i id="fasearch" class="fa fa-search" aria-hidden="true" ></i>  Send Message</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
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

