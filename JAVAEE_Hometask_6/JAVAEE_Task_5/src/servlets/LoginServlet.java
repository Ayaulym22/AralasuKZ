package servlets;

import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            Users currentUser = (Users) request.getSession().getAttribute("current_user");
//            if(currentUser!=null) {
//                request.getSession().removeAttribute("current_user");
//            }

            request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
}
