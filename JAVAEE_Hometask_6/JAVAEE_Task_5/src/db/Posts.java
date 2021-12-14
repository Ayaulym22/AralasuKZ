package db;

import java.sql.Timestamp;

public class Posts {
   private Long id;
   private Users user;
   private String title;
   private String short_content;
   private String content;
   private Timestamp post_date;

    public Posts() {
    }

    public Posts(Long id, Users user, String title, String short_content, String content, Timestamp post_date) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.short_content = short_content;
        this.content = content;
        this.post_date = post_date;
    }

    public Posts(Long id, String title, String short_content, String content) {
        this.id = id;
        this.title = title;
        this.short_content = short_content;
        this.content = content;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShort_content() {
        return short_content;
    }

    public void setShort_content(String short_content) {
        this.short_content = short_content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }
}
