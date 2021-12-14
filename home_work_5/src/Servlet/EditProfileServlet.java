package Servlet;

import db.DBManager;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/editProfile")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String email = request.getParameter("email");
      String full_name= request.getParameter("full_name");
      String birthdate = request.getParameter("birthdate");
      String redirect = "/edit";

      User user = DBManager.getUser(email);
      user.setFull_name(full_name);
      user.setBirth_date(birthdate);
      User currentUser = (User) request.getSession().getAttribute("current_user");

      if(currentUser != null){
          if(DBManager.updateProfile(user)){
              redirect = "/edit?success";
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