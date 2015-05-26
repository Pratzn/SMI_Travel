package com.smi.travel.datalayer.entity;
// Generated Dec 4, 2014 5:36:02 PM by Hibernate Tools 3.6.0

import java.util.HashSet;
import java.util.Set;




/**
 * MTicketType generated by hbm2java
 */
public class MTicketType  {


     private String id;
     private String code;
     private String name;
     private Set airticketFlights = new HashSet(0);

    public MTicketType() {
    }

    public MTicketType(String code, String name) {
       this.code = code;
       this.name = name;
    }
    
    public MTicketType(String code, String name, Set airticketFlights) {
       this.code = code;
       this.name = name;
       this.airticketFlights = airticketFlights;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }


    public Set getAirticketFlights() {
        return airticketFlights;
    }

    public void setAirticketFlights(Set airticketFlights) {
        this.airticketFlights = airticketFlights;
    }




}


