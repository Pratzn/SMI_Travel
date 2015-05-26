    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/MCurrency.js"></script> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dataList" value="${requestScope['Currency_List']}" />
<section class="content-header" >
    <h1>
        Master - Currency

    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Master</a></li>          
        <li class="active"><a href="#">Currency</a></li>
    </ol>



</section>


<div class ="container"  style="padding-top: 15px;" ng-app=""> 
    <div class="row">
        <!-- side bar -->
        <div class="col-sm-2" style="border-right:  solid 1px #01C632;padding-top: 10px">
            <div ng-include="'WebContent/Master/OtherMenu.html'"></div>
        </div>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                var table = $('#MasterCurrency').dataTable({bJQueryUI: true,
                    "sPaginationType": "full_numbers",
                    "bAutoWidth": false,
                    "bFilter": false,
                    "bInfo": false
                });

                $('#MasterCurrency tbody').on('click', 'tr', function() {
                    if ($(this).hasClass('row_selected')) {
                        $(this).removeClass('row_selected');
                    }
                    else {
                        table.$('tr.row_selected').removeClass('row_selected');
                        $(this).addClass('row_selected');         
                    }
                });
                //$('.dataTables_length label').remove();


            });

        </script>
        <!-- main page -->
        <div class="col-md-9 ">

            <div class="row">
                <form action="MCurrency.smi" method="post" id="SearchCurrency" role="form">
                    <div class="col-md-3 ">
                        <div class="form-group">
                            <label for="CurrencyCodeS">Code</label>
                            <input type="text"   class="form-control" maxlength="3" id="CurrencyCodeS" name="CurrencyCode" value="${requestScope['currencyCode']}">

                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="CurrencyNameS">Description</label>
                            <input type="text"  class="form-control" maxlength="50" id="CurrencyNameS" name="CurrencyName" value="${requestScope['currencyName']}">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div  style="padding-top: 20px">   
                            <button type="button" id="acs" onclick="searchAction()"  class="btn btn-primary">Search</button>           
                            <input type="hidden" name="action" id="Action"/>
                        </div>
                    </div>
                </form>

            </div>
            <hr>
            
            <div class="row" style="padding-left: 15px">  
                <div class="col-md-4 ">
                    <h4><b>Currency</b></h4>
                </div>
                <div class="col-md-6 " style="padding-left:  156px">
                    <button id="btnAdd" type="button" class="btn btn-success" onclick="addaction()"  data-toggle="modal" data-target="#CurrencyModal">
                        <span id="spanAdd" class="glyphicon glyphicon-plus"></span>Add
                    </button>
                </div>

            </div>
            
            <div class="row" style="padding-left: 15px">    
                <div class="col-md-7 "> 
                    <table id="MasterCurrency" class="display" cellspacing="0" >
                        <thead>
                            <tr class="datatable-header">
                                <th style="width: 30px" >Code</th>
                                <th>Description</th>
                                <th style="width: 70px">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="table" items="${dataList}" varStatus="dataStatus">
                                <tr>
                                    <td><c:out value="${table.code}" /></td>
                                    <td><c:out value="${table.description}" /></td>
                                    <td>
                                        <center> 
                                            <span id="spanEdit${dataStatus.count}" class="glyphicon glyphicon-edit editicon"      onclick="EditCurrency('${table.id}', '${table.code}', '${table.description}')" data-toggle="modal" data-target="#CurrencyModal" ></span>
                                            <span id="spanRemove${dataStatus.count}" class="glyphicon glyphicon-remove deleteicon"  onclick="DeleteCurrency('${table.id}', '${table.code}')" data-toggle="modal" data-target="#delCurrencyModal" >  </span>
                                    </center>
                                    </td>                 
                                </tr>  
                            </c:forEach>
                        </tbody>
                    </table>    
                </div>
            </div>
            
            
         
        </div>
    </div>
</div>

<div class="modal fade" id="CurrencyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 500px">
        <form action="MCurrency.smi" method="post" id="Currencyform" class="form-horizontal"  role="form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Currency</h4>
            </div>
            <div class="modal-body">
                
                    <div class="form-group">
                        <label for="CurrencyCode" class="col-sm-3 control-label" >Code <font style="color: red">*</font></label>
                        <div class="col-sm-8"> 
                            <input type="text" class="form-control" maxlength="3" id="CurrencyCode" name="CurrencyCode" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="CurrencyName" class="col-sm-3 control-label" >Description <font style="color: red">*</font></label>
                        <div class="col-sm-8">  
                            <input type="text" class="form-control" maxlength="50" id="CurrencyName" name="CurrencyName" >
                        </div>
                    </div> 
                    <input type="hidden" id="CurrencyID" name="CurrencyID" >
                    <input type="hidden" id="actionIUP" name="action">
               
            </div>
            <div class="modal-footer">
                <button id="btnSave" type="submit"  class="btn btn-primary">Save</button>
                <button id="btnClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
         </form>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="delCurrencyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Delete Currency</h4>
            </div>
            <div class="modal-body" id="delCode"></div>
            <div class="modal-footer">
                <button id="btnDelete" type="button" onclick="Delete()" class="btn btn-danger">Delete</button>
                <button id="btnDeleteClose" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<c:if test="${! empty requestScope['currencyLap']}">
    <script language="javascript">
        alert('<c:out value="${requestScope['currencyLap']}" />');
    </script>
</c:if>
<c:if test="${! empty requestScope['result']}">
    <script language="javascript">
        alert('<c:out value="${requestScope['result']}" />');
    </script>
</c:if>