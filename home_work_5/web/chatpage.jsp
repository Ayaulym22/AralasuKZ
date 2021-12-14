<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Messages" %>
<%@ page import="db.Chats" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 15.10.2020
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
    <%@include file="vendor/head.jsp"%>
    <script src="vendor/tinymce/tinymce.min.js"></script>
    <script>tinymce.init({ selector:'textarea' });</script>

</head>
<body>

<%@include file="vendor/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-3">
            <img src="<%=currentUser.getPicture_url()%>" style="height: 250px ; margin-top: 20px;" class="card-img-top" alt="...">

            <%
                int age = 2020-Integer.parseInt(currentUser.getBirth_date().substring(0,4));

            %>
            <div class="card" style="margin-top: 20px">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong style="font-weight: bolder"><%=currentUser.getFull_name()%>,<%=age%> years</strong> </li>

                    <a class="list-group-item list-group-item-action" href="/edit"  style="color: #91bbe9; font-size: 125%"  role="tab" aria-controls="/edit"><strong style="color: black";><img src="img/profile.png" style="width: 25px ;height: 25px">My Profile</strong></a>
                    <a class="list-group-item list-group-item-action" href="#list-settings" style="color: #91bbe9; font-size:125%" role="tab" aria-controls="settings"><strong style="color: #000";><<img src="img/setting-gears.png" style="width: 25px ;height: 25px">Settings</strong></a>
                    <a class="list-group-item list-group-item-action" href="/logout" style="color: red" role="tab" aria-controls="settings"><strong style="color: #000";><img src="img/logout.png" style="width: 25px ;height: 25px">Logout</strong></a>


                </ul>
            </div>
        </div>
        <div class="col-6">
            <%
                ArrayList<Messages> messages = (ArrayList<Messages> )request.getAttribute("messages");
                Chats chat = (Chats) request.getAttribute("chat");
                if (messages != null){
            %>

            <%
                for (Messages ms : messages){
            %>
            <div class="card" style="margin-top: 20px">
                <div class="row no-gutters">
                    <div class="col-md-4" style="text-align: center">
                        <img style="height: 120px;width: 120px;margin-top: 20px; margin-bottom: 20px; border-radius: 360px" src="<%=ms.getSender().getPicture_url()%> " class="card-img" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"><%=ms.getSender().getFull_name()%></h5>
                            <p><%=ms.getMessage_text()%></p>
                        </div>
                    </div>
                </div>

            </div>
<%
    }
%>
            <div class="card-mt-4">
                <div class="card-body">
                    <form action="/sendMess" method="get">
                        <div class="row">
                            <div class="col-9">
                                <input type="hidden" , name="chat_id", value="<%=chat.getId()%>">
                                <input class="form-control" name="message" type="text" placeholder="Send Message">

                            </div>
                            <div class="col-3">
                                <button class="btn btn-success"><i id="fesearch" class="fa fa-search" aria-hidden="true"></i>Send Message</button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-3">
            <div class="card-header">Header</div>
            <div class="card-body">
                <p >Musa Uatbaev,tomorrow</p>
                <p >Azamat Tolegenov,02 October</p>
                <p >Yerik Utemuratov, 05 October</p>
            </div>
        </div>

        <div class="card text-white mb-3" style="max-width: 18rem;">
            <div class="card-header">Header</div>
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <a href="#">FOOTBALL ONLINE</a>
                    </li>

                    <li class="list-group-item">
                        <a href="#">PING PONG ONLINE</a>
                    </li>

                    <li class="list-group-item">
                        <a href="#">CHESS MASTERS</a>
                    </li>

                    <li class="list-group-item">
                        <a href="#">RACES ONLINE</a>
                    </li>
                </ul>
            </div>
        </div>

    </div>

</div>
</div>

</body>
</html>
