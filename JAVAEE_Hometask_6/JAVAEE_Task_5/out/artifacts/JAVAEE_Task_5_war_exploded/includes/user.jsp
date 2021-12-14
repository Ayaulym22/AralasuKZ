<%@ page import="db.Users" %><%
    Users currentUser = (Users) request.getSession().getAttribute("current_user");
    boolean ONLINE = false;
    if(currentUser!=null){
        ONLINE = true;
    }

%>