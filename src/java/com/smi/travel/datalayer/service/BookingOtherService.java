/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.smi.travel.datalayer.service;

import com.smi.travel.datalayer.dao.OtherBookingDao;
import com.smi.travel.datalayer.dao.ProductDao;
import com.smi.travel.datalayer.entity.MItemstatus;
import com.smi.travel.datalayer.entity.OtherBooking;
import com.smi.travel.datalayer.entity.Product;
import com.smi.travel.datalayer.entity.SystemUser;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Surachai
 */
public class BookingOtherService {
    private ProductDao productDao;
    private OtherBookingDao otherBookDao;
    
    public List<OtherBooking> getListBookingOtherFromRefno(String refno) {
        return otherBookDao.getListBookingOtherFromRefno(refno);
    } 
    
    public OtherBooking getBookDetailOtherFromID(String OtherBookingID) {
        return otherBookDao.getBookDetailOtherFromID(OtherBookingID);
    }
    
    public int saveBookingOther(OtherBooking other ,SystemUser user){
        int result =0;
        if(other.getId() != null){
            result = otherBookDao.updateBookDetailOther(other);
        }else{
            MItemstatus status = new MItemstatus();
            status.setId("1");
            other.setIsBill(0);
            Date thisdate = new Date();
            other.setStatus(status);
            other.setCreateBy(user.getUsername());
            other.setCreateDate(thisdate);
            
            result = otherBookDao.insertBookDetailOther(other);
        }
        return result;
    }
    
    public int cancelBookDetailOther(String OtherID){
        return otherBookDao.cancelBookDetailOther(OtherID);
    }
    
    public int enableBookDetailOther(String OtherID){
        return otherBookDao.enableBookDetailOther(OtherID);
    }
    
    public List<Product> getListMasterProduct(){
        return productDao.getListProduct();
    }
    
    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public OtherBookingDao getOtherBookDao() {
        return otherBookDao;
    }

    public void setOtherBookDao(OtherBookingDao otherBookDao) {
        this.otherBookDao = otherBookDao;
    }
    
    
}