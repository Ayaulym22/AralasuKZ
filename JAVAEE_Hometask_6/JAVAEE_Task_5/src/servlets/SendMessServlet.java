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

@WebServlet(value = "/sendMess")
public class SendMessServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Long chat_id = Long.parseLong(request.getParameter("chat_id"));
            String message = request.getParameter("message");
            Chats chat = DBManager.getChat(chat_id);
            chat.setLatest_message_text(message);
            DBManager.editChat(chat);
            Users currentUser = (Users) request.getSession().getAttribute("current_user");
            Users user;
            if(chat.getUser().getId().equals(currentUser.getId())){
               user = chat.getOpponent();
            }
            else{
                user = chat.getUser();
            }
            Messages mess = new Messages(null,chat,user,currentUser,message,false,null);
            DBManager.addMessage(mess);
            response.sendRedirect("/messageDetails?chat_id="+chat.getId());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
