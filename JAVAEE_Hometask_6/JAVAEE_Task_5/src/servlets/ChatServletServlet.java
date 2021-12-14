package servlets;

import db.Chats;
import db.DBManager;
import db.Messages;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/chat")
public class ChatServletServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("opponent_id"));
        Users opponent = DBManager.getUser(id);
        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        Chats chat  = DBManager.getChat(currentUser,opponent);
        ArrayList<Messages> messages = DBManager.getMessages(chat.getId());
        request.setAttribute("chat",chat);
        request.setAttribute("messages",messages);
        request.getRequestDispatcher("/chatpage.jsp").forward(request,response);
    }
}
