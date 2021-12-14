package db;

import javafx.geometry.Pos;

import javax.jws.soap.SOAPBinding;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/task5_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", "root", "");
        }  catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Users getUser(String email){
        Users user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from users where email = ?");
            statement.setString(1,email);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                user = new Users(
                        resultSet.getLong("id"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name"),
                        resultSet.getString("birth_date"),
                        resultSet.getString("picture_url")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static Users getUser(Long id){
        Users user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from users where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                user = new Users(
                        resultSet.getLong("id"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name"),
                        resultSet.getString("birth_date"),
                        resultSet.getString("picture_url")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static ArrayList<Friends> getFriends(Users user){
        ArrayList<Friends> friends = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from friends where user_id = ?");
            statement.setLong(1,user.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                friends.add(new Friends(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("friend_id")),
                        resultSet.getTimestamp("added_time")
                        ));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return friends;
    }

    public static Friends getFriend(Users user){
        Friends friend = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from friends where user_id = ?");
            statement.setLong(1,user.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                friend = new Friends(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("friend_id")),
                        resultSet.getTimestamp("added_time")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return friend;
    }

    public static Friends getFriend(Long id){
        Friends friend = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from friends where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                friend = new Friends(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("friend_id")),
                        resultSet.getTimestamp("added_time")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return friend;
    }

    public static ArrayList<Users> SearchFriends(Users user,String name){
        ArrayList<Users> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select id from users " +
                    "where (id not in (select friend_id from friends where user_id = ?) and id != ?) and full_name like ? or full_name like ?");
            statement.setLong(1,user.getId());
            statement.setLong(2,user.getId());
            statement.setString(3,name+"%");
            statement.setString(4,"%"+name);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                users.add(DBManager.getUser(resultSet.getLong("id")));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    public static ArrayList<RequestFriend> RequestsFriend(Users user){
        ArrayList<RequestFriend> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from friends_req where request_sender_id = ?");
            statement.setLong(1,user.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                users.add(new RequestFriend(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("request_sender_id")),
                        resultSet.getTimestamp("sent_time")
                ));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    public static RequestFriend RequestsFriend(Long id){
        RequestFriend users=null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from friends_req where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                users = new RequestFriend(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("request_sender_id")),
                        resultSet.getTimestamp("sent_time")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    public static RequestFriend RequestsF(Users user,Users sender){
        RequestFriend users = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from friends_req where request_sender_id = ? and user_id = ?");
            statement.setLong(1,sender.getId());
            statement.setLong(2,user.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                users = new RequestFriend(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("request_sender_id")),
                        resultSet.getTimestamp("sent_time")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    public static ArrayList<RequestFriend> getRequests(Users user){
        ArrayList<RequestFriend> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from friends_req where user_id = ?");
            statement.setLong(1,user.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                users.add(new RequestFriend(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("request_sender_id")),
                        resultSet.getTimestamp("sent_time")
                ));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    public static ArrayList<Messages> getMessages(Long chat_id){
        ArrayList<Messages> messages = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from messages where chat_id = ? order by sent_date ASC ");
            statement.setLong(1,chat_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                messages.add(new Messages(
                        resultSet.getLong("id"),
                        DBManager.getChat(resultSet.getLong("chat_id")),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("sender_id")),
                        resultSet.getString("message_text"),
                        resultSet.getBoolean("read_by_receiver"),
                        resultSet.getTimestamp("sent_date")
                ));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return messages;
    }

    public static Chats getChat(Users user,Users opponent){
        Chats chat = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from chats where (user_id = ? and opponent_user_id = ?) or (opponent_user_id = ? and user_id = ?)");
            statement.setLong(1,user.getId());
            statement.setLong(2,opponent.getId());
            statement.setLong(3,user.getId());
            statement.setLong(4,opponent.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                chat = new Chats(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("opponent_user_id")),
                        resultSet.getTimestamp("created_date"),
                        resultSet.getString("latest_message_text"),
                        resultSet.getTimestamp("latest_message_time")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return chat;
    }


    public static Chats getChat(Long id){
        Chats chat = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from chats where id=?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                chat = new Chats(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("opponent_user_id")),
                        resultSet.getTimestamp("created_date"),
                        resultSet.getString("latest_message_text"),
                        resultSet.getTimestamp("latest_message_time")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return chat;
    }


    public static ArrayList<Chats> getChats(Long id){
        ArrayList<Chats> chats = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from chats where user_id=? or opponent_user_id = ?");
            statement.setLong(1,id);
            statement.setLong(2,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                chats.add(new Chats(
                        resultSet.getLong("id"),
                        DBManager.getUser(resultSet.getLong("user_id")),
                        DBManager.getUser(resultSet.getLong("opponent_user_id")),
                        resultSet.getTimestamp("created_date"),
                        resultSet.getString("latest_message_text"),
                        resultSet.getTimestamp("latest_message_time")
                ));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return chats;
    }

    public static ArrayList<Posts> getPosts(Long id){
        ArrayList<Posts> posts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select id,author_id,title,short_content,content,post_date from posts where author_id = ? order by post_date DESC");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                posts.add(new Posts(
                        resultSet.getLong("id"),
                        getUser(resultSet.getLong("author_id")),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        resultSet.getString("content"),
                        resultSet.getTimestamp("post_date")
                ));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return posts;
    }

    public static Posts getPost(Long id){
        Posts post = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select id,author_id,title,short_content,content,post_date from posts where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                post = new Posts(
                        resultSet.getLong("id"),
                        getUser(resultSet.getLong("author_id")),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        resultSet.getString("content"),
                        resultSet.getTimestamp("post_date")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return post;
    }

    public static ArrayList<Posts> getAllPosts(){
        ArrayList<Posts> posts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from posts order by post_date DESC ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                posts.add(new Posts(
                        resultSet.getLong("id"),
                        getUser(resultSet.getLong("author_id")),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        resultSet.getString("content"),
                        resultSet.getTimestamp("post_date")
                ));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return posts;
    }

    public static boolean addRequest(RequestFriend requestFriend){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO friends_req" +
                    " (id,user_id,request_sender_id,sent_time) " +
                    "VALUES(NULL,?,?,NOW()) ");
            ps.setLong(1,requestFriend.getUser().getId());
            ps.setLong(2,requestFriend.getRequest_sender().getId());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static void deleteRequest(Long id){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM friends_req where id = ?");
            ps.setLong(1, id);
            ps.executeUpdate();
            ps.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static boolean addFriend(Friends friends){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO friends" +
                    " (id,user_id,friend_id,added_time) " +
                    "VALUES(NULL,?,?,NOW()) ");
            ps.setLong(1,friends.getUser().getId());
            ps.setLong(2,friends.getFriend().getId());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean addChat(Chats chat){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO chats" +
                    " (id,user_id,opponent_user_id,created_date,latest_message_text,latest_message_time) " +
                    "VALUES(NULL,?,?,NOW(),?,NOW()) ");
            ps.setLong(1,chat.getUser().getId());
            ps.setLong(2,chat.getOpponent().getId());
            ps.setString(3,chat.getLatest_message_text());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean addMessage(Messages messages){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO messages" +
                    " (id,chat_id,user_id,sender_id,message_text,read_by_receiver,sent_date) " +
                    "VALUES(NULL,?,?,?,?,?,NOW()) ");
            ps.setLong(1,messages.getChat().getId());
            ps.setLong(2,messages.getUser().getId());
            ps.setLong(3,messages.getSender().getId());
            ps.setString(4,messages.getMessage_text());
            ps.setBoolean(5,messages.getRead_by_receiver());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean addPost(Posts post){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO posts" +
                    " (id,author_id,title,short_content,content,post_date) " +
                    "VALUES(NULL,?,?,?,?,?) ");
            ps.setLong(1,post.getUser().getId());
            ps.setString(2,post.getTitle());
            ps.setString(3,post.getShort_content());
            ps.setString(4,post.getContent());
            ps.setTimestamp(5,post.getPost_date());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static void deletePost(Long id){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM posts where id = ?");
            ps.setLong(1, id);
            ps.executeUpdate();
            ps.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static void deleteFriend(Users user,Users friend){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM friends where user_id = ? and friend_id =?");
            ps.setLong(1, user.getId());
            ps.setLong(2, friend.getId());
            ps.executeUpdate();
            ps.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static boolean editPost(Posts post){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE posts SET title=?,short_content=?,content=? where id=?");
            ps.setString(1,post.getTitle());
            ps.setString(2,post.getShort_content());
            ps.setString(3,post.getContent());
            ps.setLong(4,post.getId());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean editChat(Chats chat){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE chats SET latest_message_text=?,latest_message_time=NOW() where id=?");
            ps.setString(1,chat.getLatest_message_text());
            ps.setLong(2,chat.getId());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }


    public static boolean isRead(Chats chat){
        boolean isRead = false;
        try{
            PreparedStatement ps = connection.prepareStatement("select read_by_receiver from messages where chat_id=? and message_text = ?");
            ps.setLong(1,chat.getId());
            ps.setString(2,chat.getLatest_message_text());
            ResultSet resultSet = ps.executeQuery();
            if(resultSet.next()){
                isRead = resultSet.getBoolean("read_by_receiver");
            }
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return isRead;
    }

    public static boolean editMessages(Chats chats,Users user){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE messages SET read_by_receiver = ? where chat_id=? and user_id = ?");
            ps.setBoolean(1,true);
            ps.setLong(2,chats.getId());
            ps.setLong(3,user.getId());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean addUser(Users user){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO users" +
                    " (id,email,password,full_name,birth_date,picture_url) " +
                    "VALUES(NULL,?,?,?,?,?)");
            ps.setString(1,user.getEmail());
            ps.setString(2,user.getPassword());
            ps.setString(3,user.getFull_name());
            ps.setString(4,user.getBirth_date());
            ps.setString(5,user.getPicture_url());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean editUser(Users user){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE users SET email=?,full_name=?,birth_date = ? where email=?");
            ps.setString(1,user.getEmail());
            ps.setString(2,user.getFull_name());
            ps.setString(3,user.getBirth_date());
            ps.setString(4,user.getEmail());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean editUserPicture(String email,String url){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE users SET picture_url=? where email=?");
            ps.setString(1,url);
            ps.setString(2,email);
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }

    public static boolean updatePassword(Users user){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE users SET password=? where email=?");
            ps.setString(1,user.getPassword());
            ps.setString(2,user.getEmail());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }


}
