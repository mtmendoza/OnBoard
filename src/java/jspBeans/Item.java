package jspBeans;

public class Item
{
    private String item_id;
    private String item_name;
    private int item_qty;
    private String item_desc;
    private Organization org;

    public Item(String item_id, String item_name, int item_qty, String item_desc, Organization org)
    {
        this.item_id = item_id;
        this.item_name = item_name;
        this.item_qty = item_qty;
        this.item_desc = item_desc;
        this.org = org;
    }

    public String getItem_id()
    {
        return item_id;
    }

    public void setItem_id(String item_id)
    {
        this.item_id = item_id;
    }

    public String getItem_name()
    {
        return item_name;
    }

    public void setItem_name(String item_name)
    {
        this.item_name = item_name;
    }

    public int getItem_qty()
    {
        return item_qty;
    }

    public void setItem_qty(int item_qty)
    {
        this.item_qty = item_qty;
    }

    public String getItem_desc()
    {
        return item_desc;
    }

    public void setItem_desc(String item_desc)
    {
        this.item_desc = item_desc;
    }

    public Organization getOrg()
    {
        return org;
    }

    public void setOrg(Organization org)
    {
        this.org = org;
    }
    
    
}
