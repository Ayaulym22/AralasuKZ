<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@include file="user.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark " style = "background-color: #71c4ff ">
    <a class="navbar-brand" style="margin-left: 120px" href="/home"><img src="https://www.flaticon.com/svg/static/icons/svg/1384/1384882.svg" width="32px" height="32px"> <strong style="color:#fff ">ARALASU.kz</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto" style="margin-right:120px">
            <%
                if(online){
            %>

            <li class="nav-item ">

                <a class="nav-link" href="/profile"> <img src="/img/newspaper.png" style=" width: 25px;height: 25px"> Feed</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/"> <img src="/img/friends.png"style="width: 25px;height: 25px"> My Friends</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/"> <img src="/img/group.png"style="width: 25px;height: 25px"> Groups</a>
            </li>
            <li class="nav-item">
                <input type="hidden" required class="form-control" name = "email" value="<%=currentUser.getId()%>">
                <a class="nav-link" href="/myPost?id=<%=currentUser.getId()%>"> <img src="/img/speech-bubble.png"style="width: 25px;height: 25px"> My Posts</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/"> <img src="/img/paper-plane.png"style="width: 25px;height: 25px"> Messages</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/"> <img src="/img/images.png"style="width: 25px;height: 25px"> Pictures</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/"> <img src="/img/video-camera%20(1).png"style="width: 25px;height: 25px"> Videos</a>
            </li>

            <%
            }else {
            %>

            <li class="nav-item ">
                <a class="nav-link" href="/register"><img src="/img/new-user.png"style="width: 25px;height: 25px"> Register </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login"><img src="/img/login.png"style="width: 25px;height: 25px"> Login</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/register"><img src="img/faq-circular-filled-button.png"style="width: 25px;height: 25px"> FAQ </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login">About ARALASU</a>
            </li>
            <%
                }
            %>
        </ul>

    </div>
</nav>
