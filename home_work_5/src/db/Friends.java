package db;

import java.security.PrivateKey;
import java.security.Timestamp;

public class Friends {

    private Long id;
    private User user;
    private User friend;
    private Timestamp added_time;

    public Friends(){

    }

    public Friends(Long id, User user, User friend, Timestamp added_time) {
        this.id = id;
        this.user = user;
        this.friend = friend;
        this.added_time = added_time;
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

    public User getFriend() {
        return friend;
    }

    public void setFriend(User friend) {
        this.friend = friend;
    }

    public Timestamp getAdded_time() {
        return added_time;
    }

    public void setAdded_time(Timestamp added_time) {
        this.added_time = added_time;
    }
}
