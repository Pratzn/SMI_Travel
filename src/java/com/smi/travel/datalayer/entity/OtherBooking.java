package com.smi.travel.datalayer.entity;
// Generated Jan 14, 2015 11:52:54 AM by Hibernate Tools 3.6.0


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * OtherBooking generated by hbm2java
 */
public class OtherBooking  {

     private String id;
     private Product product;
     private Master master;
     private Agent agent;
     private Long adCost;
     private Long adPrice;
     private Integer adQty;
     private Long chCost;
     private Long chPrice;
     private Integer chQty;
     private Long inCost;
     private Long inPrice;
     private Integer inQty;
     private Integer isBill;
     private MItemstatus status;
     private Date otherDate;
     private Date otherTime;
     private Date createDate;
     private String updateBy;
     private Date updateDate;
     private Date cancelDate;
     private String createBy;
     private String remark;
     private String currency;
     private Set coupons = new HashSet(0);

    public OtherBooking() {
        
    }

	
    public OtherBooking(Product product, Master master, MItemstatus status) {
        this.product = product;
        this.master = master;
        this.status = status;
    }
    public OtherBooking(Product product, Master master,Agent agent, Long adCost, Long adPrice, Integer adQty, Long chCost, Long chPrice, Integer chQty, Long inCost, Long inPrice, Integer inQty,Integer isBill, MItemstatus status, Date otherDate, Date otherTime, Date createDate, String updateBy, Date updateDate, String createBy, String remark,String currency,Date cancelDate,Set coupons) {
       this.product = product;
       this.master = master;
       this.agent = agent;
       this.adCost = adCost;
       this.adPrice = adPrice;
       this.adQty = adQty;
       this.chCost = chCost;
       this.chPrice = chPrice;
       this.chQty = chQty;
       this.inCost = inCost;
       this.inPrice = inPrice;
       this.inQty = inQty;
       this.isBill = isBill;
       this.status = status;
       this.otherDate = otherDate;
       this.otherTime = otherTime;
       this.createDate = createDate;
       this.updateBy = updateBy;
       this.updateDate = updateDate;
       this.createBy = createBy;
       this.remark = remark;
       this.currency = currency;
       this.cancelDate = cancelDate;
       this.coupons = coupons;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    public Master getMaster() {
        return this.master;
    }
    
    public void setMaster(Master master) {
        this.master = master;
    }
    public Long getAdCost() {
        return this.adCost;
    }
    
    public void setAdCost(Long adCost) {
        this.adCost = adCost;
    }
    public Long getAdPrice() {
        return this.adPrice;
    }
    
    public void setAdPrice(Long adPrice) {
        this.adPrice = adPrice;
    }
    public Integer getAdQty() {
        return this.adQty;
    }
    
    public void setAdQty(Integer adQty) {
        this.adQty = adQty;
    }
    public Long getChCost() {
        return this.chCost;
    }
    
    public void setChCost(Long chCost) {
        this.chCost = chCost;
    }
    public Long getChPrice() {
        return this.chPrice;
    }
    
    public void setChPrice(Long chPrice) {
        this.chPrice = chPrice;
    }
    public Integer getChQty() {
        return this.chQty;
    }
    
    public void setChQty(Integer chQty) {
        this.chQty = chQty;
    }
    public Long getInCost() {
        return this.inCost;
    }
    
    public void setInCost(Long inCost) {
        this.inCost = inCost;
    }
    public Long getInPrice() {
        return this.inPrice;
    }
    
    public void setInPrice(Long inPrice) {
        this.inPrice = inPrice;
    }
    public Integer getInQty() {
        return this.inQty;
    }
    
    public void setInQty(Integer inQty) {
        this.inQty = inQty;
    }

    public MItemstatus getStatus() {
        return status;
    }

    public void setStatus(MItemstatus status) {
        this.status = status;
    }
    
    
    
    public Date getOtherDate() {
        return this.otherDate;
    }
    
    public void setOtherDate(Date otherDate) {
        this.otherDate = otherDate;
    }
    public Date getOtherTime() {
        return this.otherTime;
    }
    
    public void setOtherTime(Date otherTime) {
        this.otherTime = otherTime;
    }
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public String getUpdateBy() {
        return this.updateBy;
    }
    
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }
    
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public String getCreateBy() {
        return this.createBy;
    }
    
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Agent getAgent() {
        return agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
    }

    public Date getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }

    public Integer getIsBill() {
        return isBill;
    }

    public void setIsBill(Integer isBill) {
        this.isBill = isBill;
    }

    public Set getCoupons() {
        return coupons;
    }

    public void setCoupons(Set coupons) {
        this.coupons = coupons;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

   
    



}

