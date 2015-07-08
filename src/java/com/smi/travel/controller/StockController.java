package com.smi.travel.controller;
import com.smi.travel.datalayer.service.StockService;
import com.smi.travel.master.controller.SMITravelController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
public class StockController extends SMITravelController {
    private static final ModelAndView Stock = new ModelAndView("StockService");
    private static final ModelAndView Stock_REFRESH = new ModelAndView(new RedirectView("Stock.smi", true));
    private StockService stockService;
    
    @Override
    protected ModelAndView process(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        return Stock;
    }

    public void setStockService(StockService stockService) {
        this.stockService = stockService;
    }

    public StockService getStockService() {
        return stockService;
    }

   
}
