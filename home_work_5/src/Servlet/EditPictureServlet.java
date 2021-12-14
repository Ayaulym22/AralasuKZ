package Servlet;

import db.DBManager;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/editPicture")
public class EditPictureServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String picture = request.getParameter("picture");
        String redirect = "/edit";

        User currentUser = (User) request.getSession().getAttribute("current_user");
        User user = DBManager.getUser(currentUser.getEmail());
        user.setPicture_url(picture);


        if(currentUser != null){
            if(DBManager.updatePicture(user)){
                redirect = "/edit?success_1";
                request.getSession().setAttribute("current_user", user);
            }
        }else{
            redirect = "/login";
        }
        response.sendRedirect(redirect);

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
