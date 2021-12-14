package Servlet;

import db.DBManager;
import db.Friends;
import db.RequestFriend;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/friends")
public class FriendsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("current_user");
        if (currentUser != null) {

            ArrayList<RequestFriend> requests = DBManager.getRequests(currentUser);
            if (requests.isEmpty()) {
                requests = null;
            }
            request.setAttribute("requests", requests);


            ArrayList<Friends> friends = DBManager.getFriends(currentUser);
            request.setAttribute("friends", friends);
            request.getRequestDispatcher("/friends.jsp").forward(request, response);
        } else {
            response.sendRedirect("/");
        }
    }
}
