package com.smi.travel.datalayer.entity;
// Generated Mar 18, 2015 10:03:25 AM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * AgentTourComission generated by hbm2java
 */
public class AgentTourComission   {


     private String id;
     private AgentComission agentComission;
     private Daytour daytour;
     private Date from;
     private Date to;
     private Double comission;
     private String createBy;
     private String updateBy;

    public AgentTourComission() {
    }

    public AgentTourComission(AgentComission agentComission, Daytour daytour, Date from, Date to, Double comission, String createBy, String updateBy) {
       this.agentComission = agentComission;
       this.daytour = daytour;
       this.from = from;
       this.to = to;
       this.comission = comission;
       this.createBy = createBy;
       this.updateBy = updateBy;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public AgentComission getAgentComission() {
        return this.agentComission;
    }
    
    public void setAgentComission(AgentComission agentComission) {
        this.agentComission = agentComission;
    }
    public Daytour getDaytour() {
        return this.daytour;
    }
    
    public void setDaytour(Daytour daytour) {
        this.daytour = daytour;
    }
    public Date getFrom() {
        return this.from;
    }
    
    public void setFrom(Date from) {
        this.from = from;
    }
    public Date getTo() {
        return this.to;
    }
    
    public void setTo(Date to) {
        this.to = to;
    }
    public Double getComission() {
        return this.comission;
    }
    
    public void setComission(Double comission) {
        this.comission = comission;
    }
    public String getCreateBy() {
        return this.createBy;
    }
    
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    public String getUpdateBy() {
        return this.updateBy;
    }
    
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }




}


