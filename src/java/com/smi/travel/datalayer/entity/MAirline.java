package com.smi.travel.datalayer.entity;
// Generated Dec 4, 2014 5:36:02 PM by Hibernate Tools 3.6.0



/**
 * MAirline generated by hbm2java
 */
public class MAirline {


     private String id;
     private String code;
     private String name;
     private String code3Letter;

    public MAirline() {
    }

	
    public MAirline(String code, String name) {
        this.code = code;
        this.name = name;
    }
    public MAirline(String code, String name, String code3Letter) {
       this.code = code;
       this.name = name;
       this.code3Letter = code3Letter;
    }

    public String getId() {
        return id;
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
    public String getCode3Letter() {
        return this.code3Letter;
    }
    
    public void setCode3Letter(String code3Letter) {
        this.code3Letter = code3Letter;
    }




}

