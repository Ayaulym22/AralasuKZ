package servlets;

import db.DBManager;
import db.Friends;
import db.RequestFriend;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/friendsSearch")
public class SearchFriendsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null && request.getSession()!=null){
            String name = "";
            name = request.getParameter("name");
            ArrayList<Users> users = DBManager.SearchFriends(currentUser,name);
            if(name.equals("")){
                users = null;
            }
            ArrayList<RequestFriend> requests = DBManager.getRequests(currentUser);
            if(requests.isEmpty()){
                requests = null;
            }
            request.setAttribute("requests",requests);
            request.setAttribute("name",name);
            ArrayList<Friends> friends = DBManager.getFriends(currentUser);
            request.setAttribute("friends",friends);
            request.setAttribute("search_users",users);
            request.getRequestDispatcher("/friends.jsp").forward(request,response);
        }
        else {
            response.sendRedirect("/");
        }
    }
}
