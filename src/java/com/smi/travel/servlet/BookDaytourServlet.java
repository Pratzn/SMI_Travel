/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.smi.travel.servlet;

import com.smi.travel.datalayer.ajax.service.AbstractAJAXServlet;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Surachai
 */
public class BookDaytourServlet implements AbstractAJAXServlet {
    
    @Override
    public Map process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String TourID = request.getParameter("tourid");
        String TourDate = request.getParameter("date");
        String servletName = request.getParameter("servletName");
        String Type = request.getParameter("type");
        System.out.print("set parameter mapping");
        Map result = new HashMap();
        result.put("tourid", TourID);
        result.put("date", TourDate); 
        result.put("servletName", servletName);
        result.put("type", Type); 
        return result;
    }
}
