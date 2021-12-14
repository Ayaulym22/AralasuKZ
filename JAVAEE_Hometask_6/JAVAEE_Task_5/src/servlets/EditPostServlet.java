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

@WebServlet(value = "/editPost")
public class EditPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null && request.getSession()!=null){
            request.setCharacterEncoding("utf8");
            Long id = Long.parseLong(request.getParameter("id"));
            String title = request.getParameter("title");
            String short_content = request.getParameter("short_content");
            String content = request.getParameter("content");

            Posts post = new Posts(id,title,short_content,content);
            DBManager.editPost(post);
            response.sendRedirect("/detailsPost?id="+id);
        }
        else {
            response.sendRedirect("/");
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
