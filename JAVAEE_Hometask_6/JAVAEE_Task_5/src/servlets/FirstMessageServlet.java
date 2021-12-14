package servlets;

import db.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/sendMessage")
public class FirstMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("friend_id"));
        String message = request.getParameter("message");
        Friends friends = DBManager.getFriend(id);
        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        Chats chat = new Chats(null,currentUser,friends.getUser(),null,message,null);
        DBManager.addChat(chat);
        Chats c  = DBManager.getChat(currentUser,friends.getUser());
        Messages messages = new Messages(null,c,c.getOpponent(),c.getUser(),c.getLatest_message_text(),false,null);
        DBManager.addMessage(messages);
        response.sendRedirect("/messageDetails?chat_id="+c.getId());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
