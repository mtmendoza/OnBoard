package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import jspBeans.Item;
import jspBeans.Notification;
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
                query = "SELECT o.org_id, org_name, password FROM manager m, organization o WHERE m.manager_id = '" + user.getManager_id() + "' AND o.org_id = m.org_id";
                statement = db.getConnection().prepareStatement(query);
                rs = statement.executeQuery();
                while (rs.next())
                {
                    user.addOrg(new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("password")));
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
                query = "SELECT o.org_id, o.org_name, o.password FROM manager m, organization o WHERE m.manager_id = '" + user.getManager_id() + "' AND o.org_id = m.org_id";
                statement = db.getConnection().prepareStatement(query);
                rs = statement.executeQuery();
                while (rs.next())
                {
                    user.addOrg(new Organization(rs.getInt("org_id"), rs.getString("org_name"), rs.getString("password")));
                }
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
    
    public static Organization getOrg(String org_id)
    {
        Organization org = null;
        db = new DBConnection();
        db.getConnection();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT * FROM organization WHERE org_id = '" + org_id + "'";
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
                db = new DBConnection();
                Statement statement2 = db.getConnection().createStatement();
                ResultSet rs2 = statement2.executeQuery(query2);
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
    
    public static ArrayList<Item> getAllItems(int org_id, String search)
    {
        db = new DBConnection();
        ArrayList<Item> list = new ArrayList();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT i.item_id, i.item_name, i.item_qty, i.item_desc, i.item_details, o.org_id, o.org_name, o.password FROM inventory i, organization o WHERE i.org_id=o.org_id AND i.org_id = " + org_id +  " AND (i.item_name LIKE '%" + search +"%' OR item_desc LIKE '%" + search + "%')";
            if (org_id == 0 && search.equals(""))
            	query = "SELECT i.item_id, i.item_name, i.item_qty, i.item_desc, i.item_details, o.org_id, o.org_name, o.password FROM inventory i, organization o WHERE i.org_id=o.org_id";
            else if (search.equals(""))
            	query = "SELECT i.item_id, i.item_name, i.item_qty, i.item_desc, i.item_details, o.org_id, o.org_name, o.password FROM inventory i, organization o WHERE i.org_id=o.org_id AND i.org_id = " + org_id;
            else if (org_id == 0)
            	query = "SELECT i.item_id, i.item_name, i.item_qty, i.item_desc, i.item_details, o.org_id, o.org_name, o.password FROM inventory i, organization o WHERE i.org_id=o.org_id AND (i.item_name LIKE '%" + search +"%' OR item_desc LIKE '%" + search + "%')";
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
        ArrayList<Organization> list = new ArrayList();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT * FROM organization ORDER BY org_name ASC";
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
    
    public static void orderItem(String order_id, int user_id, int order_qty, int item_id, String contact)
    {
        db = new DBConnection();
        db.getConnection();
        try
        {
            PreparedStatement statement;
            String query = "INSERT INTO orders(order_id, buyer_id, order_qty, item_id, status, contact_no) VALUES('" + order_id + "','" + user_id + "','" + order_qty  + "','" + item_id + "','" + "Pending" + "','" + contact + "')";
            statement = db.getConnection().prepareStatement(query);
            statement.executeUpdate();
            
            query = "UPDATE inventory SET item_qty = item_qty - " + order_qty + " WHERE item_id = " + item_id;
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
    
    public static Order getOrder(String orderID)
    {
        db = new DBConnection();
        Order order = null;
        try
        {
            PreparedStatement statement;
            ResultSet rs;
            String query = "SELECT * FROM orders WHERE order_id = '" + orderID + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            rs.next();
            User user = getUser(rs.getString("buyer_id"));
            Item item = getItem(rs.getInt("item_id"));
            order = new Order(user, item, rs.getString("status"), rs.getString("contact_no"), rs.getString("order_id"), rs.getInt("order_qty"));
        }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return order;
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
    
    public static void addItem (Item i)
    {
    	 db = new DBConnection();
    	 try
         {
             PreparedStatement statement;
             String query = "INSERT INTO inventory (item_name, item_qty, item_desc, item_details, org_id, category_id) VALUES ('" + i.getItem_name() + "','"  + i.getItem_qty() + "','" + i.getItem_desc() + "','" + i.getItem_details() + "','" + i.getOrg().getOrg_id() + "','" + "0');";
             statement = db.getConnection().prepareStatement(query);
             statement.executeUpdate();

         }
         catch (Exception e)
         {
             e.printStackTrace();
         }
    }
    
    public static void setManagerID(int manager_id, int userID)
	{
    	db = new DBConnection();
		try
		{
			String sql = "UPDATE user SET manager_id = '" + manager_id + "' WHERE user_id = '" + userID + "';";
			PreparedStatement statement = db.getConnection().prepareStatement(sql);
			statement.executeUpdate(sql);
		} 
		catch (Exception e)
		{
			e.getMessage();
		}	
	}
    
    public static int getLastManagerID()
	{
    	db = new DBConnection();
		ResultSet rs = null;
		int id = -1;
		try
		{
			String sql = "SELECT MAX(manager_id) AS manager_id FROM manager;";
			PreparedStatement statement = db.getConnection().prepareStatement(sql);
			rs = statement.executeQuery(sql);
			rs.next();
			id = rs.getInt("manager_id");
			if (rs.wasNull())
				return -1;
		} 
		catch (Exception e)
		{
			e.getMessage();
		}
		return id;
	}
    
    public static ArrayList<User> getAdmins(int orgID)
    {
    	db = new DBConnection();
    	ArrayList<User> managers = new ArrayList<User>();
   	 	try
        {
	    	ResultSet rs;
	        PreparedStatement statement;
	        String query = "SELECT DISTINCT user_id FROM user u, manager m WHERE u.manager_id = m.manager_id AND m.org_id = " + orgID;
	        statement = db.getConnection().prepareStatement(query);
	        rs = statement.executeQuery();
	        
	        while (rs.next())
	        	managers.add(getUser(rs.getString("user_id")));
        }
	     catch (Exception e)
	     {
	    	 e.printStackTrace();
	     }
   	 	return managers;
    }
    
    public static void addAdminTo (int orgID, int userID)
    {
    	 db = new DBConnection();
    	 try
         {
    		 User user = getUser(String.valueOf(userID));
    		 int id = user.getManager_id();
    		 if (id == 0)
    		 {
    			 id = getLastManagerID() + 1;
    			 if (id == -1)
    				 id = 150001;
    			 setManagerID(id, userID);
    		 }
    		 
    		 PreparedStatement statement;
             String query = "INSERT INTO manager (manager_id, org_id) VALUES ('" + id + "','"  + orgID + "');";
             statement = db.getConnection().prepareStatement(query);
             statement.executeUpdate();

         }
         catch (Exception e)
         {
             e.printStackTrace();
         }
    }
    
    public static void revokeAdmin (int userID, int orgID)
    {
    	db = new DBConnection();
   	    try
        {
	   		 User user = getUser(String.valueOf(userID));
	   		 int id = user.getManager_id();
	   		 
	   		 PreparedStatement statement;
	         String query = "DELETE FROM manager WHERE manager_id = '" + id + "' AND org_id ='"  + orgID + "';";
	         statement = db.getConnection().prepareStatement(query);
	         statement.executeUpdate();
	         
	         ResultSet rs;
	         query = "SELECT COUNT(manager_id) AS manager_count FROM manager WHERE manager_id = '" + id + "';";
	         statement = db.getConnection().prepareStatement(query);
	         rs = statement.executeQuery();
	         rs.next();
	         if (rs.getInt("manager_count") == 0)
	        	 setManagerID(0, userID);

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public static void sendMessage(int senderID, int receiverID, String message)
    {
    	db = new DBConnection();
		try
		{
			String sql = "INSERT INTO notification (sender_id, receiver_id, message) VALUES ('" + senderID + "','"  + receiverID + "','" + message +"';";
			PreparedStatement statement = db.getConnection().prepareStatement(sql);
			statement.executeUpdate(sql);
		} 
		catch (Exception e)
		{
			e.getMessage();
		}
    }
    
    
    public static ArrayList<Notification> getMessages(int senderID)
    {
    	ArrayList<Notification> msgs = new ArrayList();
        db = new DBConnection();
        try
        {
            ResultSet rs;
            PreparedStatement statement;
            String query = "SELECT * FROM notification WHERE sender_id = '" + senderID + "' OR receiver_id = '" + senderID + "'";
            statement = db.getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            
            while (rs.next()) {
            	User user;
            	Organization org;
            	
            	user = getUser(rs.getString("sender_id"));
            	if (user != null) {
            		org = getOrg(rs.getString("receiver_id"));
            		msgs.add(new Notification(user, org, rs.getString("message"), rs.getString("title")));
            	}
            	else {
            		org = getOrg(rs.getString("sender_id"));
            		user = getUser(rs.getString("receiver_id"));
            		msgs.add(new Notification(org, user, rs.getString("message"), rs.getString("title")));
            	}
            		
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    	return msgs;
    }
    
    public static void deleteOrder(String order_id) {
    	db = new DBConnection();
    	db.getConnection();
		try
		{
			Order order = getOrder(order_id);
			String sql = "DELETE FROM orders WHERE order_id = '" + order_id + "';";
			PreparedStatement statement = db.getConnection().prepareStatement(sql);
			statement.executeUpdate(sql);
			
			sql = "UPDATE inventory SET item_qty = item_qty + " + order.getOrderQty() + " WHERE item_id = " + order.getItem().getItem_id() + ";";
			statement = db.getConnection().prepareStatement(sql);
			statement.executeUpdate(sql);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
    }
    
    public static void setOrderStatus(String order_id, String status) {
    	db = new DBConnection();
		try
		{
			String sql = "UPDATE orders SET status = '" + status + "' WHERE order_id = '" + order_id + "';";
			PreparedStatement statement = db.getConnection().prepareStatement(sql);
			statement.executeUpdate(sql);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
    }
    
}
