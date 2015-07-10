<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="js/workspace.js"></script> 
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link href="css/jquery-ui.css" rel="stylesheet">

<c:set var="agent_list" value="${requestScope['agent_list']}" />
<c:set var="pvType_list" value="${requestScope['pvType_list']}" />
<c:set var="status_list" value="${requestScope['status_list']}" />
<c:set var="invoiceSup_list" value="${requestScope['invoiceSup_list']}" />
<c:set var="APcode_list" value="${requestScope['APcode_list']}" />
<c:set var="payment_list" value="${requestScope['payment_list']}" />

<section class="content-header" >
    <h1>
        Checking - Package Tour/Hotel
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-book"></i> Checking</a></li>          
        <li class="active"><a href="#">Package Tour/Hotel</a></li>
    </ol>
</section>
<div class ="container"  style="padding-top: 15px;padding-left: 5px;" ng-app=""> 
    <!-- side bar -->
    <div class="col-sm-2" style="border-right:  solid 1px #01C632;padding-top: 10px">
        <div ng-include="'WebContent/Checking/CheckingPackageTourHotel.html'"></div>
    </div>
    <!--Content -->
    <div class="col-sm-10">
        <div class="row" style="padding-left: 15px">  
            <div class="col-sm-6" style="padding-right: 15px">
                <h4><b>Payment Tour / Hotel</b></h4>
            </div>
        </div>
        <hr/>
        <!--Row 1 -->
        <div class="row" style="padding-left: 15px">
            <div class="col-xs-12 ">
                <div class="col-xs-1 text-right">
                    <label class="control-label">Pay No</lable>
                </div>
                <div class="col-md-3 form-group text-left">
                    <div class="col-sm-12">
                        <input name="InputPayNo" id="InputPayNo" type="text" class="form-control" value="" />
                    </div>
                </div>
                <div class="col-xs-4 text-left" style="padding-left:10px;padding-right:0px;"></div>
                <div class="col-xs-1 text-left" style="padding-left:10px;padding-right:0px;">
                    <label class="control-label">Account<font style="color: red">*</font></lable>
                </div>
                <div class="col-md-3  text-left" style="padding-top : 5px;padding-left:0px;padding-right:0px;">
                    <div class="col-sm-6" text-left>
                        <input type="radio" name="account1"  id="account1" value="account1" /> &nbsp;account(1)
                    </div>
                    <div class="col-sm-6" text-left>
                        <input type="radio" name="account1"  id="account2" value="account2" />&nbsp;account(2)
                    </div>
                </div>
            </div>
        </div>
        <!--Row 2 -->
        <div class="row" style="padding-left: 0px">
            <div class="col-xs-12 ">
                <div class="col-xs-2 text-right" style="padding-left:0px;padding-right:0px;width:85px;">
                    <label class="control-label">Pay Date</lable>
                </div>               
                <div class="col-md-2 form-group text-left" style="padding-left:28px">
                    <div class="col-sm-12">
                        <div class='input-group date' style="width:140px;">
                            <input name="InputPayDate" id="InputPayDate" type="text" class="form-control datemask" data-date-format="YYYY-MM-DD" placeholder="YYYY-MM-DD" value="" />
                            <span class="input-group-addon spandate"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-2 text-right" style="padding-left:0px;padding-right:20px;">
                    <label class="control-label">PV Type</lable>
                </div>
                <div class="col-md-2 form-group text-left" style="padding-left:5px;padding-right:0px;">
                    <div class="col-sm-12">
                        <select name="itemPvType" id="itemPvType" class="form-control">
                            <option id="" value="">---------</option>  
                            <c:forEach var="PVType" items="${pvType_list}">
                                <c:set var="select" value="" />
                                <c:if test="${PVType.id == requestScope['currency']}">
                                    <c:set var="select" value="selected" />
                                </c:if>
                                <option value="<c:out value="${PVType.id}" />" ${select}><c:out value="${PVType.name}" /></option>                                         
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-xs-2 text-right" style="padding-left:5px;padding-right: 10px;">
                    <label class="control-label">Status<font style="color: red">*</font></lable>
                </div>
                <div class="col-md-2  text-left" style="padding-top:5px;padding-left:0px;padding-right:0px;">
                    <div class="col-sm-12">
                        <select class="form-control" id="itemStatus" name="itemStatus">
                            <option id="" value="">---------</option>  
                            <c:forEach var="status" items="${status_list}">
                                <c:set var="select" value="" />
                                <c:if test="${status.name == requestScope['currency']}">
                                    <c:set var="select" value="selected" />
                                </c:if>
                                <option value="<c:out value="${status.id}" />" ${select}><c:out value="${status.name}" /></option>                                         
                            </c:forEach>
                        </select>    
                    </div>
                </div>
            </div>
        </div>
        <!--Row 3 -->
        <div class="row" >
            <input name="InputInvoiceSupId" id="InputInvoiceSupId" type="hidden" class="form-control" value="" />
            <div class="col-xs-2 text-right" style="padding-left:10px;padding-right:0px;width:100px;">
                    <label class="control-label">Invoice Sup<font style="color: red">*</font></lable>
            </div>
            <div class="col-md-2 form-group text-right" style="padding-left:30px;padding-right:0px;"> 
                <div class="col-sm-12">
                    <div class="input-group" id="CodeValidate">
                        <input name="InputInvoiceSupCode" id="InputInvoiceSupCode" type="text" class="form-control" value="" />
                        <span class="input-group-addon" data-toggle="modal" data-target="#SearchInvoiceSup">
                            <span class="glyphicon-search glyphicon"></span>
                        </span>    
                    </div>    
                </div>   
            </div>
            <div class="col-md-4 form-group text-left" style="width:360px;">
                <div class="col-sm-12">
                    <input name="InputInvoiceSupName" id="InputInvoiceSupName" type="text" class="form-control" value="" />           
                </div>
            </div>
            <div class="col-xs-2 text-right" style="padding-left:10px;padding-right:0px;width:140px;">
                <label class="control-label">A/P Code<font style="color: red">*</font></lable>
            </div>
            <div class="col-md-2 form-group text-left" style="padding-left:9px;width:190px;">
                <div class="col-sm-12">
                    <div class="input-group" id="CodeValidate">
                        <input name="InputAPCode" id="InputAPCode" type="text" class="form-control" value="" />
                        <span class="input-group-addon" data-toggle="modal" data-target="#SearchAPCode">
                            <span class="glyphicon-search glyphicon"></span>
                        </span>    
                    </div>    
                </div>  
            </div>
        </div>
        <!--Row 4 -->
        <div class="row" >
            <div class="col-xs-2 text-right" style="padding-left:10px;padding-right:0px;width:100px;">
                    <label class="control-label">Detail</lable>
            </div>
            <div class="col-md-6 form-group text-left" style="padding-left:30px;padding-right:0px;width:520px;">
                <div class="col-sm-12">
                    <textarea rows="3" cols="60" class="form-control" id="Detail" name="Detail">
                      
                    </textarea>
                </div>   
            </div>
            <div class="col-xs-2 text-right" style="padding-left:10px;padding-right:0px;width:155px;">
                <label class="control-label">Payment</lable>
            </div>
            <div class="col-md-2 form-group text-left" style="padding-left:9px;width:190px;">
                <div class="col-sm-12">
                    <select class="form-control" id="itemPayment" name="itemPayment">
                            <option id="" value="">---------</option>  
                            <c:forEach var="payment" items="${payment_list}">
                                <c:set var="select" value="" />
                                <c:if test="${payment.name == requestScope['currency']}">
                                    <c:set var="select" value="selected" />
                                </c:if>
                                <option value="<c:out value="${payment.id}" />" ${select}><c:out value="${payment.name}" /></option>                                         
                            </c:forEach>
                        </select>         
                </div>
            </div>
        </div>
        <!-- Table -->
        <div class="row" >
            <div class="col-12" style="width:1035px;padding-left:15px;">
                <table class="display" id="PaymentHotelTable">
                    <thead class="datatable-header">
                        <tr>
                            <th style="width: 13%">Product</th>
                            <th style="width: 8%">Ref No</th>
                            <th style="width: 10%">Inv No</th>
                            <th style="width: 8%">Code</th>
                            <th style="width: 8%">Type</th>
                            <th style="width: 10%">Amount</th>
                            <th style="width: 9%">Cur</th>
                            <th style="width: 20%">Description</th>
                            <th style="width: 8%">A/C</th>
                            <th style="width: 8%">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                      
                            <tr>
                                <td class="hidden"> <input  type="hidden"  value="${table.id}">  </td>
                                <td> 
                                    <select class="form-control" id="row-${Counter.count}-product" name="row-${Counter.count}-product">
                                        <option value="">--</option>                                 
                                        <option value="1">test 1</option>                                   
                                        <option value="2">test 2</option>
                                    </select>                                 
                                </td>
                                <td> <input style="width: ${RefNo}" maxlength ="10"  type="text" class="form-control" value="${table.description}"> </td>
                                <td> <input style="width: ${InvNo}" maxlength ="15"  type="text" class="form-control" value="${table.description}">  </td>
                                <td> <input style="width: ${Code}" maxlength ="15"  type="text" class="form-control" value="${table.description}">  </td>
                                <td>
                                    <input type="radio" name="Type" id="Type_T" value="T" checked=""> T&nbsp;
                                    <input type="radio" name="Type" id="Type_C" value="C" > C
                                </td>
                                <td> <input style="width: ${Amount}" maxlength ="15"  type="text" class="form-control" value="${table.description}"> </td>
                                <td> 
                                    <select class="form-control" id="row-${Counter.count}-cur" name="row-${Counter.count}-cur">
                                        <option value="">--</option>                                 
                                        <option value="1">test 1</option>                                   
                                        <option value="2">test 2</option>
                                    </select>                                 
                                </td>
                                <td> <input style="width: ${Description}" maxlength ="255"  type="text" class="form-control" value="${table.description}"> </td>
                                <td> <input style="width: ${AC}" maxlength ="15"  type="text" class="form-control" value="${table.description}"> </td>
                                <td class="text-center">
                                    
                                        <a class="remCF"><span  onclick="deletelist('${table.id}');" class="glyphicon glyphicon-remove deleteicon "></span></a>
                                   
                                    <c:if test="${lockUnlockBooking == 1}">
                                        <span class="glyphicon glyphicon-remove deleteicon" ></span>
                                    </c:if>
                                </td>
                            </tr>                       
                         
                    </tbody>
                </table>
            </div>
        </div><!--End Table --><br>
        <!-- Table Content -->
        <div class="panel panel-default">                    
            <div class="panel-body">
                <!--Row 1.1 -->
                <div class="row" style="padding-left: 25px;">
                    <div class="col-xs-1 text-right">
                        <label class="control-label">Remark</lable>
                    </div>
                    <div class="col-md-3 form-group text-left">
                        <input name="InputRemark" id="InputRemark" type="text" class="form-control" value="" />           
                    </div>
                    <div class="col-xs-2 text-right">
                        <label class="control-label">Grand Total</lable>
                    </div>
                    <div class="col-md-2 form-group text-left">
                        <input name="InputGrandTotal" id="InputGrandTotal" type="text" class="form-control" value="" readonly=""/>            
                    </div>
                </div>
                <!--Row 1.2 -->
                <div class="row" style="padding-left: 25px;">
                    <div class="col-xs-1 text-right">
                        <label class="control-label">Cash</lable>
                    </div>
                    <div class="col-md-2 form-group text-left">
                        <input name="InputCash" id="InputCash" type="text" class="form-control" value="" />           
                    </div>
                </div>
                <!--Row 1.3 -->
                <div class="row" style="padding-left: 25px;">
                    <div class="col-xs-1 text-right">
                        <label class="control-label">Chq No</lable>
                    </div>
                    <div class="col-md-2 form-group text-left">
                        <input name="InputChqNo" id="InputChqNo" type="text" class="form-control" value="" />             
                    </div>
                    <div class="col-xs-3 text-right">
                        <label class="control-label">Chq Amount</lable>
                    </div>
                    <div class="col-md-2 form-group text-left">
                        <input name="InputChqAmount" id="InputChqAmount" type="text" class="form-control" value="" />           
                    </div>
                    
                </div>
            </div>
        </div><!--End Table Content -->
        <!--Button -->
        <div class="row text-center" >
            <div class="col-xs-6 text-right">
                <button type="submit" id="ButtonSave" name="ButtonSave" class="btn btn-success">
                    <i class="fa fa-save"></i> Save             
                </button>
            </div>
            <div class="col-xs-6 text-left">
                <a id="ButtonNew" name="ButtonNew" onclick="" class="btn btn-primary">
                    <i class="glyphicon glyphicon-plus"></i> New
                </a>
            </div>                         
        </div><!--End Button -->
    </div>
</div>
<!--Delete Payment Outbound Modal-->
<div class="modal fade" id="delSearchPaymentTourHotelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Delete Payment Tour/Hotel</h4>
            </div>
            <div class="modal-body" id="delCode"></div>
            <div class="modal-footer">
                <button id="btnDelete" type="button" onclick="Delete()" class="btn btn-danger">Delete</button>
                <button id="btnDeleteClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--Search Invoice Sup-->
<div class="modal fade" id="SearchInvoiceSup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title"  id="Titlemodel">Invoice Supplier</h4>
            </div>
            <div class="modal-body">
                <table class="display" id="SearchInvoicSupTable">
                    <thead class="datatable-header">
                        <script>
                            var invoiceSup = [];
                        </script>
                        <tr>
                            <th>Id</th>
                            <th>Code</th>
                            <th>Name</th>
                            <th>AP code</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="invSup" items="">
                            <tr class="packet">
                                <td class="">${invSup.id}</td>
                                <td>${invSup.code}</td>
                                <td>${invSup.name}</td>
                                <td>${invSup.apcode}</td> 
                            </tr>
                            <script>
                                invoiceSup.push({id: "${invSup.id}", code: "${invSup.code}", name: "${invSup.name}", apcode "${invSup.apcode}"});
                            </script>
                        </c:forEach>    
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button id="SearchInvoiceSupOK" name="SearchInvoiceSupOK" type="button"  class="btn btn-success" data-dismiss="modal">OK</button>
                <button id="SearchInvoiceSupClose" name="SearchInvoiceSupClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal-dialog -->
<!--Search A/P Code-->
<div class="modal fade" id="SearchAPCode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title"  id="Titlemodel">A/P </h4>
            </div>
            <div class="modal-body">
                <table class="display" id="SearchAPCodeTable">
                    <thead class="datatable-header">
                        <tr>
                            <th>Code</th>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr class="packet">
                                <td class="">XXX
                                <td>XXXXX</td> 
                            </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button id="SearchAPCodeOK" name="SearchAPCodeOK" type="button"  class="btn btn-success" data-dismiss="modal">OK</button>
                <button id="SearchAPCodeClose" name="SearchAPCodeClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal-dialog -->
<script type="text/javascript">
    $(document).ready(function () {
        $('.date').datetimepicker();
        $('.datemask').mask('0000-00-00');
        
        $('#SearchInvoicSupTable').dataTable({bJQueryUI: true,
        "sPaginationType": "full_numbers",
        "bAutoWidth": true,
        "bFilter": true,
        "bPaginate": true,
        "bInfo": false,
        "bLengthChange": false,
        "iDisplayLength": 3
        });
        $('#SearchAPCodeTable').dataTable({bJQueryUI: true,
        "sPaginationType": "full_numbers",
        "bAutoWidth": true,
        "bFilter": true,
        "bPaginate": true,
        "bInfo": false,
        "bLengthChange": false,
        "iDisplayLength": 3
        });
    });  
</script>