package Servlet;

import db.DBManager;
import db.User;
import db.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/toRegister")
public class ToRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String full_name = request.getParameter("full_name");
        String birthdate = request.getParameter("birthdate");
        String picture = "https://www.flaticon.com/svg/static/icons/svg/3627/3627226.svg";
        String redirect = "/register?passworderror";

        if(password.equals(re_password)){

            redirect = "/register?emailerror";
            User user = DBManager.getUser(email);

            if(user == null){
                User newUser = new User(null,email,password,full_name,birthdate,picture);
                if(DBManager.addUser(newUser)){

                    redirect = "/register?success";
                }
            }

        }
        response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
