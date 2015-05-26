/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.smi.travel.datalayer.service;

import com.smi.travel.datalayer.report.model.HotelVoucher;
import com.smi.travel.datalayer.report.model.LandVoucher;
import com.smi.travel.datalayer.view.dao.AgentCommissionReportDao;
import com.smi.travel.datalayer.view.dao.AirlineSummaryDao;
import com.smi.travel.datalayer.view.dao.GuideCommissionReportDao;
import com.smi.travel.datalayer.view.dao.GuideJobDao;
import com.smi.travel.datalayer.view.dao.HotelInboundDao;
import com.smi.travel.datalayer.view.dao.HotelVoucherDao;
import com.smi.travel.datalayer.view.dao.LandVoucherDao;
import com.smi.travel.datalayer.view.dao.StaffSummaryDao;
import com.smi.travel.datalayer.view.dao.TicketOrderDao;
import com.smi.travel.datalayer.view.dao.TicketSaleProfitVolumnDao;
import com.smi.travel.datalayer.view.dao.TicketSummaryDao;
import com.smi.travel.datalayer.view.dao.TransferJobReportDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Surachai
 */
public class ReportService {
    
    private HotelVoucherDao hotelVoucherdao;
    private HotelInboundDao hotelInboundDao;
    private LandVoucherDao landVoucherdao;
    private TicketOrderDao ticketOrderdao;
    private TicketSummaryDao ticketsummaryDao;
    private AirlineSummaryDao airlinesummaryDao;
    private StaffSummaryDao staffsummaryDao;
    private TicketSaleProfitVolumnDao ticketsaleprofitVolumnDao;
    private TransferJobReportDao transferJobReportdao;
    private GuideCommissionReportDao guideComissiondao;
    private GuideJobDao guideJobdao;
    private AgentCommissionReportDao agentCommissiondao;
    
    public List getHotelVoucher(String hotelID,String name) {
        List data  = new ArrayList();
        data.add(hotelVoucherdao.getHotelVoucher(hotelID,name));
        return data;
    }
    
    public List getTicketSaleVolumn(String ticketFrom,String ticketType,String startDate,String endDate){
        return ticketsaleprofitVolumnDao.getTicketSaleVolumn(ticketFrom, ticketType, startDate, endDate);
    }
    public List getTicketProfitVolumn(String ticketFrom,String ticketType,String startDate,String endDate){
        return ticketsaleprofitVolumnDao.getTicketProfitVolumn(ticketFrom, ticketType, startDate, endDate);
    }
    
    public List getStaffSummary(String ticketfrom, String tickettype, String startdate, String enddate, String username) {
        return staffsummaryDao.getStaffSummary(ticketfrom, tickettype, startdate, enddate, username);
    }
    
    public List getAirlineSummary(String ticketfrom,String tickettype,String startdate,String enddate,String username){
        return airlinesummaryDao.getAirlineSummary(ticketfrom, tickettype, startdate, enddate, username);
    }
    
    public List getTicketSummary(String ticketfrom,String tickettype,String startdate,String enddate,String billto,String  passenger,String username){
        return ticketsummaryDao.getTicketSummary(ticketfrom, tickettype, startdate, enddate, billto, passenger,username);
    }
    
    public List getHotelInboundVoucher(String hotelID){
        return hotelInboundDao.getHotelInboundVoucher(hotelID);
    }
    
    public List getLandVoucher(String refno,String name){
        List data  = new ArrayList();
        data.add(landVoucherdao.getLandVoucher(refno,name));
        return data;
    }
    
    public List getTicketOrde(String refno,String pnrID){
        List data  = new ArrayList();
        data.add(ticketOrderdao.getTicketOrder(refno,pnrID));
        return data;
    }
    
    public List getTransferJobReport(String docno){
        return transferJobReportdao.getTransferJobReport(docno);
    }
    
    public List getGuideComissionReport(String datefrom,String dateto,String username,String guideid){
        return guideComissiondao.getGuideComissionReport(datefrom, dateto, username,guideid);
    }
    
    public List getGuildJobReport(String tourdate,String tourID, String username){
        return guideJobdao.getGuildJobReport(tourdate, tourID, username);
    }
    
    public List getAgentCommissionReport(String datefrom,String dateto,String user,String agentid){
        List data  = new ArrayList();
        data.add(agentCommissiondao.getAgentCommissionReport(datefrom, dateto, user,agentid));
        return data;
    }
    
    public List getAgentCommissionReportSummary(String datefrom,String dateto,String user,String agentid){
        return agentCommissiondao.getAgentReportSummary(datefrom, dateto, user,agentid);
    }
    
    public List getAgentCommissionReportInfo(String datefrom,String dateto,String user,String agentid){
        return agentCommissiondao.getAgentReportInfo(datefrom, dateto, user,agentid);
    }

    public HotelVoucherDao getHotelVoucherdao() {
        return hotelVoucherdao;
    }

    public void setHotelVoucherdao(HotelVoucherDao hotelVoucherdao) {
        this.hotelVoucherdao = hotelVoucherdao;
    }

    public LandVoucherDao getLandVoucherdao() {
        return landVoucherdao;
    }

    public void setLandVoucherdao(LandVoucherDao landVoucherdao) {
        this.landVoucherdao = landVoucherdao;
    }

    public TicketOrderDao getTicketOrderdao() {
        return ticketOrderdao;
    }

    public void setTicketOrderdao(TicketOrderDao ticketOrderdao) {
        this.ticketOrderdao = ticketOrderdao;
    }

    public HotelInboundDao getHotelInboundDao() {
        return hotelInboundDao;
    }

    public void setHotelInboundDao(HotelInboundDao hotelInboundDao) {
        this.hotelInboundDao = hotelInboundDao;
    }

    public TicketSummaryDao getTicketsummaryDao() {
        return ticketsummaryDao;
    }

    public void setTicketsummaryDao(TicketSummaryDao ticketsummaryDao) {
        this.ticketsummaryDao = ticketsummaryDao;
    }

    public AirlineSummaryDao getAirlinesummaryDao() {
        return airlinesummaryDao;
    }

    public void setAirlinesummaryDao(AirlineSummaryDao airlinesummaryDao) {
        this.airlinesummaryDao = airlinesummaryDao;
    }

    public StaffSummaryDao getStaffsummaryDao() {
        return staffsummaryDao;
    }

    public void setStaffsummaryDao(StaffSummaryDao staffsummaryDao) {
        this.staffsummaryDao = staffsummaryDao;
    }

    public TicketSaleProfitVolumnDao getTicketsaleprofitVolumnDao() {
        return ticketsaleprofitVolumnDao;
    }

    public void setTicketsaleprofitVolumnDao(TicketSaleProfitVolumnDao ticketsaleprofitVolumnDao) {
        this.ticketsaleprofitVolumnDao = ticketsaleprofitVolumnDao;
    }

    public TransferJobReportDao getTransferJobReportdao() {
        return transferJobReportdao;
    }

    public void setTransferJobReportdao(TransferJobReportDao transferJobReportdao) {
        this.transferJobReportdao = transferJobReportdao;
    }

    public GuideCommissionReportDao getGuideComissiondao() {
        return guideComissiondao;
    }

    public void setGuideComissiondao(GuideCommissionReportDao guideComissiondao) {
        this.guideComissiondao = guideComissiondao;
    }

    public GuideJobDao getGuideJobdao() {
        return guideJobdao;
    }

    public void setGuideJobdao(GuideJobDao guideJobdao) {
        this.guideJobdao = guideJobdao;
    }

    public AgentCommissionReportDao getAgentCommissiondao() {
        return agentCommissiondao;
    }

    public void setAgentCommissiondao(AgentCommissionReportDao agentCommissiondao) {
        this.agentCommissiondao = agentCommissiondao;
    }
    
    

    
    
}