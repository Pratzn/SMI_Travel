package com.smi.travel.datalayer.entity;
// Generated Dec 17, 2014 3:54:36 PM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * BookingFlight generated by hbm2java
 */
public class BookingFlight  {


     private String id;
     private BookingAirline bookingAirline;
     private String flightNo;
     private String sourceCode;
     private String desCode;
     private Date departureDate;
     private Date arrivalDate;
     private String flightClass;
     private String departTime;
     private String arriveTime;
     private Integer adCost;
     private Integer adPrice;
     private Integer adTax;
     private Integer chCost;
     private Integer chPrice;
     private Integer chTax;
     private Integer inCost;
     private Integer inPrice;
     private Integer inTax;
     private Integer otCost;
     private Integer otPrice;
     private Integer otTax;

    public BookingFlight() {
    }

	
    public BookingFlight(String flightNo, String sourceCode, String desCode, Date departureDate, Date arrivalDate, String flightClass) {
        this.flightNo = flightNo;
        this.sourceCode = sourceCode;
        this.desCode = desCode;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.flightClass = flightClass;
    }
    public BookingFlight(BookingAirline bookingAirline, String flightNo, String sourceCode, String desCode, Date departureDate, Date arrivalDate, String flightClass, String departTime, String arriveTime, Integer adCost, Integer adPrice, Integer adTax, Integer chCost, Integer chPrice, Integer chTax, Integer inCost, Integer inPrice, Integer inTax) {
       this.bookingAirline = bookingAirline;
       this.flightNo = flightNo;
       this.sourceCode = sourceCode;
       this.desCode = desCode;
       this.departureDate = departureDate;
       this.arrivalDate = arrivalDate;
       this.flightClass = flightClass;
       this.departTime = departTime;
       this.arriveTime = arriveTime;
       this.adCost = adCost;
       this.adPrice = adPrice;
       this.adTax = adTax;
       this.chCost = chCost;
       this.chPrice = chPrice;
       this.chTax = chTax;
       this.inCost = inCost;
       this.inPrice = inPrice;
       this.inTax = inTax;
       this.otCost = otCost;
       this.otPrice = otPrice;
       this.otTax = otTax;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public BookingAirline getBookingAirline() {
        return this.bookingAirline;
    }
    
    public void setBookingAirline(BookingAirline bookingAirline) {
        this.bookingAirline = bookingAirline;
    }
    public String getFlightNo() {
        return this.flightNo;
    }
    
    public void setFlightNo(String flightNo) {
        this.flightNo = flightNo;
    }
    public String getSourceCode() {
        return this.sourceCode;
    }
    
    public void setSourceCode(String sourceCode) {
        this.sourceCode = sourceCode;
    }
    public String getDesCode() {
        return this.desCode;
    }
    
    public void setDesCode(String desCode) {
        this.desCode = desCode;
    }
    public Date getDepartureDate() {
        return this.departureDate;
    }
    
    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }
    public Date getArrivalDate() {
        return this.arrivalDate;
    }
    
    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }
    public String getFlightClass() {
        return this.flightClass;
    }
    
    public void setFlightClass(String flightClass) {
        this.flightClass = flightClass;
    }
    public String getDepartTime() {
        return this.departTime;
    }
    
    public void setDepartTime(String departTime) {
        this.departTime = departTime;
    }
    public String getArriveTime() {
        return this.arriveTime;
    }
    
    public void setArriveTime(String arriveTime) {
        this.arriveTime = arriveTime;
    }
    public Integer getAdCost() {
        return this.adCost;
    }
    
    public void setAdCost(Integer adCost) {
        this.adCost = adCost;
    }
    public Integer getAdPrice() {
        return this.adPrice;
    }
    
    public void setAdPrice(Integer adPrice) {
        this.adPrice = adPrice;
    }
    public Integer getAdTax() {
        return this.adTax;
    }
    
    public void setAdTax(Integer adTax) {
        this.adTax = adTax;
    }
    public Integer getChCost() {
        return this.chCost;
    }
    
    public void setChCost(Integer chCost) {
        this.chCost = chCost;
    }
    public Integer getChPrice() {
        return this.chPrice;
    }
    
    public void setChPrice(Integer chPrice) {
        this.chPrice = chPrice;
    }
    public Integer getChTax() {
        return this.chTax;
    }
    
    public void setChTax(Integer chTax) {
        this.chTax = chTax;
    }
    public Integer getInCost() {
        return this.inCost;
    }
    
    public void setInCost(Integer inCost) {
        this.inCost = inCost;
    }
    public Integer getInPrice() {
        return this.inPrice;
    }
    
    public void setInPrice(Integer inPrice) {
        this.inPrice = inPrice;
    }
    public Integer getInTax() {
        return this.inTax;
    }
    
    public void setInTax(Integer inTax) {
        this.inTax = inTax;
    }

    public Integer getOtCost() {
        return otCost;
    }

    public void setOtCost(Integer otCost) {
        this.otCost = otCost;
    }

    public Integer getOtPrice() {
        return otPrice;
    }

    public void setOtPrice(Integer otPrice) {
        this.otPrice = otPrice;
    }

    public Integer getOtTax() {
        return otTax;
    }

    public void setOtTax(Integer otTax) {
        this.otTax = otTax;
    }



}


