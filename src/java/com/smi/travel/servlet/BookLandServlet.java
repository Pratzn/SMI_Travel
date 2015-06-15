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
public class BookLandServlet implements AbstractAJAXServlet {
    
    @Override
    public Map process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String PackageID = request.getParameter("packageid");
        String servletName = request.getParameter("servletName");
        String Type = request.getParameter("type");
        String departdate = request.getParameter("departdate");
        System.out.print("set parameter mapping");
        
        Map result = new HashMap();
        result.put("packageid", PackageID);
        result.put("servletName", servletName);
        result.put("departdate", departdate);
        result.put("type", Type); 
        return result;
    }
}
