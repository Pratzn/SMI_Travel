package com.smi.travel.datalayer.entity;
// Generated Jul 20, 2015 10:29:04 AM by Hibernate Tools 3.6.0



/**
 * MRunningCode generated by hbm2java
 */
public class MRunningCode  {


     private String id;
     private String type;
     private Integer running;

    public MRunningCode() {
    }

    public MRunningCode(String type, Integer running) {
       this.type = type;
       this.running = running;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    public Integer getRunning() {
        return this.running;
    }
    
    public void setRunning(Integer running) {
        this.running = running;
    }




}


