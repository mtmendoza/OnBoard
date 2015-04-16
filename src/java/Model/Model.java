package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import jspBeans.Item;
import jspBeans.Order;
import jspBeans.Organization;
import jspBeans.User;

public class Model
{

    private static DBConnection db;

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
            
            if (user == null)
            {
            query = "SELECT * FROM user WHERE email = '" + user_id + "' AND password = '" + password + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            if (rs.next())
            {
                user = new User(rs.getInt("user_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("user_type"), rs.getInt("manager_id"), rs.getString("password"));
            }
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
    
    public static User getUser(String user_id)
    {
        User user = null;
        db = new DBConnection();
        db.getConnection();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT * FROM user WHERE user_id = '" + user_id + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            if (rs.next())
            {
                user = new User(rs.getInt("user_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("user_type"), rs.getInt("manager_id"), rs.getString("password"));
            }
            
            if (user == null)
            {
            query = "SELECT * FROM user WHERE email = '" + user_id  + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            if (rs.next())
            {
                user = new User(rs.getInt("user_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("user_type"), rs.getInt("manager_id"), rs.getString("password"));
            }
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
            ResultSet rs;
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
    
    public static void registerUser(int user_id, String first_name, String last_name, String email, String user_type, int manager_id, String password)
    {
        db = new DBConnection();
        db.getConnection();
        try
        {
            
            PreparedStatement statement;
            String query = "INSERT INTO user(user_id, first_name, last_name, email, user_type, manager_id, password) VALUES('" + user_id + "','" + first_name  + "','" + last_name + "','" + email + "','" + user_type + "','" + "0" + "','" + password +"')";
            statement = db.getConnection().prepareStatement(query);
            statement.executeUpdate();
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Item> getAllItems()
    {
        db = new DBConnection();
        db.getConnection();
        ArrayList<Item> list = new ArrayList();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT i.item_id, i.item_name, i.item_qty, i.item_desc, i.item_details, o.org_id, o.org_name, o.password FROM inventory i, organization o WHERE i.org_id=o.org_id";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            while(rs.next())
            {
                list.add(new Item(rs.getInt("item_id"), rs.getString("item_name"), rs.getInt("item_qty"), rs.getString("item_desc"), rs.getString("item_details"), new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("password"))));
            }
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
     public static ArrayList<Item> getAllItems(int org_id)
    {
        db = new DBConnection();
        db.getConnection();
        ArrayList<Item> list = new ArrayList();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT i.item_id, i.item_name, i.item_qty, i.item_desc, i.item_details, o.org_id, o.org_name, o.password FROM inventory i, organization o WHERE i.org_id=o.org_id AND i.org_id = " + org_id;
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            while(rs.next())
            {
                list.add(new Item(rs.getInt("item_id"), rs.getString("item_name"), rs.getInt("item_qty"), rs.getString("item_desc"), rs.getString("item_details"), new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("password"))));
                String query2 = "SELECT * FROM orders WHERE item_id = " + rs.getInt("item_id");
                statement = db.getConnection().prepareStatement(query2);
                ResultSet rs2 = statement.executeQuery();
                while (rs2.next())
                {
                    User user = getUser(rs2.getString("buyer_id"));
                    Item item = getItem(rs2.getInt("item_id"));
                    System.out.println(rs2.getInt("order_qty"));
                    list.get(list.size() - 1).addOrder(new Order(user, item, rs2.getString("status"), rs2.getString("contact_no"), rs2.getString("order_id"), rs2.getInt("order_qty")));
                }
            }
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public static ArrayList<Organization> getAllOrgs()
    {
        db = new DBConnection();
        db.getConnection();
        ArrayList<Organization> list = new ArrayList();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT * FROM organization";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            while(rs.next())
            {
                list.add(new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("password")));
            }
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public static Item getItem(int id)
    {
        db = new DBConnection();
        db.getConnection();
        Item item = null;
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT i.item_id, i.item_name, i.item_qty, i.item_desc, i.item_details, o.org_id, o.org_name, o.password FROM inventory i, organization o WHERE i.org_id=o.org_id AND i.item_id = " + id;
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            if (rs.next())
            {
                item = new Item(rs.getInt("item_id"), rs.getString("item_name"), rs.getInt("item_qty"), rs.getString("item_desc"), rs.getString("item_details"), new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("password")));
            }
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return item;
    }
    
    public static void orderItem(String order_id, int user_id, int order_qty, int item_id)
    {
        db = new DBConnection();
        db.getConnection();
        try
        {
            PreparedStatement statement;
            String query = "INSERT INTO orders(order_id, buyer_id, order_qty, item_id, status) VALUES('" + order_id + "','" + user_id + "','" + order_qty  + "','" + item_id + "','" + "Pending" + "')";
            statement = db.getConnection().prepareStatement(query);
            statement.executeUpdate();
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Order> getAllOrders(String userID)
    {
        db = new DBConnection();
        db.getConnection();
        ArrayList<Order> orders = new ArrayList();
        try
        {
            PreparedStatement statement;
            ResultSet rs;
            String query = "SELECT * FROM orders WHERE buyer_id = '" + userID + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            while(rs.next())
            {
                User user = getUser(rs.getString("buyer_id"));
                Item item = getItem(rs.getInt("item_id"));
                orders.add(new Order(user, item, rs.getString("status"), rs.getString("contact_no"), rs.getString("order_id"), rs.getInt("order_qty")));
            }
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return orders;
    }
    
    public static ArrayList<Order> getAllOrgOrders(String itemID)
    {
        db = new DBConnection();
        db.getConnection();
        ArrayList<Order> orders = new ArrayList();
        try
        {
            PreparedStatement statement;
            ResultSet rs;
            String query = "SELECT * FROM orders WHERE item_id = '" + itemID + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            while(rs.next())
            {
                User user = getUser(rs.getString("buyer_id"));
                Item item = getItem(rs.getInt("item_id"));
                orders.add(new Order(user, item, rs.getString("status"), rs.getString("contact_no"), rs.getString("order_id"), rs.getInt("order_qty")));
            }
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return orders;
    }
    
}
