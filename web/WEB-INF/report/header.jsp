<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="mastermenu" value="${sessionScope['mastermenu']}" />
<c:set var="bookingmenu" value="${sessionScope['bookingmenu']}" />
<c:set var="daytourmenu" value="${sessionScope['daytourmenu']}" />
<c:set var="financemenu" value="${sessionScope['financemenu']}" />
<c:set var="reportmenu" value="${sessionScope['reportmenu']}" />
<c:set var="testMenu" value="${sessionScope['testMenu']}" />
<nav class="navbar " style="margin-bottom:5px;height: 25px;" role="navigation">
    <div class="navbar-header" >
        <a class="navbar-brand" style="padding: 0px" href="#">
            <img src="${pageContext.request.contextPath}/img/smilogo.jpg" /> 
        </a>
    </div>
    <form class="nav navbar-nav navbar-right" style="margin-right: 0px">
        <!--
        <li id="fat-menu" class="dropdown">
            <a id="drop3" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
                <span style="padding-right: 10px;" class="glyphicon glyphicon-envelope" aria-hidden="true"></span><span  class="badge" style="background-color:#cd0a0a">3</span>
            </a>
            
            <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">warning 1</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">ticket due date</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Alert</a></li>
                <li role="presentation" class="divider"></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#alertModal" >Add new message</a></li>
            </ul>
            
        </li>
        -->
        <li><a href="#">User: ${sessionScope['username']} </a></li>  
        <li><a href="#">Role: ${sessionScope['rolename']} </a></li>    
        <li><a href="logout.smi"><i class="glyphicon glyphicon-lock"></i> Logout</a></li>                  
    </form>
</nav>


<nav class="navbar navbar-inverse " style="margin-bottom:5px" role="navigation">

    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" >
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand"  href="main.smi">
            Home
        </a>
    </div>

    <script type="text/javascript" charset="utf-8">

        $(document).ready(function () {
            var masterMenuList = '<c:forEach var="name" items="${mastermenu}"><c:out value="${name}" />:</c:forEach>';
                    var reportMenuList = '<c:forEach var="name" items="${reportmenu}"><c:out value="${name}" />:</c:forEach>';
                            var bookingMenuList = "<c:forEach var="name" items="${bookingmenu}"><c:out value="${name}" />:</c:forEach>";
                                    var daytourMenuList = "<c:forEach var="name" items="${daytourmenu}"><c:out value="${name}" />:</c:forEach>";
//                                        var testMenuList = "<c:forEach var="name" items="${testmenu}"><c:out value="${name}" />:</c:forEach>";
                                            var masterMenu = [
                                                "<li><a href='Mairticket.smi'> Air ticket</a></li>",
                                                "<li><a href='MCity.smi'> Others</a></li>",
                                                "<li><a href='MHotel.smi'> Hotel</a></li>",
                                                "<li><a href='Product.smi'> Product</a></li>",
                                                "<li><a href='Place.smi'> Place</a></li>",
                                                "<li><a href='Agent.smi'> Agent</a></li>",
                                                "<li><a href='MStaff.smi'>Staff</a></li>",
                                                "<li><a href='MGalileo.smi'>Configure Galileo</a></li>",
                                                "<li><a href='MAmadeus.smi'>Configure Amadeus</a></li>",
                                                "<li><a href='MDaytour.smi'>Tour</a></li>",
                                                "<li><a href='MCommission.smi'>Commission</a></li>"];
                                            var bookingMenu = [
                                                "<li><a href='Book.smi'> Booking</a></li>"
                                            ];
                                            
                                            var testMenu = [
                                                "<li><a href='test_page.smi'>Test Page</a></li>"
                                            ];
                                            var daytourMenu = [
                                                "<li><a href='DaytourOperationDetail.smi'> Day Tour</a></li>"
                                     
                                            ];
                                            var reportMenu = [
                                                "<li><a href='AirTicketMonthReport.smi'> AirTicket</a></li>",
                                                "<li><a href='HotelSumReport.smi'> Hotel</a></li>",
                                                "<li><a href=''>Land</a></li>",
                                                "<li><a href=''>Others</a></li>"];
                                       

                                            var menuString = getActiveMenuString(masterMenuList, masterMenu);
                                            document.getElementById("menuMaster").innerHTML = menuString;

                                            var bookingMenuString = getActiveMenuString(bookingMenuList, bookingMenu);
                                            document.getElementById("bookingMenu").innerHTML = bookingMenuString;
                                            
//                                            var testMenuString = getActiveMenuString(testMenuList, testMenu);
//                                            document.getElementById("testMenu").innerHTML = testMenuString;

                                            var daytourMenuString = getActiveMenuString(daytourMenuList, daytourMenu);
                                            document.getElementById("daytourMenu").innerHTML = daytourMenuString + "<li><a href='DaytourOperationDetail.smi?action=edit'> Day Tour</a></li><li><a href='DaytourOperationOther.smi'> Other </a></li>";
                                            
                            
                                            var reportMenuString = getActiveMenuString(reportMenuList, reportMenu);
                                            document.getElementById("reportMenu").innerHTML = reportMenuString;
                                            
                                            


                                        });
                                        function getActiveMenuString(activeList, menuList) {
                                            var menuString = "";
                                            var activeMenu = activeList.split(':');
                                            menuString = "";
                                            if (activeMenu[0].trim().length > 0) {
                                                for (j = 0; j < activeMenu.length; j++) {
                                                    for (i = 0; i < menuList.length; i++) {
                                                        var has = menuList[i].indexOf(activeMenu[j]);
                                                        if (has > 0) {
                                                            menuString += menuList[i].trim();
                                                            break;
                                                        }
                                                    }
                                                }
                                            }
                                            return menuString;
                                        }
    </script>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav" id="navtop">  
            <li class="dropdown">
                <a href="#" class="dropdown-header" data-toggle="dropdown"> <span class="glyphicon glyphicon-dashboard"></span> Master <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" id="menuMaster">
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-header" data-toggle="dropdown" id="BookingMenu"> <span class="glyphicon glyphicon-book"></span> Booking <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" id="bookingMenu">

                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-header" data-toggle="dropdown">  <span class="glyphicon glyphicon-plane"></span> Operation <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" id="daytourMenu">
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-header" data-toggle="dropdown">  <span class="glyphicon glyphicon-euro"></span> Finance & Accountingr <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" id="financeMenu">

                    <li><a href="#"> sub menu1</a></li>
                </ul>
            </li>
            
            <li class="dropdown">
                <!--<a href="AirTicketMonthReport.smi" >Report</a>-->
                <a href="#" class="dropdown-header" data-toggle="dropdown">  <span class="glyphicon glyphicon-list-alt"></span>  Report  <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" id="reportMenu"></ul>
            </li>
            
<!--            <li class="dropdown">
                <a href="#" class="dropdown-header" data-toggle="dropdown">  <span class="glyphicon glyphicon-plane"></span> Test <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" id="testMenu">
                </ul>
            </li>-->

        </ul>

    </div>


    <!-- /.navbar-collapse -->

    <!-- /.container -->
</nav>


<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">warning message</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Supject</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputPassword3" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Due date</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="inputEmail3" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">message</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                        </div>
                    </div>                            
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>




