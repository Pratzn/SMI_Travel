/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.smi.travel.datalayer.dao;

/**
 *
 * @author Surachai
 */
public interface MRunningCodeDao {
    public String gennarateRunningCode(String type,int Digit);
}
