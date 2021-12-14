package Servlet;

import db.DBManager;
import db.Friends;
import db.Post;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/removeFriend")
public class RemoveFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser =(User) request.getSession().getAttribute("current_user");
        if(currentUser != null && request.getSession()!= null){
            Long id = Long.parseLong(request.getParameter("id"));
            Friends friends = DBManager.getFriend(id);
            DBManager.deleteFriend(friends.getUser(),friends.getFriend());
            DBManager.deleteFriend(friends.getFriend(), friends.getUser());
            response.sendRedirect("/friends");

        }
        else{
            response.sendRedirect("/");
        }
    }
    }

