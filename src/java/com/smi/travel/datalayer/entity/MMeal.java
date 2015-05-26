package com.smi.travel.datalayer.entity;
// Generated Jan 14, 2015 11:52:54 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * MMeal generated by hbm2java
 */
public class MMeal  {


     private String id;
     private String name;
     private Set hotelBookings = new HashSet(0);

    public MMeal() {
    }

	
    public MMeal(String name) {
        this.name = name;
    }
    public MMeal(String name, Set hotelBookings) {
       this.name = name;
       this.hotelBookings = hotelBookings;
    }
   
    public String getId() {
        return this.id;
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
    public Set getHotelBookings() {
        return this.hotelBookings;
    }
    
    public void setHotelBookings(Set hotelBookings) {
        this.hotelBookings = hotelBookings;
    }




}


