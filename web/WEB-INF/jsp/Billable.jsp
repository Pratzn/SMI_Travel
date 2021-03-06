<%--
    Document   : Billable
    Created on : Dec 19, 2014, 1:55:09 PM
    Author     : sumeta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="js/jquery.mask.min.js"></script>
<script type="text/javascript" src="js/Billable.js"></script> 
<link href="css/jquery-ui.css" rel="stylesheet">

<c:set var="billable" value="${requestScope['BillableList']}" />
<c:set var="booking_size" value="${requestScope['BookingSize']}" />
<c:set var="BillableDescList" value="${requestScope['BillableDesc']}" />
<c:set var="agent" value="${requestScope['AgentList']}" />
<c:set var="master" value="${requestScope['Master']}" />
<c:set var="mAccpayList" value="${requestScope['MAccpayList']}" />
<c:set var="mAcctermList" value="${requestScope['MAcctermList']}" />
<c:set var="initialList" value="${requestScope['initialList']}" />
<c:set var="customerAgentList" value="${requestScope['customerAgent']}" />
<c:set var="mBankList" value="${requestScope['MBankList']}" />
<c:set var="refno1" value="${fn:substring(param.referenceNo, 0, 2)}" />
<c:set var="refno2" value="${fn:substring(param.referenceNo, 2,7)}" />
<c:set var="lockUnlockBooking" value="${requestScope['LockUnlockBooking']}" />

<input type="hidden" value="${refno1}-${refno2}" id="getUrl">
<input type="hidden" value="${param.referenceNo}" id="getRealformatUrl">
<input type="hidden" value="${master.createDate}" id="master-createDate">
<input type="hidden" value="${master.createBy}" id="master-createBy">


<input type="hidden" value="${requestScope['result']}" id="resultText">
<section class="content-header" >
    <h1>
        Booking - Billable
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-book"></i> Booking</a></li>
        <li class="active"><a href="#">Billable</a></li>
    </ol>
</section>

<div class ="container"  style="padding-top: 15px;" ng-app="">
    <div class="row">
        <!-- side bar -->
        <div class="col-sm-2" style="border-right:  solid 1px #01C632;padding-top: 10px">
            <input type="hidden" value="${master.customer.MInitialname.name}" id="initialname_tmp">
            <input type="hidden" value="${master.customer.firstName}" id="firstname_tmp">
            <input type="hidden" value="${master.customer.lastName}" id="lastname_tmp">  
            <div ng-include="'WebContent/Book/BookMenu.html'"></div>
            <input hidden="" value="${booking_size[0]}" id="input-airticket_size">
            <input hidden="" value="${booking_size[1]}" id="input-hotel_size">
            <input hidden="" value="${booking_size[2]}" id="input-other_size">
            <input hidden="" value="${booking_size[3]}" id="input-land_size">
            <input hidden="" value="${booking_size[4]}" id="input-passenger_size">
            <input hidden="" value="${booking_size[5]}" id="input-billable_size">
            <input hidden="" value="${booking_size[6]}" id="input-daytour_size">  
        </div>

        <div class="col-sm-10">
            <form action="Billable.smi" method="post" id="Billable" role="form">
                <input id="referenceNo" name="referenceNo" type="hidden" value="${master.referenceNo}"/>
                <input id="action" name="action" type="hidden" value="${action}"/>
                <div ng-include="'WebContent/Book/BookNavbar.html'"></div>

                <input id="now-status" type="hidden" value="${master.getMBookingstatus().getName()}"/>
<!--Alert Save -->
<div id="textAlertDivSave"  style="display:none;" class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Save Success!</strong> 
</div>
<div id="textAlertDivNotSave"  style="display:none;" class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Save Not  Success!</strong> 
</div>
                <div class="row" style="padding-left: 15px">  
                    <div class="col-md-6">
                        <h4><b>Billable</b></h4>
                    </div>
                    <div class="col-md-6 text-right">
                    </div>

                </div>
                <hr/>


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Detail</h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-sm-12">
                            <div class="row">
                                <label class="col-sm-1 control-label text-right">Passenger</label>
                                <div class="col-sm-2" style="margin-left: 25px">
                                    <div class="form-group">
                                        <div class="input-group" id="PassengerInput">
                                            <input type="text" class="form-control" id="orderNo" name="orderNo" value="${billable.passenger.orderNo}">
                                            <input type="hidden" class="form-control" id="passengerId" name="passengerId" value="${billable.passenger.id}" readonly="">
                                            <span id="SpanPassengerModal" name="SpanPassengerModal" class="input-group-addon" data-toggle="modal" data-target="#PassengerModal">
                                                <span class="glyphicon-search glyphicon"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" >
                                    <input id="Initialname" name="Initialname" type="hidden"  value="${billable.passenger.getCustomer().getMInitialname().id}"/>
                                    <input id="InitialDname" readonly="" style="width: 50px" class="form-control" name="InitialDname" type="text"  value="${billable.passenger.getCustomer().getMInitialname().name}"/>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" id="LastName" name="LastName" readonly value="${billable.passenger.getCustomer().getLastName()}">
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" id="passengerName" name="passengerName" readonly value="${billable.passenger.getCustomer().getFirstName()}">
                                </div>
                                <div class="col-sm-3 form-group">
                                    <label class="control-label">
                                        <input type="checkbox" id="payable" name="payable"/>  
                                        Payable to company
                                    </label>
                                    <input type="hidden" id="payableCheckbox" value="${billable.isPayYourself}"/>
                                    <script>
                                        $(document).ready(function () {
                                            if ($("#payableCheckbox").val() == "0") {
                                                $("#payable").prop('checked', true);
                                            }
                                        });

                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="form-group">
                                <label for="billTo" class="col-sm-2 control-label text-right">Bill To <strong style="color: red">*</strong></label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <input type="hidden" id="billto"  name="billto" placeholder="test"  value="${billable.billTo}"/>
                                        <input type="text" id="billtoVal"  name="billtoVal" 
                                               class="form-control" value="${billable.billTo}" 
                                               data-bv-notempty="true" data-bv-notempty-message="Bill to is required" >      
                                        <span id="SpanBillToModal" name="SpanBillToModal" class="input-group-addon" data-toggle="modal" data-target="#BillToModal">
                                            <i id="dataload" class="fa fa-spinner fa-spin hidden"></i>
                                            <span class="glyphicon-search glyphicon"></span>
                                        </span>          
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-5"  style="margin-bottom: 10px">
                                <div class="form-group">
                                    <label  class="col-sm-3 control-label text-right">Term Pay</label>

                                    <div class="col-sm-4" style="width: 194px">
                                        <select class="form-control" name="accterm" id="accterm" >
                                            <option value=""></option>
                                            <c:forEach var="term" items="${mAcctermList}">
                                                <option value="${term.id}">${term.name}</option>
                                            </c:forEach>

                                        </select>
                                        <script>
                                            $(document).ready(function () {
                                                $("#accterm").val("${billable.MAccterm.id}");
                                            });
                                        </script>
                                    </div>
                                </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label for="billname" class="col-sm-2 control-label text-right">Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="billname" name="billname" readonly="" class="form-control" value="${billable.billName}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label  class="col-sm-3 control-label text-right">Pay By</label>
                                    <div class="col-sm-4" style="width: 194px">
                                        <select class="form-control" name="accpay" id="accpay" >
                                            <option value=""></option>
                                            <c:forEach var="pay" items="${mAccpayList}">
                                                <option value="${pay.id}">${pay.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <script>
                                    $(document).ready(function () {
                                        $("#accpay").val("${billable.MAccpay.id}");
                                        $("#accId").val("${billable.bankAccount.id}");
                                        
                                        if($("#accpay option:selected").text() == "Bank Transfer" || $("#accpay").val() == "4" ){
                                            $("#bankAcc").show();       //lable text Bank Transfer
                                            $("#accId").show();         //select list Bank Transfer
                                            $("#tranDateText").show();  //lable text Transfer Date
                                            $("#tranDateDiv").show();   //div class Transfer Date
                                        }else{
                                            $("#bankAcc").hide(); 
                                            $("#accId").hide(); 
                                            $("#tranDateText").hide();
                                            $("#tranDateDiv").hide();
                                            $("#accId").val("");        //Bank Transfer
                                            $("#transferD").val("");    //Transfer Date
                                        }
                                            
                                        $("#accpay").change(function(){
//                                                       alert($("#accpay option:selected").text());
                                            if($("#accpay option:selected").text() == "Bank Transfer" || $("#accpay").val() == "4" ){
                                                $("#bankAcc").show();       //lable text Bank Transfer
                                                $("#accId").show();         //select list Bank Transfer
                                                $("#tranDateText").show();  //lable text Transfer Date
                                                $("#tranDateDiv").show();   //div class Transfer Date
                                            }else{
                                                $("#bankAcc").hide(); 
                                                $("#accId").hide(); 
                                                $("#tranDateText").hide();
                                                $("#tranDateDiv").hide();
                                                $("#accId").val("");        //Bank Transfer
                                                $("#transferD").val("");    //Transfer Date
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-7">
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <label for="address" class="col-sm-2 control-label text-right">Address</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control"  rows="3" id="address" name="address" maxlength="200">${billable.billAddress}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label  class="col-sm-3 control-label text-right" id="bankAcc">Bank Transfer</label>
                                    <div class="col-sm-3" style="width: 194px">
                                        <select class="form-control" name="accId" id="accId" >
                                            <option value=""></option>
                                            <c:forEach var="bank" items="${mBankList}">
                                                <option value="${bank.id}">${bank.code} (${bank.accNo})</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label  class="col-sm-3 control-label text-right"  id="tranDateText" >Transfer Date</label>
                                    <div class="col-sm-4" style="width: 194px">
                                        <div class='input-group date' name="tranDateDiv" id="tranDateDiv">
                                            <input type='text' class="form-control"   data-date-format="YYYY-MM-DD" name="transferD" id="transferD" value="${billable.transferDate}"  />
                                            <span id="SpanGlyphiconCalendar" name="SpanGlyphiconCalendar" class="input-group-addon spandate"><span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                            
                <style>
                 .input-group-addon {
                     padding: 2px 10px; 
                 }
                </style>
                
                <table class="display" id="billableTable">
                    <thead class="datatable-header">
                        <tr style="width:100%">
                            <th style="width:4%">No</th>
                            <th class="hidden">Id</th>
                            <th class="hidden">RefId</th>
                            <th style="width:10%">Type</th>
                            <th style="width:20%">Detail</th>
                            <th style="width:7%">Cost</th>
                            <th style="width:7%">Price</th>
                            <th style="width:7%">Status</th>
                            <th style="width:20%">Bill Date</th>
                            <th style="width:25%">Remark</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    <input type="hidden" id="billDescCount" name="billDescCount" value="" />

                    <c:set var="totalCost"  value="0"/>
                    <c:set var="totalPrice"  value="0"/>
                    <c:forEach var="b" items="${BillableDescList}" varStatus="Counter">
                        <tr>
                            <td>${Counter.count}</td>
                            <td class="hidden"><input type="hidden" id="billDescId-${Counter.count}" name="billDescId-${Counter.count}" value="${b.id}" /></td>
                            <td class="hidden"><input type="hidden" id="billRefId-${Counter.count}" name="billRefId-${Counter.count}" value="${b.refItemId}" /></td>
                            <td><input type="hidden" id="billtype-${Counter.count}" name="billtype-${Counter.count}" value="${b.MBilltype.getName()}" />${b.MBilltype.getName()}</td>
                            <td><input type="hidden" id="detail-${Counter.count}" name="detail-${Counter.count}" value="${b.detail}" />${b.detail}</td>
                            <td class="text-right"><input type="hidden" id="cost-${Counter.count}" name="cost-${Counter.count}" value="${b.cost}" />
                                    <div class="moneyformat">${b.cost eq 0 && b.MBilltype.id eq 6 ? '-': b.cost}</div>
                            </td>
                            <td class="text-right"><input type="hidden" id="price-${Counter.count}" name="price-${Counter.count}" value="${b.price}" /><div class="moneyformat">${b.price }</div></td>
                            <td><c:if test="${b.isBill == 1}">
                                    Billed
                                </c:if>
                                <c:if test="${b.isBill == 0}">
                                    Open
                                </c:if></td>
                            <td>      
                               
                                <div class="input-group  datetime" id="billDescId-${Counter.count}" name="billDescId-${Counter.count}">
                                    <input type="text" class="form-control text-center datemask"  
                                       data-date-format="YYYY-MM-DD" name="billDate-${Counter.count}" id="billDate-${Counter.count}"
                                       placeholder="YYYY-MM-DD" value="${b.billDate}" />
                                    <span id="SpanGroupAddon" class="input-group-addon spandate">
                                            <span id="SpanGlyphiconCalendar" class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </td>
                            
                            <td><input type="text" id="remark-${Counter.count}" name="remark-${Counter.count}" value="${b.remark}" class="form-control" maxlength="255"/></td>
                                <c:if test="${Counter.last}">
                            <script>
                                $("#billDescCount").val(parseInt("${Counter.count}") + 1);
                            </script>
                        </c:if>
                        </tr>
                        <c:set var="totalCost"  value="${totalCost + b.cost}"/> 
                        <c:set var="totalPrice"  value="${totalPrice + b.price}"/> 
                    </c:forEach>

                    <tr>
                        <td></td>
                        <td></td>
                        <td class="text-center"><strong>Total</strong></td>
                        <td class="text-right"><strong class="moneyformat">${totalCost}</strong></td>
                        <td class="text-right"><strong class="moneyformat">${totalPrice}</strong></td>                    
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
                


                <div class="row" style="margin-top: 10px">
                    <div class="col-sm-1">
                        <label class="control-label">Description</label>
                    </div>
                    <div class="col-sm-11">
                        <textarea id="description" maxlength="100" name="description" class="form-control" >${billable.remark}</textarea>
                    </div>
                </div>
                    

                <div class="text-center" style="padding-top: 10px">
                    <c:if test="${lockUnlockBooking == 0}">
                        <button id="ButtonSave" name="ButtonSave" type="submit" onclick class="btn btn-success" ><span id="SpanButtonSave" class="fa fa-save"></span> Save</button>
                    </c:if>
                    <c:if test="${lockUnlockBooking == 1}">
                        <button class="btn btn-success disabled" ><span class="fa fa-save"></span> Save</button>
                    </c:if> 
                </div>

            </form>
        </div>
    </div>
</div>


<!--Modal  Passenger-->
<div class="modal fade" id="PassengerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Passenger</h4>
            </div>
            <div class="modal-body">
                <!--Passenger List Table-->
                <table class="display" id="PassengerTable">
                    <thead>                        
                        <tr class="datatable-header">
                            <th class="hidden">ID</th>
                            <th>Order No</th>
                            <th>Initial</th>
                            <th>Last Name</th>
                            <th>First Name</th>
                        </tr>
                    </thead>
                    <tbody>
                    <script>
                        customer = [];
                    </script>
                    <c:forEach var="p" items="${master.passengers}">
                        <tr>
                            <td class="passenger-id hidden">${p.id}</td>
                            <td class="passenger-orderno">${p.orderNo}</td>
                            <td class="passenger-initial">${p.customer.MInitialname.name}</td>
                            <td class="passenger-lastname">${p.customer.lastName}</td>
                            <td class="passenger-firstname">${p.customer.firstName}</td>
                        </tr>
                        <script>
                            customer.push({
                                id: "${p.id}",
                                order: "${p.orderNo}",
                                initial: "${p.customer.MInitialname.name}",
                                lastname: "${p.customer.lastName}",
                                firstname: "${p.customer.firstName}"
                            });
                        </script>
                    </c:forEach>

                    </tbody>

                </table>
                <!--Script Passenger List Table-->
                <script>
                    $(document).ready(function () {
                 
                         var codeOrder = [];
                        $.each(customer, function (key, value) {
                            codeOrder.push(value.order);
                            if ( !(value.lastname in codeOrder) ){
                               codeOrder.push(value.lastname);
                            }
                            if ( !(value.firstname in codeOrder) ){
                               codeOrder.push(value.firstname);

                            }
                        });
                        $("#orderNo").autocomplete({
                            source: codeOrder,
                            close:function( event, ui ) {
                               $("#orderNo").trigger('keyup');
                            }
                        });
                        $("#orderNo").on('keyup', function () {
                            var position = $(this).offset();
                            $(".ui-widget").css("top", position.top+30);
                            $(".ui-widget").css("left", position.left);
                            
                            var order = this.value.toUpperCase();
                            var firstname = this.value;
                            var lastname = this.value;
                            $("#InitialDname,#passengerName,#LastName").val(null);
                            $.each(customer, function (key, value) {
                                if (value.order.toUpperCase() === order) {
                                    $("#passengerId").val(value.id);
                                    $("#InitialDname").val(value.initial);
                                    $("#passengerName").val(value.firstname);
                                    $("#LastName").val(value.lastname);
                                }
                                if(firstname === value.firstname){
                                    $("#orderNo").val(value.order);
                                    $("#passengerId").val(value.id);
                                    $("#InitialDname").val(value.initial);
                                    $("#passengerName").val(value.firstname);
                                    $("#LastName").val(value.lastname);
                                    code = $("#orderNo").val().toUpperCase();
                                }
                                if(lastname === value.lastname){
                                    $("#orderNo").val(value.order);
                                    $("#passengerId").val(value.id);
                                    $("#InitialDname").val(value.initial);
                                    $("#passengerName").val(value.firstname);
                                    $("#LastName").val(value.lastname);
                                    code = $("#orderNo").val().toUpperCase();
                                }
                            });
                        });
                        
                        $("#PassengerTable tr").on('click', function () {
                            var passenger_id = $(this).find(".passenger-id").text();
                            var passenger_orderno = $(this).find(".passenger-orderno").text();
                            var passenger_firstname = $(this).find(".passenger-firstname").text();
                            var passenger_initial = $(this).find(".passenger-initial").text();
                            var passenger_lastname = $(this).find(".passenger-lastname").text();

                            $("#passengerId").val(passenger_id);
                            $("#orderNo").val(passenger_orderno);
                            $("#passengerName").val(passenger_firstname);
                            $("#LastName").val(passenger_lastname);
                            $("#InitialDname").val(passenger_initial);
                            $("#PassengerModal").modal('hide');
                        });

                        // Passenger Table
                        var PassengerTable = $('#PassengerTable').dataTable({bJQueryUI: true,
                            "sPaginationType": "full_numbers",
                            "bAutoWidth": false,
                            "bFilter": true,
                            "bPaginate": true,
                            "bInfo": false,
                            "bLengthChange": false,
                            "iDisplayLength": 10
                        });
                        $('#PassengerTable tbody').on('click', 'tr', function () {
                            $('.collapse').collapse('show');
                            if ($(this).hasClass('row_selected')) {
                                $(this).removeClass('row_selected');
                            }
                            else {
                                PassengerTable.$('tr.row_selected').removeClass('row_selected');
                                $(this).addClass('row_selected');
                            }
                        });
                        
                        if( $("#action").val()=="insert"){
                            $("#billdate").val('${requestScope['thisdate']}');
                        }
                        
                    });
                </script>

            </div>
            <div class="modal-footer">
                <div class="text-right">
                    <button id="ClosePassengerModal" type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!--Modal  Bill To-->
<div class="modal fade" id="BillToModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4  class="modal-title">Bill To</h4>
            </div>
            <div class="modal-body">
                <!--Bill To List Table-->
                <div style="text-align: right"> <i id="ajaxload"  class="fa fa-spinner fa-spin hidden"></i> Search : <input type="text" style="width: 175px" id="searchBillto" name="searchBillto"/> </div> 
                <table class="display" id="BillToTable">
                    <thead>                        
                        <tr class="datatable-header">
                            <th>Bill To</th>
                            <th>Bill Name</th>
                            <th class="hidden">Address</th>
                            <th class="hidden">Tel</th>
                        </tr>
                    </thead>
                    <tbody>
                    <script>
//                        bill = [];
                    </script>
                    <c:forEach var="item" items="${customerAgentList}">
                        <tr onclick="setBillValue('${item.billTo}', '${item.billName}', '${item.address}', '${item.term}', '${item.pay}');">                                
                            <td class="item-billto">${item.billTo}</td>
                            <td class="item-name">${item.billName}</td>                                
                            <td class="item-address hidden">${item.address}</td>
                            <td class="item-tel hidden">${item.tel}</td>
                        </tr>
                        <script>
//                            bill.push({
//                                billto: "${item.billTo}",
//                                name: "${item.billName}",
//                                address: "${item.address}"
//                            });
                        </script>
                    </c:forEach>
                    </tbody>

                </table>
                <!--Script Bill To List Table-->
                <script>
                    $(document).ready(function () {
//                         var billTo = [];
//                        $.each(bill, function (key, value) {
//                            billTo.push(value.billto);
//                            if ( !(value.name in billTo) ){
//                               billTo.push(value.name);
//                            }
//                           
//                        });
//                        $("#billto").autocomplete({
//                            source: billTo,
//                            close:function( event, ui ) {
//                               $("#billto").trigger('keyup');
//                            }
//                        });
//                        
//                        $("#billto").on('keyup', function () {
//                            var position = $(this).offset();
//                            $(".ui-widget").css("top", position.top + 30);
//                            $(".ui-widget").css("left", position.left);
//                            var code = this.value.toUpperCase();
//                            var name = this.value;
//                            $("#billname,#address").val(null);
//                            $.each(bill, function (key, value) {
//                                if (value.billto.toUpperCase() === code) {
//                                    console.log('ok');
//                                    $("#billname").val(value.name);
//                                    $("#address").val(value.address);
//                                }
//                                if(name === value.name) {
//                                    $("#billto").val(value.billto);
//                                    $("#billname").val(value.name);
//                                    $("#address").val(value.address);
//                                    code = $("#billto").val().toUpperCase();
//                                }
//                            });
//                        });


                        // BillTo Table
                        var BillToTable = $('#BillToTable').dataTable({bJQueryUI: true,
                            "sPaginationType": "full_numbers",
                            "bAutoWidth": false,
                            "bFilter": false,
                            "bPaginate": true,
                            "bInfo": false,
                            "bLengthChange": false,
                            "iDisplayLength": 10
                        });
                        $('#BillToTable tbody').on('click', 'tr', function () {
                            $('.collapse').collapse('show');
                            if ($(this).hasClass('row_selected')) {
                                $(this).removeClass('row_selected');
                            }
                            else {
                                BillToTable.$('tr.row_selected').removeClass('row_selected');
                                $(this).addClass('row_selected');
                            }
                        });

                    });

                </script>

            </div>
            <div class="modal-footer">
                <div class="text-right">
                    <button id="ButtonBilltoModal" type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!--Script-->                                
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('.date').datetimepicker();
        $(".datetime").datetimepicker({
                pickTime: false   
        });

        $('.datemask').mask('0000-00-00');
        $('.spandate').click(function () {
            var position = $(this).offset();
            console.log("positon :" + position.top);
            $(".bootstrap-datetimepicker-widget").css("top", position.top + 30);

        });

        $("#MInitialname").val($("#Initialname").val());
        //setformat();
        //$(".moneyformat").mask('000,000,000,000,000,000', {reverse: true});
        setformat();
    });

    function setformat() {
        $('.moneyformat').each(function () {
            var innerHTML = $(this).html();
            $(this).html(numberWithCommas($(this).html()));
        });

    }
</script>