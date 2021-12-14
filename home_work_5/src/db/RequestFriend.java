package db;

import java.sql.Time;
import java.sql.Timestamp;

public class RequestFriend {

    private Long id;
    private User user;
    private User request_sender;
    private Timestamp sent_time;

    public RequestFriend(){

    }

    public RequestFriend(Long id, User user, User request_sender, Timestamp sent_time) {
        this.id = id;
        this.user = user;
        this.request_sender = request_sender;
        this.sent_time = sent_time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getRequest_sender() {
        return request_sender;
    }

    public void setRequest_sender(User request_sender) {
        this.request_sender = request_sender;
    }

    public Timestamp getSent_time() {
        return sent_time;
    }

    public void setSent_time(Timestamp sent_time) {
        this.sent_time = sent_time;
    }
}
