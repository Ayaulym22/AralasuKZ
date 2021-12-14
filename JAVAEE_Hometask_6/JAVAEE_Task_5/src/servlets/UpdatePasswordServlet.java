package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        if(currentUser!=null && request.getSession()!=null){

            String old_passowrd = request.getParameter("old_password");
            String new_password = request.getParameter("new_password");
            String re_password = request.getParameter("re_passowrd");

            String redirect = "/profile?oldpassworderror";

            if(currentUser.getPassword().equals(old_passowrd)){
                redirect = "/profile?samepasswords";
                if(!old_passowrd.equals(new_password)){
                    redirect = "/profile?re_passworderror";
                    if(new_password.equals(re_password)){
                        currentUser.setPassword(new_password);
                        DBManager.updatePassword(currentUser);
                        request.getSession().setAttribute("current_user",currentUser);
                        redirect = "/profile?success";
                    }
                }
            }
            response.sendRedirect(redirect);


        }
        else {
            response.sendRedirect("/");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
