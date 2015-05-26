package com.smi.travel.datalayer.entity;
// Generated Dec 22, 2014 5:59:06 PM by Hibernate Tools 3.6.0


import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * AirticketPnr generated by hbm2java
 */
public class AirticketPnr {


     private String id;
     private MItemstatus MItemstatus;
     private AirticketBooking airticketBooking;
     private String pnr;
     private Set airticketAirlines = new LinkedHashSet(0);

    public AirticketPnr() {
        
    }

	
    public AirticketPnr(AirticketBooking airticketBooking, String pnr) {
        this.airticketBooking = airticketBooking;
        this.pnr = pnr;
    }
    public AirticketPnr(MItemstatus MItemstatus,AirticketBooking airticketBooking, String pnr, Set airticketAirlines) {
       this.MItemstatus = MItemstatus;
       this.airticketBooking = airticketBooking;
       this.pnr = pnr;
       this.airticketAirlines = airticketAirlines;
    }
   
    public String getId() {
        return this.id;
    }
    
    
    public void setId(String id) {
        this.id = id;
    }

    public MItemstatus getMItemstatus() {
        return MItemstatus;
    }

    public void setMItemstatus(MItemstatus MItemstatus) {
        this.MItemstatus = MItemstatus;
    }
    
    public AirticketBooking getAirticketBooking() {
        return this.airticketBooking;
    }
    
    public void setAirticketBooking(AirticketBooking airticketBooking) {
        this.airticketBooking = airticketBooking;
    }
    public String getPnr() {
        return this.pnr;
    }
    
    public void setPnr(String pnr) {
        this.pnr = pnr;
    }
    public Set getAirticketAirlines() {
        return this.airticketAirlines;
    }
    
    public void setAirticketAirlines(Set airticketAirlines) {
        this.airticketAirlines = airticketAirlines;
    }


}

