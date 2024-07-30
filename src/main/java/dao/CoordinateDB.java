package dao;

import model.Coordinate;
import model.Game;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CoordinateDB
{
    public boolean insertData(Coordinate coordinate)
    {
        try
        {
            Connection connection = myDataBase.getConnection();
            PreparedStatement pst = connection.prepareStatement("insert into coordinate (fullname,email,phone,game,image) values (?,?,?,?,?)");
            pst.setString(1,coordinate.getFullname());
            pst.setString(2,coordinate.getEmail());
            pst.setString(3,coordinate.getPhone());
            pst.setString(4,coordinate.getGame());
            pst.setBytes(5,coordinate.getImage());

            int inserted = pst.executeUpdate();

            return inserted > 0;

        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateData(Coordinate coordinate)
    {
        try
        {
            Connection connection = myDataBase.getConnection();
            PreparedStatement pst = connection.prepareStatement("update coordinate set fullname=?,email=?,phone=?,game=?,image=? where id=?");
            pst.setString(1,coordinate.getFullname());
            pst.setString(2,coordinate.getEmail());
            pst.setString(3,coordinate.getPhone());
            pst.setString(4,coordinate.getGame());
            pst.setBytes(5,coordinate.getImage());
            pst.setInt(6,coordinate.getId());

            int updated = pst.executeUpdate();

            return updated > 0;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteData(Coordinate coordinate)
    {
            try
            {
                Connection conn = myDataBase.getConnection();
                PreparedStatement pst = conn.prepareStatement("delete from coordinate where id=?");
                pst.setInt(1,coordinate.getId());

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
