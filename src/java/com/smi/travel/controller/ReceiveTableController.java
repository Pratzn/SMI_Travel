package com.smi.travel.controller;
import com.smi.travel.master.controller.SMITravelController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
public class ReceiveTableController extends SMITravelController {
    private static final ModelAndView ReceiveTable = new ModelAndView("ReceiveTable");
    private static final ModelAndView ReceiveTable_REFRESH = new ModelAndView(new RedirectView("ReceiveTable.smi", true));
    
    @Override
    protected ModelAndView process(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        return ReceiveTable;
    }
}
