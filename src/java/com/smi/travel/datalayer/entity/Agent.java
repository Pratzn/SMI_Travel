package com.smi.travel.datalayer.entity;
// Generated Dec 22, 2014 5:59:06 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Agent generated by hbm2java
 */
public class Agent   {

     private String id;
     private MAccterm MAccterm;
     private MAccpay MAccpay;
     private MBranch MBranch;
     private String code;
     private String name;
     private String address;
     private String tel;
     private String fax;
     private String taxNo;
     private String email;
     private String remark;
     private String warning;
     private String branchNo;
     private String web;
     private String Detail;
     private Set masters = new HashSet(0);

    public Agent() {
    }

	
   public Agent(String code, String name) {
        this.code = code;
        this.name = name;
    }
    public Agent(MAccterm MAccterm,MAccpay MAccpay, MBranch MBranch, String code, String name, String address, String tel, String fax, String taxNo, String email, String remark, String warning, String branchNo, String web , Set masters,String Detail) {
       this.MAccterm = MAccterm;
       this.MAccpay = MAccpay;
       this.MBranch = MBranch;
       this.code = code;
       this.name = name;
       this.address = address;
       this.tel = tel;
       this.fax = fax;
       this.taxNo = taxNo;
       this.email = email;
       this.remark = remark;
       this.warning = warning;
       this.branchNo = branchNo;
       this.web = web;
       this.masters = masters;
       this.Detail = Detail;
    }
   
    public String getId() {
        return this.id;
    }

    public MAccpay getMAccpay() {
        return MAccpay;
    }

    public void setMAccpay(MAccpay MAccpay) {
        this.MAccpay = MAccpay;
    }
    

    public void setId(String id) {
        this.id = id;
    }
    public MAccterm getMAccterm() {
        return this.MAccterm;
    }
    
    public void setMAccterm(MAccterm MAccterm) {
        this.MAccterm = MAccterm;
    }
    public MBranch getMBranch() {
        return this.MBranch;
    }
    
    public void setMBranch(MBranch MBranch) {
        this.MBranch = MBranch;
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
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getFax() {
        return this.fax;
    }
    
    public void setFax(String fax) {
        this.fax = fax;
    }
    public String getTaxNo() {
        return this.taxNo;
    }
    
    public void setTaxNo(String taxNo) {
        this.taxNo = taxNo;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public String getWarning() {
        return this.warning;
    }
    
    public void setWarning(String warning) {
        this.warning = warning;
    }
    public String getBranchNo() {
        return this.branchNo;
    }
    
    public void setBranchNo(String branchNo) {
        this.branchNo = branchNo;
    }
    public String getWeb() {
        return this.web;
    }
    
    public void setWeb(String web) {
        this.web = web;
    }

    public Set getMasters() {
        return this.masters;
    }
    
    public void setMasters(Set masters) {
        this.masters = masters;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }
    
    




}

