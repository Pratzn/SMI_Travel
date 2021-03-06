package com.smi.travel.datalayer.entity;
// Generated Jun 12, 2015 2:11:44 PM by Hibernate Tools 3.6.0



/**
 * MBank generated by hbm2java
 */
public class MBank  {


     private String id;
     private String code;
     private String name;
     private String branch;
     private String accNo;
     private Integer accType;

    public MBank() {
    }

	
    public MBank(String code, String name, String branch, String accNo) {
        this.code = code;
        this.name = name;
        this.branch = branch;
        this.accNo = accNo;
    }
    public MBank(String code, String name, String branch, String accNo, Integer accType) {
       this.code = code;
       this.name = name;
       this.branch = branch;
       this.accNo = accNo;
       this.accType = accType;
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
    public String getBranch() {
        return this.branch;
    }
    
    public void setBranch(String branch) {
        this.branch = branch;
    }
    
    public Integer getAccType() {
        return this.accType;
    }
    
    public void setAccType(Integer accType) {
        this.accType = accType;
    }

    /**
     * @return the accNo
     */
    public String getAccNo() {
        return this.accNo;
    }

    /**
     * @param accNo
     */
    public void setAccNo(String accNo) {
        this.accNo = accNo;
    }




}


