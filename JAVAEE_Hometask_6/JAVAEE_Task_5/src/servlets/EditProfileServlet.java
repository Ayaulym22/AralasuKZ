package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/editProfile")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null && request.getSession()!=null){
            String full_name = request.getParameter("full_name");
            String birthdate = request.getParameter("birthdate");


                currentUser.setFull_name(full_name);
                currentUser.setBirth_date(birthdate);
                DBManager.editUser(currentUser);
                request.getSession().setAttribute("current_user",currentUser);

            response.sendRedirect("/profile?successfull");

        }
        else {
            response.sendRedirect("/");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
