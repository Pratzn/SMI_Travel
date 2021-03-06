/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.smi.travel.datalayer.view.dao.impl;

import com.smi.travel.datalayer.entity.BillableDesc;
import com.smi.travel.datalayer.entity.HotelBooking;
import com.smi.travel.datalayer.entity.MBilltype;
import com.smi.travel.datalayer.view.dao.BillableViewDao;
import com.smi.travel.datalayer.view.entity.BillableView;
import com.smi.travel.util.UtilityFunction;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Surachai
 */
public class BillableViewImpl implements BillableViewDao{
private SessionFactory sessionFactory;
    
    @Override
    public List<BillableView> getListBillableView(String refno) {
        Session session = this.sessionFactory.openSession();
        UtilityFunction util = new UtilityFunction();
        List<Object[]> QueryList =  session.createSQLQuery("SELECT * FROM `billable_view` where `billable_view`.ref_no =  "+refno)
                .addScalar("bill_type_id",Hibernate.INTEGER)
                .addScalar("bill_type",Hibernate.STRING)
                .addScalar("cost",Hibernate.BIG_INTEGER)
                .addScalar("price",Hibernate.BIG_INTEGER)
                .addScalar("ref_no",Hibernate.STRING)
                .addScalar("detail",Hibernate.STRING)
                .addScalar("id",Hibernate.STRING)
                .list();
               
        List<BillableView> BillableList =  new LinkedList<BillableView>();
        for(Object[] B : QueryList){
            BillableView bill = new BillableView();
            bill.setBillID((B[0].toString()));
            bill.setBilltype(B[1].toString());
            bill.setCost(util.convertObjectToInteger(B[2]));
            bill.setPrice(util.convertObjectToInteger(B[3]));
            bill.setRefno(B[4].toString());
            bill.setDetail(B[5].toString());
            bill.setId(B[6].toString());       
            BillableList.add(bill);  
        }
       
        if (BillableList.isEmpty()) {
            return null;
        }
        session.close();
        return BillableList;
    }
    
    @Override
    public List<BillableDesc> MappingObjectBillable(List<BillableView> ListBill) {
        List<BillableDesc> BillDesc = new LinkedList<BillableDesc>();
        if (ListBill == null) {
            return null;
        }
        for(BillableView B : ListBill){
            BillableDesc Billdata = new BillableDesc();
            MBilltype billtype = new MBilltype();
            if(B.getBilltype().equalsIgnoreCase("Air Ticket")){
              //  System.out.println("set Airline id : "+ B.getId());
               // Billdata.setRefItemId(B.getId());
            }else{
                System.out.println("set  id : "+ B.getId());
                Billdata.setRefItemId(B.getId());
            }
            billtype.setName(B.getBilltype());
            billtype.setId(B.getBillID());
            Billdata.setMBilltype(billtype);
            Billdata.setCost(B.getCost());
            Billdata.setPrice(B.getPrice());
            Billdata.setDetail(B.getDetail());
            BillDesc.add(Billdata);
        }
        return BillDesc;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    
}
