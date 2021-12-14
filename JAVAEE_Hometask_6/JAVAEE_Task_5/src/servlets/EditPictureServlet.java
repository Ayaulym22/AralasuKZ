package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/editPicture")
public class EditPictureServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null && request.getSession()!=null){

            String url = request.getParameter("url");

            DBManager.editUserPicture(currentUser.getEmail(),url);

            request.getSession().setAttribute("current_user",DBManager.getUser(currentUser.getEmail()));
            response.sendRedirect("/profile");

        }
        else {
            response.sendRedirect("/");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
