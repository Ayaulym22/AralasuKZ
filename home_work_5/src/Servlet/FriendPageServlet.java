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
import java.util.ArrayList;

@WebServlet(value = "/friendpage")
public class FriendPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      User currentUser = (User) request.getSession().getAttribute("current_user");
      if(currentUser != null && request.getSession() != null){
          Long id = Long.parseLong(request.getParameter("id"));
          Friends friend = DBManager.getFriend(DBManager.getUser(id));
          if(friend !=  null){
              ArrayList<Post> posts = DBManager.getPost(id);
              request.setAttribute("posts",posts);
              request.setAttribute("friend" ,friend);
              request.getRequestDispatcher("/friendpage.jsp").forward(request, response);
          }

          else{
              request.getRequestDispatcher("/friends.jsp").forward(request,response);
          }
      }
      else {
          response.sendRedirect("/");
      }

    }
}
