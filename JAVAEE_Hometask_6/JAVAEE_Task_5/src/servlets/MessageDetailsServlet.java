package servlets;

import db.Chats;
import db.DBManager;
import db.Messages;
import db.Users;
import sun.plugin2.message.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/messageDetails")
public class MessageDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users currentUser = (Users) request.getSession().getAttribute("current_user");
        Long chat_id = Long.parseLong(request.getParameter("chat_id"));
        Chats chats = DBManager.getChat(chat_id);
        DBManager.editMessages(chats,currentUser);
        ArrayList<Messages> messages = DBManager.getMessages(chat_id);
        request.setAttribute("messages",messages);
        request.setAttribute("chats",chats);
        request.getRequestDispatcher("/messageDetails.jsp").forward(request,response);
    }
}
