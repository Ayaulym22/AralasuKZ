package db;

import java.sql.Timestamp;

public class RequestFriend {
    private Long id;
    private Users user;
    private Users request_sender;
    private Timestamp sent_time;

    public RequestFriend() {
    }

    public RequestFriend(Long id, Users user, Users request_sender) {
        this.id = id;
        this.user = user;
        this.request_sender = request_sender;
    }

    public RequestFriend(Long id, Users user, Users request_sender, Timestamp sent_time) {
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

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Users getRequest_sender() {
        return request_sender;
    }

    public void setRequest_sender(Users request_sender) {
        this.request_sender = request_sender;
    }

    public Timestamp getSent_time() {
        return sent_time;
    }

    public void setSent_time(Timestamp sent_time) {
        this.sent_time = sent_time;
    }
}
