/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.smi.travel.datalayer.view.dao;

import java.util.List;

/**
 *
 * @author Kanokporn
 */
public interface DaytourOtherDao {
    public List getDaytourOtherReport(String refno,String status);
}
