<%@ page import="db.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
    <title>Details</title>
</head>
<body>
 <%@include file="vendor/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <img src="<%=currentUser.getPicture_url()%>" style="width: 250px; height: 250px">
            <br/>
            <br/>
            <div class="list-group" id="list-lab" role="tablist" style="width: 250px">
                <a class="list-group-item list-group-item-action" href="/profile" role="tab" aria-controls="home"><strong style="color: #000";><%=currentUser.getBirth_date()%></strong></a>

                <a class="list-group-item list-group-item-action" href="/edit" role="tab" aria-controls="/edit"><strong style="color: black";><img src="img/profile.png" style="width: 25px ;height: 25px">My Profile</strong></a>
                <a class="list-group-item list-group-item-action" href="#list-settings" role="tab" aria-controls="settings"><strong style="color: #000";><<img src="img/setting-gears.png" style="width: 25px ;height: 25px">Settings</strong></a>
                <a class="list-group-item list-group-item-action" href="/logout" role="tab" aria-controls="settings"><strong style="color: #000";><img src="img/logout.png" style="width: 25px ;height: 25px">Logout</strong></a>


            </div>
        </div>
            <div class="col-sm-6">
                <%
                    Post post = (Post)request.getAttribute("post");
                    if(post != null){
                %>


        <div class="card">
            <h5 class="card-header" style="background-color: white">Post</h5>
            <div class="card-body">
                <h3><%=post.getTitle()%></h3>
                    <p class="post_date"><%=post.getPost_date()%></p>
                <p class="post_date"><%=post.getContent()%></p>
                <br/>
                <%
                    if (post.getAuthod_id().getId() == currentUser.getId()){
                %>
                <button type = "submit" class="btn btn-success" data-toggle="modal" data-target="#edit">Edit</button>
                <a href="/delete?id=<%=post.getId()%>" class="btn btn-danger btn-sm float-right ml-2" style="background-color:#ff0f0f">DELETE</a>
<%
    }
%>

            </div>
        </div>
<%
        }
%>

            </div>
    <div class="col-sm-3">
        <div class="card" style="background-color:#fff">
            <div class="card-header" style="background-color: #ffb5b3">
            <strong style="color: #ffffff;">Lateest Birthdays </strong>

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
                <strong >My Games </strong>
            </div>
            <div class="card-body" style="color: #000">
                <p class="card-text"><strong><img src="img/football.png" style="width: 25px; height: 25px">FOOTBALL ONLINE</strong> </p>
                <p class="card-text"><strong><img src="img/ping-pong.png" style="width: 25px; height: 25px">PING PONG ONLINE</strong> </p>
                <p class="card-text"><strong><img src="img/chess-pieces.png" style="width: 25px; height: 25px">CHESS MASTERS</strong> </p>
                <p class="card-text"><strong><img src="img/car-fill-from-frontal-view.png" style="width: 25px; height: 25px">RACES ONLINE</strong></p>

            </div>
        </div>
    </div>
</div>
</div>


 <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="updateLeagueModalLabel" aria-hidden="true">
     <div class="modal-dialog" >
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel" >Edit Post</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <form action="/editPost" method="post">
                 <div class="modal-body">

                         <input type="hidden" value="<%=post.getId()%>" name="id">
                         <input type="hidden" value="<%=post.getAuthod_id().getId()%>"  name="authod_id">
                     <div class="form-group">
                         <label>Title:</label>
                         <input type="text" class="form-control" value="<%=post.getTitle()%>" name="title">

                     </div>

                     <div class="form-group">
                         <label>Short Content:</label>
                         <textarea type="text" name="short_content"><%=post.getShort_content()%></textarea>

                     </div>

                     <div class="form-group">
                         <label>Content:</label>
                         <textarea type="text" name="content"><%=post.getContent()%></textarea>

                     </div>
                 </div>
                 <div class="modal-footer">
                     <button type="submit" class="btn btn-dark">EDIT</button>
                     <button type="button" class="btn btn-danger" data-dismiss="modal">CLOSE</button>

                 </div>
             </form>
         </div>
     </div>
 </div>
<%--
 <div class="sticky-bottom text-write" style="background-color: lightgray;margin-top: 800px">
     <div class="row justify-content-center">
         <div class="col-5">
             <div class="d-flex justify-content-center">
                 <p class="mt-4 mb-4" style="color: black">Copyright © aralasu.kz 2020</p>
             </div>

         </div>
     </div>

 </div>--%>

</body>
</html>
