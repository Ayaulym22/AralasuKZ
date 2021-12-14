package servlets;

import db.DBManager;
import db.Posts;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

@WebServlet(value = "/addPost")
public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null && request.getSession()!=null){

            request.setCharacterEncoding("utf8");
            String title = request.getParameter("title");
            String short_content = request.getParameter("short_content");
            String content = request.getParameter("content");
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            Posts post = new Posts(null,currentUser,title,short_content,content,timestamp);

            DBManager.addPost(post);
            response.sendRedirect("/myposts");

        }
        else {
            response.sendRedirect("/");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
