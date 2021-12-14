
<%@include file="user.jsp"%>
<nav class="navbar navbar navbar-dark">

    <%
        if(ONLINE){
    %>
    <a class="navbar-brand" href="/main" ><i class="fa fa-buysellads" aria-hidden="true"></i> ARALASU.KZ</a>

        <ul class="nav justify-content-end">

            <li class="nav-item">
                <a class="nav-link" href="/main"> <i class="fa fa-newspaper-o" aria-hidden="true"></i>  Feed</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/friends"><i class="fa fa-users" aria-hidden="true"></i>  My Friends</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-users" aria-hidden="true"></i>  Groups</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/myposts"><i class="fa fa-commenting-o" aria-hidden="true"></i>  My Posts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/messages"><i class="fa fa-paper-plane" aria-hidden="true"></i>  Messages</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-picture-o" aria-hidden="true"></i>  Pictures</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-video-camera" aria-hidden="true"></i>  Videos</a>
            </li>
        </ul>
            <%
            } else{
            %>
    <a class="navbar-brand" href="/" ><i class="fa fa-buysellads" aria-hidden="true"></i> ARALASU.KZ</a>

    <ul class="nav justify-content-end">

    <li class="nav-item">
                <a class="nav-link" href="/register"><i class="fa fa-user-plus" aria-hidden="true"></i>  Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login"><i class="fa fa-sign-in" aria-hidden="true"></i>  Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>  FAQ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>  About Aralasu</a>
            </li>
            <%
                }
            %>
        </ul>
</nav>

