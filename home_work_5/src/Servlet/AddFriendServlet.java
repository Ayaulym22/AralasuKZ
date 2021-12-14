package Servlet;

import db.DBManager;
import db.RequestFriend;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addFriend")
public class AddFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("current_user");
if (currentUser != null && request.getSession() != null){
        String name = request.getParameter("name");
        Long id = Long.parseLong(request.getParameter("id"));
        Long sender = Long.parseLong(request.getParameter("sender_id"));
        RequestFriend requestFriend = new RequestFriend(null, DBManager.getUser(id), DBManager.getUser(sender));

        if (DBManager.RequestsF(DBManager.getUser(id), DBManager.getUser(sender)) == null && DBManager.RequestsF(DBManager.getUser(sender), DBManager.getUser(id)) == null) {
            DBManager.addRequest(requestFriend);

        }
        response.sendRedirect("/friendsSearch?name=" + name);
    }
    else{
        response.sendRedirect("/");
    }

}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
