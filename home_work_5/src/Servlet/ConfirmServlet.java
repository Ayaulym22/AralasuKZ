package Servlet;

import db.DBManager;
import db.Friends;
import db.RequestFriend;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/confirm")
public class ConfirmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        RequestFriend requestFriend = DBManager.RequestsFriend(id);
        if(requestFriend != null){
            Friends friends = new Friends(null,requestFriend.getUser(),requestFriend.getRequest_sender());
            Friends friends2 = new Friends(null,requestFriend.getRequest_sender(), requestFriend.getUser());
            DBManager.addFriend(friends);
            DBManager.addFriend(friends2);
            DBManager.deleteRequest(id);
            response.sendRedirect("/friends");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
