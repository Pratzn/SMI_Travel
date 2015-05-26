/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.smi.travel.datalayer.dao.impl;

import com.smi.travel.datalayer.dao.BillableDao;
import com.smi.travel.datalayer.entity.AirticketAirline;
import com.smi.travel.datalayer.entity.AirticketBooking;
import com.smi.travel.datalayer.entity.Billable;
import com.smi.travel.datalayer.entity.BillableDesc;
import com.smi.travel.datalayer.entity.Master;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Surachai
 */
public class BillableImpl implements BillableDao {

    private SessionFactory sessionFactory;
    private Transaction transaction;
    private static final String BillQuery = "from Billable B where B.master.referenceNo =:refno ";
    private static final String OtherBookingUpdate = "UPDATE OtherBooking other set  other.isBill = 1 "
            + "WHERE other.master.id = :masterid";
    private static final String LandBookingUpdate = "UPDATE LandBooking land set  land.isBill = 1 "
            + "WHERE land.master.id = :masterid";
    private static final String AirBookingUpdate = "UPDATE AirticketFlight air set  air.isBill = 1 "
            + "WHERE air.airticketAirline.id in ";
    private static final String SelectAirLineId = "FROM AirticketAirline A where A.airticketPnr.airticketBooking.master.id = :masterid )";
    private static final String HotelBookingUpdate = "UPDATE HotelBooking hotel set  hotel.isBill = 1 "
            + "WHERE hotel.master.id = :masterid";
    private static final String AirBookingDescUpdate = "UPDATE AirticketDesc AD set  AD.isBill = 1 "
            + "WHERE AD.airticketBooking.id =  ";
    private static final String SelectAirBookId = "FROM AirticketBooking AB where AB.master.id = :masterid )";
    private static final String DaytourBookingUpdate = "UPDATE DaytourBooking DB set  DB.isBill = 1 "
            + "WHERE DB.master.id = :masterid";
    @Override
    public Billable getBillableBooking(String refno) {
        Session session = this.sessionFactory.openSession();
        List<Billable> list = session.createQuery(BillQuery).setParameter("refno", refno).list();

        if (list.isEmpty()) {
            return null;
        }

        return list.get(0);
    }

    @Override
    public int updateBillStatusBooking(String refno, Billable bill) {
        int result = 0;

        try {
            Session session = this.sessionFactory.openSession();
            Query query = session.createQuery(OtherBookingUpdate);
            query.setParameter("refno", refno);
            result = query.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            result = 0;
        }

        return result;
    }

    @Override
    public int insertBillableBooking(Billable bill) {
        int result = 0;
        HashSet<String> ListBill = new HashSet<String>();

        try {
            Session session = this.sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(bill);
            if (bill.getBillableDescs() != null) {
                List<BillableDesc> BillDescList = new ArrayList<BillableDesc>(bill.getBillableDescs());
                System.out.println("save getBillableDescs :" + BillDescList.size());
                for (BillableDesc b : BillDescList) {
                    System.out.println("getBillableDescs cost : " + b.getCost());
                    if (b.getId() == null) {
                        b.setBillable(bill);
                        b.setIsBill(1);
                        session.save(b);
                    } else {
                        b.setBillable(bill);
                        b.setIsBill(1);
                        session.update(b);
                    }
                    ListBill.add(b.getMBilltype().getId());
                }
                Iterator<String> listbilltype = ListBill.iterator();
                while (listbilltype.hasNext()) {
                    String hql = "";
                    String billtype = listbilltype.next();
                    System.out.println("billtype : " + billtype);
                    if (billtype.equalsIgnoreCase("1")) {
                        List<AirticketAirline> list = session.createQuery(SelectAirLineId).setParameter("masterid", bill.getMaster().getId()).list();
                        String AirlineList = "(";

                        for (int i = 0; i < list.size(); i++) {
                            AirlineList += list.get(i).getId() + ",";
                        }
                        AirlineList = AirlineList.substring(0, AirlineList.length() - 1) + ")";
                        hql = AirBookingUpdate + AirlineList;

                        //update Airticket_desc
                        String AirBookList = "";
     
                        List<AirticketBooking> listAirBook = session.createQuery(SelectAirBookId).setParameter("masterid", bill.getMaster().getId()).list();
                        for (int i = 0; i < listAirBook.size(); i++) {
                            AirBookList += listAirBook.get(i).getId() + ",";
                        }
                        AirBookList = AirBookList.substring(0, AirBookList.length() - 1) + "";
                        System.out.println("update Book Desc HQL : "+AirBookingDescUpdate+" "+AirBookList);
                        Query DescQuery = session.createQuery(AirBookingDescUpdate+" "+AirBookList);
                        DescQuery.executeUpdate();

                    } else if (billtype.equalsIgnoreCase("2")) {
                        System.out.println("update other");
                        hql = OtherBookingUpdate;
                    } else if (billtype.equalsIgnoreCase("3")) {
                        System.out.println("update land");
                        hql = LandBookingUpdate;
                    } else if (billtype.equalsIgnoreCase("4")) {
                        System.out.println("update hotel");
                        hql = HotelBookingUpdate;
                    }else if (billtype.equalsIgnoreCase("6")) {
                        System.out.println("update daytour");
                        hql = DaytourBookingUpdate;
                    }
                    
                    
                    Query query = session.createQuery(hql);
                    if (!billtype.equalsIgnoreCase("1")) {
                        query.setParameter("masterid", bill.getMaster().getId());
                    }
                    query.executeUpdate();

                }

            }

            transaction.commit();
            session.close();
            this.sessionFactory.close();
            result = 1;
        } catch (Exception ex) {
            ex.printStackTrace();
            result = 0;
        }
        return result;

    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int updateBillableBooking(Billable bill) {
        int result = 0;
        HashSet<String> ListBill = new HashSet<String>();
        try {
            Session session = this.sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(bill);
            if (bill.getBillableDescs() != null) {
                List<BillableDesc> BillDescList = new ArrayList<BillableDesc>(bill.getBillableDescs());
                System.out.println("save getBillableDescs :" + BillDescList.size());
                for (BillableDesc b : BillDescList) {
                    System.out.println("getBillableDescs cost : " + b.getCost());
                    if (b.getId() == null) {
                        b.setBillable(bill);
                        b.setIsBill(1);
                        session.save(b);
                    } else {
                        b.setBillable(bill);
                        b.setIsBill(1);
                        session.update(b);
                    }
                    ListBill.add(b.getMBilltype().getId());
                }
                Iterator<String> listbilltype = ListBill.iterator();
                while (listbilltype.hasNext()) {
                    String hql = "";
                    String billtype = listbilltype.next();
                    System.out.println("billtype : " + billtype);
                    if (billtype.equalsIgnoreCase("1")) {
                        List<AirticketAirline> list = session.createQuery(SelectAirLineId).setParameter("masterid", bill.getMaster().getId()).list();
                        String AirlineList = "(";

                        for (int i = 0; i < list.size(); i++) {
                            AirlineList += list.get(i).getId() + ",";
                        }
                        AirlineList = AirlineList.substring(0, AirlineList.length() - 1) + ")";
                        hql = AirBookingUpdate + AirlineList;

                        //update Airticket_desc
                        String AirBookList = "";
     
                        List<AirticketBooking> listAirBook = session.createQuery(SelectAirBookId).setParameter("masterid", bill.getMaster().getId()).list();
                        for (int i = 0; i < listAirBook.size(); i++) {
                            AirBookList += listAirBook.get(i).getId() + ",";
                        }
                        AirBookList = AirBookList.substring(0, AirBookList.length() - 1) + "";
                        System.out.println("update Book Desc HQL : "+AirBookingDescUpdate+" "+AirBookList);
                        Query DescQuery = session.createQuery(AirBookingDescUpdate+" "+AirBookList);
                        DescQuery.executeUpdate();
                    } else if (billtype.equalsIgnoreCase("2")) {
                        List<AirticketAirline> list = session.createQuery(SelectAirLineId).setParameter("masterid", bill.getMaster().getId()).list();
                        String AirlineList = "(";
                        for (int i = 0; i < list.size(); i++) {
                            AirlineList += list.get(i).getId() + ",";
                        }
                        AirlineList = AirlineList.substring(0, AirlineList.length() - 1) + ")";
                        System.out.println("AirlineList :" + AirlineList);
                        System.out.println("update other");
                        hql = OtherBookingUpdate;
                    } else if (billtype.equalsIgnoreCase("3")) {
                        System.out.println("update land");
                        hql = LandBookingUpdate;
                    } else if (billtype.equalsIgnoreCase("4")) {
                        System.out.println("update hotel");
                        hql = HotelBookingUpdate;
                    } else if (billtype.equalsIgnoreCase("6")) {
                        System.out.println("update daytour");
                        hql = DaytourBookingUpdate;
                    }
                    Query query = session.createQuery(hql);
                    if (!billtype.equalsIgnoreCase("1")) {
                        query.setParameter("masterid", bill.getMaster().getId());
                    }
                    query.executeUpdate();

                }

            }

            transaction.commit();
            session.close();
            result = 1;
        } catch (Exception ex) {
            ex.printStackTrace();
            result = 0;
        }
        return result;
    }

}