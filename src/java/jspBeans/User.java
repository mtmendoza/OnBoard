package jspBeans;

import java.util.ArrayList;

public class User
{
    private int user_id;
    private String first_name;
    private String last_name;
    private String email;
    private String user_type;
    private int manager_id;
    private String password;
    private ArrayList<Organization> orgsManaged;

    public User(int user_id, String first_name, String last_name, String email, String user_type, int manager_id, String password)
    {
        this.user_id = user_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.user_type = user_type;
        this.manager_id = manager_id;
        this.password = password;
        orgsManaged = new ArrayList<>();
    }
    
    public int getUser_id()
    {
        return user_id;
    }

    public void setUser_id(int user_id)
    {
        this.user_id = user_id;
    }

    public String getFirst_name()
    {
        return first_name;
    }

    public void setFirst_name(String first_name)
    {
        this.first_name = first_name;
    }

    public String getLast_name()
    {
        return last_name;
    }

    public void setLast_name(String last_name)
    {
        this.last_name = last_name;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getUser_type()
    {
        return user_type;
    }

    public void setUser_type(String user_type)
    {
        this.user_type = user_type;
    }

    public int getManager_id()
    {
        return manager_id;
    }

    public void setManager_id(int manager_id)
    {
        this.manager_id = manager_id;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public ArrayList<Organization> getOrgsManaged()
    {
        return orgsManaged;
    }

    public void setOrgsManaged(ArrayList<Organization> orgsManaged)
    {
        this.orgsManaged = orgsManaged;
    }
    
    public void addOrg(Organization o)
    {
        orgsManaged.add(o);
    }
    
}

