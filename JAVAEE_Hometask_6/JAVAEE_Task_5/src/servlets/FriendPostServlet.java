package servlets;

import db.DBManager;
import db.Friends;
import db.Posts;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/friendPost")
public class FriendPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null){
            Long idf = Long.parseLong(request.getParameter("idf"));
            Friends friend = DBManager.getFriend(DBManager.getUser(idf));
            if(friend!=null) {
                Long id = Long.parseLong(request.getParameter("id"));
                Posts post = DBManager.getPost(id);
                request.setAttribute("post",post);
                request.setAttribute("friend", friend);
                request.getRequestDispatcher("/detailsPostFriend.jsp").forward(request, response);
            }
            else{
                request.getRequestDispatcher("/friends.jsp").forward(request, response);
            }



        }
        else {
            response.sendRedirect("/");
        }
    }
}
