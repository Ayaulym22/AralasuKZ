package db;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/work_db?useUnicode=true&serverTimezone=UTC", "root","");

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users = new ArrayList<>();

        try {
            PreparedStatement ps =connection.prepareStatement("select * from users ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                users.add(new User(
                        rs.getLong("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("birth_date"),
                        rs.getString("picture_url")
                ));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public static User getUser(String email){
        User user = null;

        try {
            PreparedStatement ps =connection.prepareStatement("select * from users where email = ? ");
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                user = new User(
                        rs.getLong("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("birth_date"),
                        rs.getString("picture_url")
                );
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean addUser(User user){
        int row = 0;

        try {
            PreparedStatement ps =connection.prepareStatement("insert into users (email, password, full_name, birth_date, picture_url) VALUES (?,?,?,?,?) ");
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3,user.getFull_name());
            ps.setString(4,user.getBirth_date());
            ps.setString(5,user.getPicture_url());

            row = ps.executeUpdate();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return row>0;
    }


    public static ArrayList<Post> getAllPosts(){
        ArrayList<Post> posts = new ArrayList<>();

        try {
            PreparedStatement ps =connection.prepareStatement("select p.id, p.authod_id,u.email, u.password, u.full_name, u.birth_date, u.picture_url, p.title, p.short_content, p.content, p.post_date from posts p, users u where p.authod_id = u.id order by p.post_date desc ");
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                posts.add(new Post(
                        rs.getLong("id"),
                        new User(
                        rs.getLong("authod_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("birth_date"),
                        rs.getString("picture_url")
                ),
                        rs.getString("title"),
                        rs.getString("short_content"),
                        rs.getString("content"),
                        rs.getString("post_date")
                ));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public static ArrayList<Post> getAllPosts( Long id){
        ArrayList<Post> posts = new ArrayList<>();

        try {
            PreparedStatement ps =connection.prepareStatement("select *from  posts p, users u where p.authod_id = u.id  and u.id = ? order by p.post_date desc ");
            ps.setLong(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                posts.add(new Post(
                        rs.getLong("id"),
                        new User(
                                rs.getLong("authod_id"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("full_name"),
                                rs.getString("birth_date"),
                                rs.getString("picture_url")
                        ),
                        rs.getString("title"),
                        rs.getString("short_content"),
                        rs.getString("content"),
                        rs.getString("post_date")
                ));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    public static Post getPost(Long id){
        Post post = null;

        try {
            PreparedStatement ps =connection.prepareStatement("select p.id, p.authod_id, u.email, u.password, u.full_name, u.birth_date, u.picture_url, p.title, p.short_content, p.content, p.post_date " +
                    "from posts p, users u where p.authod_id = u.id and p.id=? ");
            ps.setLong(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
               post = new Post(
                        rs.getLong("id"),
                        new User(
                                rs.getLong("authod_id"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("full_name"),
                                rs.getString("birth_date"),
                                rs.getString("picture_url")
                        ),
                        rs.getString("title"),
                        rs.getString("short_content"),
                        rs.getString("content"),
                        rs.getString("post_date")
                );
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

    public static boolean deletePost(Long id){
        int row = 0;
        try{
            PreparedStatement ps =connection.prepareStatement("delete from posts where id = ? ");
            ps.setLong(1,id);
            row = ps.executeUpdate();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0;
    }



    public static boolean addPost(Post post){
    int row = 0;
    try{
        PreparedStatement ps =  connection.prepareStatement("insert into posts(id,authod_id, title, short_content, content, post_date) VALUES (null,?,?,?,?,?) ");

        ps.setLong(1,post.getAuthod_id().getId());
        ps.setString(2,post.getTitle());
        ps.setString(3,post.getShort_content());
        ps.setString(4,post.getContent());
        ps.setString(5,post.getPost_date());

        row = ps.executeUpdate();
        ps.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return row>0;
    }

    public static boolean updatePost(Post post){
        int row = 0;
        try{
            PreparedStatement ps =  connection.prepareStatement("update  posts set authod_id=?, title=?, short_content=?,content= ?, post_date=? where id = ? ");

            ps.setLong(1,post.getAuthod_id().getId());
            ps.setString(2,post.getTitle());
            ps.setString(3,post.getShort_content());
            ps.setString(4,post.getContent());
            ps.setTimestamp(5, Timestamp.valueOf(post.getPost_date()));
            ps.setLong(6,post.getId());

            row = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0;
    }

    public static boolean updateProfile(User user){
        int row = 0;
        try{
            PreparedStatement ps =  connection.prepareStatement("update  users set full_name=?, birth_date=?  where email =? ");

            ps.setString(1,user.getFull_name());
            ps.setString(2,user.getBirth_date());
            ps.setString(3,user.getEmail());



            row = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0;
    }

    public static boolean updatePicture(User user){
        int row = 0;
        try{
            PreparedStatement ps =  connection.prepareStatement("update  users set picture_url=?  where email =? ");

            ps.setString(1,user.getPicture_url());
            ps.setString(2,user.getEmail());

            row = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0;
    }


    public static boolean updatePassword(User user){
        int row = 0;
        try{
            PreparedStatement ps =  connection.prepareStatement("update  users set password = ? where email =? ");

            ps.setString(1,user.getPassword());
            ps.setString(2,user.getEmail());

            row = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0;
    }


}
