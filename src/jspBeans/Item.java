package jspBeans;

import java.util.ArrayList;

public class Item
{
    private int item_id;
    private String item_name;
    private int item_qty;
    private String item_desc;
    private String item_details;
    private Organization org;
    private ArrayList<Order> itemOrders;
    private int totalOrders;

    public Item(int item_id, String item_name, int item_qty, String item_desc, String item_details, Organization org)
    {
        this.item_id = item_id;
        this.item_name = item_name;
        this.item_qty = item_qty;
        this.item_desc = item_desc;
        this.item_details = item_details;
        this.org = org;
        totalOrders = 0;
        itemOrders = new ArrayList();
    }

    public int getItem_id()
    {
        return item_id;
    }

    public void setItem_id(int item_id)
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

    public String getItem_details()
    {
        return item_details;
    }

    public void setItem_details(String item_details)
    {
        this.item_details = item_details;
    }

    public Organization getOrg()
    {
        return org;
    }

    public void setOrg(Organization org)
    {
        this.org = org;
    }
    
    public void addOrder(Order o)
    {
        itemOrders.add(o);
        totalOrders += o.getOrderQty();
    }
    
    public void removeOrder(Order o)
    {
        totalOrders -= o.getOrderQty();
        itemOrders.remove(o);
    }

    public ArrayList<Order> getItemOrders()
    {
        return itemOrders;
    }

    public void setItemOrders(ArrayList<Order> itemOrders)
    {
        this.itemOrders = itemOrders;
    }

    public int getTotalOrders()
    {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders)
    {
        this.totalOrders = totalOrders;
    }
    
    
    
    
    
    
}
