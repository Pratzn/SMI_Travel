package com.smi.travel.masterdata.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smi.travel.controller.form.MAccountCodeForm;
import com.smi.travel.datalayer.entity.AccountCode;
import com.smi.travel.datalayer.service.MAccountCodeService;
import com.smi.travel.master.controller.AbstractController;

@Controller
@RequestMapping("/MAccountCode.smi")
public class MAccountCodeController extends AbstractController {

	private static String DEFAULT_VIEW = "MAccountCode";
	
	private static final Map<String, String> accTypeList = new LinkedHashMap<String, String>();
	
	private static final String SEARCH_ACTION = "search";
	private static final String SAVE_ACTION = "save";

	static {
		accTypeList.put(null, null);
		accTypeList.put("A", "ASSETS");
		accTypeList.put("L", "LIABILITIES");
		accTypeList.put("S", "SHARE HOLDER");
		accTypeList.put("I", "INCOMES");
		accTypeList.put("E", "EXPENSE");
	}

	@Autowired
	private MAccountCodeService mAccountCodeService;

	@ModelAttribute
	public void setup(@ModelAttribute("form") MAccountCodeForm form, Model model) {
		logger.debug("Model Attribute Process...");
		model.addAttribute("accTypeList", accTypeList);
	}

	@RequestMapping
	public String initial(@ModelAttribute("form") MAccountCodeForm form, Model model,@RequestParam(value="action",required=false) String action) {
		logger.debug("MAccountCodeController : initial request");

		
		if(SEARCH_ACTION.equals(action)){
			String accCode = form.getAccCode();
			String accType = form.getAccType();
			List<AccountCode> accountCodeList = mAccountCodeService.search(accCode, accType);
			form.setDataTable(accountCodeList);
		}else if(SAVE_ACTION.equals(action)){
			int result =0;
			AccountCode accountCode = new AccountCode(form.getId(),form.getAccCodeModal(),form.getDetailModal().toUpperCase(),form.getAccTypeModal());
			if(StringUtils.isEmpty(form.getIdModal())){
				result = mAccountCodeService.save(accountCode);
			}else{
				result = mAccountCodeService.update(accountCode);
			}
			if(result==1){
				List<AccountCode> accountCodeList = mAccountCodeService.search(form.getAccCodeModal(), form.getAccTypeModal());
				form.setDataTable(accountCodeList);
				form.setAccCode(form.getAccCodeModal());
				form.setAccCode2(form.getAccCodeModal().substring(1));
				form.setAccType(form.getAccTypeModal());
				
				form.setAccCodeModal("");
				form.setAccCodeModal2("");
				form.setAccTypeModal("");
				form.setDetailModal("");
				form.setIdModal("");
				model.addAttribute("resultSave", "textAlertDivSave");
			}else{
				model.addAttribute("resultSave", "textAlertDivNotSave");
			}
		}
		
		return DEFAULT_VIEW;
	}

}
