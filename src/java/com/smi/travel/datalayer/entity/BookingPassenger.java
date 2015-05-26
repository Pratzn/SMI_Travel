package com.smi.travel.datalayer.entity;
// Generated Dec 17, 2014 3:54:36 PM by Hibernate Tools 3.6.0



/**
 * BookingPassenger generated by hbm2java
 */
public class BookingPassenger  {


     private String id;
     private BookingAirline bookingAirline;
     private String ticketnoS1;
     private String ticketnoS2;
     private String ticketnoS3;
     private String initialName;
     private String firstName;
     private String lastName;
     private String passengerType;
     private Integer ticketTax;
     private Integer ticketFare;
     private String ticketType;

    public BookingPassenger() {
    }

	
    public BookingPassenger(String ticketnoS1, String initialName, String firstName, String lastName, String passengerType, String ticketType) {
        this.ticketnoS1 = ticketnoS1;
        this.initialName = initialName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.passengerType = passengerType;
        this.ticketType = ticketType;
    }
    public BookingPassenger(BookingAirline bookingAirline, String ticketnoS1, String ticketnoS2, String ticketnoS3, String initialName, String firstName, String lastName, String passengerType , Integer ticketTax, Integer ticketFare, String ticketType) {
       this.bookingAirline = bookingAirline;
       this.ticketnoS1 = ticketnoS1;
       this.ticketnoS2 = ticketnoS2;
       this.ticketnoS3 = ticketnoS3;
       this.initialName = initialName;
       this.firstName = firstName;
       this.lastName = lastName;
       this.passengerType = passengerType;
       this.ticketFare = ticketFare;
       this.ticketTax = ticketTax;
       this.ticketType = ticketType;
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
    public String getTicketnoS1() {
        return this.ticketnoS1;
    }
    
    public void setTicketnoS1(String ticketnoS1) {
        this.ticketnoS1 = ticketnoS1;
    }
    public String getTicketnoS2() {
        return this.ticketnoS2;
    }
    
    public void setTicketnoS2(String ticketnoS2) {
        this.ticketnoS2 = ticketnoS2;
    }
    public String getTicketnoS3() {
        return this.ticketnoS3;
    }
    
    public void setTicketnoS3(String ticketnoS3) {
        this.ticketnoS3 = ticketnoS3;
    }
    public String getInitialName() {
        return this.initialName;
    }
    
    public void setInitialName(String initialName) {
        this.initialName = initialName;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getPassengerType() {
        return this.passengerType;
    }
    
    public void setPassengerType(String passengerType) {
        this.passengerType = passengerType;
    }
    
    public Integer getTicketTax() {
        return this.ticketTax;
    }
    
    public void setTicketTax(Integer ticketTax) {
        this.ticketTax = ticketTax;
    }
    
    public String getTicketType() {
        return this.ticketType;
    }
    
    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public Integer getTicketFare() {
        return ticketFare;
    }

    public void setTicketFare(Integer ticketFare) {
        this.ticketFare = ticketFare;
    }

}


