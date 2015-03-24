package jspBeans;

public class Organization
{
    private int org_id;
    private String org_name;
    private String org_password;
    
    public Organization(int org_id, String org_name, String org_password)
    {
        this.org_id = org_id;
        this.org_name = org_name;
        this.org_password = org_password;
    }

    public int getOrg_id()
    {
        return org_id;
    }

    public void setOrg_id(int org_id)
    {
        this.org_id = org_id;
    }

    public String getOrg_name()
    {
        return org_name;
    }

    public void setOrg_name(String org_name)
    {
        this.org_name = org_name;
    }

    public String getOrg_password()
    {
        return org_password;
    }

    public void setOrg_password(String org_password)
    {
        this.org_password = org_password;
    }
    
    
}
