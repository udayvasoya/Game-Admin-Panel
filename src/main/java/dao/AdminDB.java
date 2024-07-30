package dao;

import model.Admin_login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDB {
    public boolean validateAdmin(Admin_login adminLogin) {

        try
        {
            Connection connection = myDataBase.getConnection();
            PreparedStatement pst = connection.prepareStatement("select * from admin_login where adminname = ? and password = ?");
            pst.setString(1,adminLogin.getAdminname());
            pst.setString(2,adminLogin.getPassword());

            ResultSet rs = pst.executeQuery();
            return rs.next();

        }
        catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }

    }
}
