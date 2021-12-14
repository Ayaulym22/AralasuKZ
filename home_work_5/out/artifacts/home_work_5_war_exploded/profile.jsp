<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Post" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13.10.2020
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
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
                <a class="list-group-item list-group-item-action" href="/profile" role="tab" aria-controls="home"><strong style="color: #d45a5a;"><%=currentUser.getFull_name()%>,<%=age%>year</strong></a>


                <a class="list-group-item list-group-item-action" href="/edit" role="tab" aria-controls="/edit"><strong style="color: #000";><img src="img/profile.png" style="width: 25px ;height: 25px">My Profile</strong></a>
                <a class="list-group-item list-group-item-action" href="#list-settings" role="tab" aria-controls="settings"><strong style="color: #000";><<img src="img/setting-gears.png" style="width: 25px ;height: 25px">Settings</strong></a>
                <a class="list-group-item list-group-item-action" href="/logout" role="tab" aria-controls="settings"><strong style="color: #953744";><img src="img/logout.png" style="width: 25px ;height: 25px">Logout</strong></a>


            </div>
        </div>
        <div class="col-sm-6">

            <%
                ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts");
                if(posts != null){
                    for (Post p : posts){
            %>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%=p.getTitle()%></h5>
                    <p class="card-text"><%=p.getShort_content()%></p>
                    <a href="/detailsPost?id=<%=p.getId()%>" class="btn btn-primary">More...</a>
                </div>

                <div class="card-footer text-muted">

                    <%
                        StringTokenizer br = new StringTokenizer(p.getPost_date(),"-")   ;
                        String year_1 = br.nextToken();
                        String month_1 = br.nextToken();
                        String day_1 = br.nextToken();

                    %>
                    Posted on September <%=day_1%>, <%=year_1%> by <strong style="color: #000b67"><%=p.getAuthod_id().getFull_name()%></strong>

                </div>
            </div>
            <br/>
            <%
                    }
                }
            %>


        </div>

        <div class="col-sm-3">
            <div class="card">
            <div class="card-header" style="background-color: #ffb5b3">
                <strong style="color: #ffffff;">Latest Birthdays </strong>

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
                <strong>My Games </strong>
            </div>
            <div class="card-body" style="color: #180b7a">
                <p class="card-text"><strong><img src="img/football.png">FOOTBALL ONLINE</strong> </p>
                <p class="card-text"><strong><img src="img/ping-pong.png">PING PONG ONLINE</strong> </p>
                <p class="card-text"><strong><img src="img/chess-pieces.png">CHESS MASTERS</strong> </p>
                <p class="card-text"><strong><img src="img/car-fill-from-frontal-view.png">RACES ONLINE</strong></p>


            </div>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add new Posts</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/addPost" method="post">
                    <input type="hidden" required class="form-control" name="email" value="<%=currentUser.getEmail()%>">
                    <div class="form-group">
                        <label class="col-form-label">TITLE:</label>
                        <input type="text" class="form-control" name="title" placeholder="title of new...">
                    </div>
                    <div class="form-group">
                        <label  class="col-form-label">SHORT CONTENT:</label>
                        <textarea  class="form-control"  name="short_content" placeholder="Short Content..."></textarea>
                    </div>

                    <div class="form-group">
                        <label  class="col-form-label">CONTENT:</label>
                        <textarea  class="form-control"  name="content" placeholder="Content..."></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" style="background-color:#122647 ">ADD</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">CANCEL</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
