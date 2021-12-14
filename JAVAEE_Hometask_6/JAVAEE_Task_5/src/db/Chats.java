package db;

import java.sql.Timestamp;

public class Chats {
    private Long id;
    private Users user;
    private Users opponent;
    private Timestamp created_date;
    private String latest_message_text;
    private Timestamp latest_message_time;

    public Chats() {
    }

    public Chats(Long id, Users user, Users opponent, Timestamp created_date, String latest_message_text, Timestamp latest_message_time) {
        this.id = id;
        this.user = user;
        this.opponent = opponent;
        this.created_date = created_date;
        this.latest_message_text = latest_message_text;
        this.latest_message_time = latest_message_time;
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

    public Users getOpponent() {
        return opponent;
    }

    public void setOpponent(Users opponent) {
        this.opponent = opponent;
    }

    public Timestamp getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Timestamp created_date) {
        this.created_date = created_date;
    }

    public String getLatest_message_text() {
        return latest_message_text;
    }

    public void setLatest_message_text(String latest_message_text) {
        this.latest_message_text = latest_message_text;
    }

    public Timestamp getLatest_message_time() {
        return latest_message_time;
    }

    public void setLatest_message_time(Timestamp latest_message_time) {
        this.latest_message_time = latest_message_time;
    }
}
