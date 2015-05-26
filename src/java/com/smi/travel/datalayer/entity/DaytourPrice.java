package com.smi.travel.datalayer.entity;
// Generated Mar 18, 2015 10:03:25 AM by Hibernate Tools 3.6.0



/**
 * DaytourPrice generated by hbm2java
 */
public class DaytourPrice   {

     private String id;
     private Daytour daytour;
     private MPricecategory MPricecategory;
     private String detail;
     private Integer price;
     private String currency;
     

    public DaytourPrice() {
    }

	
    public DaytourPrice(Daytour daytour, MPricecategory MPricecategory) {
        this.daytour = daytour;
        this.MPricecategory = MPricecategory;
    }
    public DaytourPrice(Daytour daytour, MPricecategory MPricecategory, String detail, Integer price, String currency) {
       this.daytour = daytour;
       this.MPricecategory = MPricecategory;
       this.detail = detail;
       this.price = price;
       this.currency = currency;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public Daytour getDaytour() {
        return this.daytour;
    }
    
    public void setDaytour(Daytour daytour) {
        this.daytour = daytour;
    }
    public MPricecategory getMPricecategory() {
        return this.MPricecategory;
    }
    
    public void setMPricecategory(MPricecategory MPricecategory) {
        this.MPricecategory = MPricecategory;
    }
    public String getDetail() {
        return this.detail;
    }
    
    public void setDetail(String detail) {
        this.detail = detail;
    }
    public Integer getPrice() {
        return this.price;
    }
    
    public void setPrice(Integer price) {
        this.price = price;
    }
    public String getCurrency() {
        return this.currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }

}

