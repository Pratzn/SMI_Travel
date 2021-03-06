/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.smi.travel.datalayer.dao;

import com.smi.travel.datalayer.entity.AirticketBooking;
import com.smi.travel.datalayer.entity.AirticketPnr;
import java.util.List;

/**
 *
 * @author Surachai
 */
public interface AirticketBookingDao {
    public AirticketBooking getBookDetailAir(String refno);
    public AirticketPnr getPNRDetail(String PNR,String refno);
    public AirticketPnr getPNRDetailByID(String PNRID,String refno);
    public int insertBookingAirTicket(AirticketBooking booking);
    public int updateBookingAirTicket(AirticketBooking booking);
    public int DeleteDesc(AirticketBooking booking ,String descId);
    public int getNumberOfFlight(String refno);
}
