package db;

import java.sql.Timestamp;

public class Friends {
    private Long id;
    private Users user;
    private Users friend;
    private Timestamp added_time;

    public Friends() {
    }

    public Friends(Long id, Users user, Users friends, Timestamp added_time) {
        this.id = id;
        this.user = user;
        this.friend = friends;
        this.added_time = added_time;
    }

    public Friends(Long id, Users user, Users friend) {
        this.id = id;
        this.user = user;
        this.friend = friend;
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

    public Users getFriend() {
        return friend;
    }

    public void setFriend(Users friends) {
        this.friend = friends;
    }

    public Timestamp getAdded_time() {
        return added_time;
    }

    public void setAdded_time(Timestamp added_time) {
        this.added_time = added_time;
    }
}
