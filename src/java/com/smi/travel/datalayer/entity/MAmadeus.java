package com.smi.travel.datalayer.entity;
// Generated Jan 8, 2015 5:09:22 PM by Hibernate Tools 3.6.0



/**
 * MAmadeus generated by hbm2java
 */
public class MAmadeus  {


     private String id;
     private String name;
     private String section;
     private String nodlm;
     private Integer startlength;
     private Integer length;

    public MAmadeus() {
    }

	
    public MAmadeus(String name) {
        this.name = name;
    }
    public MAmadeus(String name, String section, String nodlm, Integer startlength, Integer length) {
       this.name = name;
       this.section = section;
       this.nodlm = nodlm;
       this.startlength = startlength;
       this.length = length;
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
    public String getSection() {
        return this.section;
    }
    
    public void setSection(String section) {
        this.section = section;
    }
    public String getNodlm() {
        return this.nodlm;
    }
    
    public void setNodlm(String nodlm) {
        this.nodlm = nodlm;
    }
    public Integer getStartlength() {
        return this.startlength;
    }
    
    public void setStartlength(Integer startlength) {
        this.startlength = startlength;
    }
    public Integer getLength() {
        return this.length;
    }
    
    public void setLength(Integer length) {
        this.length = length;
    }




}

