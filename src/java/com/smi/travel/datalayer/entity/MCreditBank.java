package com.smi.travel.datalayer.entity;
// Generated Jul 20, 2015 5:52:41 PM by Hibernate Tools 4.3.1


import java.util.LinkedList;
import java.util.List;

/**
 * MCreditBank generated by hbm2java
 */
public class MCreditBank {


     private String id;
     private String name;
     private List receiptCredits = new LinkedList<ReceiptCredit>();

    public MCreditBank() {
    }

    public MCreditBank(String name, List receiptCredits) {
       this.name = name;
       this.receiptCredits = receiptCredits;
    }
   
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public List getReceiptCredits() {
        return receiptCredits;
    }

    public void setReceiptCredits(List receiptCredits) {
        this.receiptCredits = receiptCredits;
    }





}

