package dao;

import model.Game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//this class provide crude db operations for the table user in the db
public class GameDB
{
    public boolean insertData(Game game)
    {
        try {
            Connection con = myDataBase.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into games (game_name,game_discribtion,game_rules,price,image,date) values (?,?,?,?,?,?)");
            pst.setString(1,game.getGame_name());
            pst.setString(2, game.getGame_desc());
            pst.setString(3, game.getGame_rules());
            pst.setInt(4,game.getPrice());
            pst.setBytes(5,game.getImage());
            pst.setString(6,game.getDate());

            int inserted = pst.executeUpdate();

            return inserted > 0;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateData(Game game)
    {
        try
        {
            Connection conn = myDataBase.getConnection();
            PreparedStatement pst = conn.prepareStatement("update games set game_name=?,game_discribtion=?,game_rules=?,price=?,image=?,date=? where id=?");

            pst.setString(1,game.getGame_name());
            pst.setString(2, game.getGame_desc());
            pst.setString(3, game.getGame_rules());
            pst.setInt(4,game.getPrice());
            pst.setBytes(5,game.getImage());
            pst.setString(6,game.getDate());
            pst.setInt(7,game.getId());


            int updated = pst.executeUpdate();

            return updated > 0;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return false;
        }

    }

    public boolean deleteData(Game game)
    {
        try
        {
            Connection conn = myDataBase.getConnection();
            PreparedStatement pst = conn.prepareStatement("delete from games where id=?");
            pst.setInt(1,game.getId());

            int deleted = pst.executeUpdate();

            return deleted > 0;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
}
