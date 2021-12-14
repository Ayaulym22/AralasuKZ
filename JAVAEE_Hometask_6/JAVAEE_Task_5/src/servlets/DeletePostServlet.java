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

@WebServlet(value = "/deletePost")
public class DeletePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null && request.getSession()!=null){

            Long id = Long.parseLong(request.getParameter("id"));
            DBManager.deletePost(id);
            response.sendRedirect("/main");

        }
        else {
            response.sendRedirect("/");
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
