import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import jspBeans.Organization;
import jspBeans.User;

public class Model
{

    private static DBConnection db;

    public Model()
    {
        db = new DBConnection();
        db.getConnection();
    }

    public static User getUser(String user_id, String password)
    {
        User user = null;
        db = new DBConnection();
        db.getConnection();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT * FROM user WHERE user_id = '" + user_id + "' AND password = '" + password + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            if (rs.next())
            {
                user = new User(rs.getInt("user_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("user_type"), rs.getInt("manager_id"), rs.getString("password"));
            }

            if (user != null && user.getManager_id() != 0)
            {
                query = "SELECT org_id, org_name, org_password FROM manager m, organization o WHERE m.user_id = '" + user.getUser_id() + "' AND o.org_id = m.org_id";
                statement = db.getConnection().prepareStatement(query);
                rs = statement.executeQuery();
                while (rs.next())
                {
                    user.addOrg(new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("org_password")));
                }
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }

    public static Organization getOrg(String org_id, String password)
    {
        Organization org = null;
        db = new DBConnection();
        db.getConnection();
        try
        {
            ResultSet rs, rs2;
            PreparedStatement statement;
            String query = "SELECT * FROM organization WHERE org_id = '" + org_id + "' AND password = '" + password + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            if (rs.next())
            {
                org = new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("password"));
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return org;
    }
}
