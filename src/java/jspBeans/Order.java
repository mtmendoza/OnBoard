/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jspBeans;

/**
 *
 * @author Jolo Simeon
 */
public class Order
{
    private User user;
    private Item item;
    private String status;
    private String contactno;
    private String orderID;
    private int orderQty;

    public Order(User user, Item item, String status, String contactno, String orderID, int orderQty)
    {
        this.user = user;
        this.item = item;
        this.status = status;
        this.contactno = contactno;
        this.orderID = orderID;
        this.orderQty = orderQty;
    }

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public Item getItem()
    {
        return item;
    }

    public void setItem(Item item)
    {
        this.item = item;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getContactno()
    {
        return contactno;
    }

    public void setContactno(String contactno)
    {
        this.contactno = contactno;
    }

    public String getOrderID()
    {
        return orderID;
    }

    public void setOrderID(String orderID)
    {
        this.orderID = orderID;
    }

    public int getOrderQty()
    {
        return orderQty;
    }

    public void setOrderQty(int orderQty)
    {
        this.orderQty = orderQty;
    }
    
}
