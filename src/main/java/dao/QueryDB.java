package dao;

import model.Query;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class QueryDB
{
    public boolean deletequery(Query query)
    {
        try
        {
            Connection connection = myDataBase.getConnection();
            PreparedStatement pst = connection.prepareStatement("delete from contact where id=?");
            pst.setInt(1,Query.getId());

            int delete = pst.executeUpdate();

            return delete > 0 ;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return false;
        }

    }
}
