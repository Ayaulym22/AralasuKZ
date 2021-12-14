package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repassword = request.getParameter("re-password");
            String fullname = request.getParameter("full_name");
            String birthdate = request.getParameter("birthdate");

            String redirect = "/register?re-passworderror";

            if(password.equals(repassword)){
                redirect = "/register?emailerror";
                Users user = DBManager.getUser(email);
                if(user==null) {
                    user = new Users(null, email, password, fullname, birthdate, "https://genslerzudansdentistry.com/wp-content/uploads/2015/11/anonymous-user.png");
                    DBManager.addUser(user);
                    redirect = "/register?success";
                }
            }
            response.sendRedirect(redirect);






    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request,response);
    }
}
