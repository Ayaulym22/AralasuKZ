package db;

import java.sql.Timestamp;

public class Messages {
    private Long id;
    private Chats chat;
    private Users user;
    private Users sender;
    private String message_text;
    private boolean read_by_receiver;
    private Timestamp sent_date;

    public Messages() {
    }

    public Messages(Long id, Chats chat, Users user, Users sender, String message_text, boolean read_by_receiver, Timestamp sent_date) {
        this.id = id;
        this.chat = chat;
        this.user = user;
        this.sender = sender;
        this.message_text = message_text;
        this.read_by_receiver = read_by_receiver;
        this.sent_date = sent_date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Chats getChat() {
        return chat;
    }

    public void setChat(Chats chat) {
        this.chat = chat;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Users getSender() {
        return sender;
    }

    public void setSender(Users sender) {
        this.sender = sender;
    }

    public String getMessage_text() {
        return message_text;
    }

    public void setMessage_text(String message_text) {
        this.message_text = message_text;
    }

    public boolean getRead_by_receiver() {
        return read_by_receiver;
    }

    public void setRead_by_receiver(boolean read_by_receiver) {
        this.read_by_receiver = read_by_receiver;
    }

    public Timestamp getSent_date() {
        return sent_date;
    }

    public void setSent_date(Timestamp sent_date) {
        this.sent_date = sent_date;
    }
}
