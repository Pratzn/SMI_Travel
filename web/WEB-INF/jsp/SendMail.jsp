<%-- 
    Document   : SendMail
    Created on : Jun 22, 2015, 3:23:36 PM
    Author     : Jittima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="js/workspace.js"></script> 
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link href="css/jquery-ui.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send an e-mail</title>
    </head>
<body>
<div class ="container"  style="padding-top: 30px;" ng-app="">
    <div class="row">
        <div class="col-sm-12">
            <form method="post" id="Mail" role="form">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">New Message</h3>
                    </div>
                    <div class="text-center" style="padding-top: 25px">
                        <div style="padding-left: 30px ; padding-right: 90% ; " >    
                            <button style="height: 60px " type="button" onclick="sendEmail();" class="form-control btn btn-primary">Send</button> 
                        </div>
                    </div>
                    <div class="panel-body" style="padding-top: 50px">
                        <div class="col-sm-12">
                            <div class="row">
                                <label class="col-sm-1 control-label text-right">To : </label>
                                <div class="col-sm-10" style="margin-left: 10px">
                                    <div class="form-group">
                                        <div class="input-group text-left" >
                                            <input type="text" class="form-control" id="sendTo" name="sendTo" size="50" > 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <label class="col-sm-1 control-label text-right">Cc : </label>
                                <div class="col-sm-10" style="margin-left: 10px">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="sendCc" name="sendCc" size="50" > 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>            
                        <div class="col-sm-12">
                            <div class="row">
                                <label class="col-sm-1 control-label text-right">Subject : </label>
                                <div class="col-sm-10" style="margin-left: 10px">
                                    <div class="form-group">
                                        <div class="input-group" >
                                            <input type="text" class="form-control" id="subject" name="subject" size="50" > 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>            
                        <div class="col-sm-12">
                            <div class="row">
                                <label class="col-sm-1 control-label text-right">File : </label>
                                <div class="col-sm-10" style="margin-left: 10px">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="attachfile" name="attachfile" size="50" > 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <label class="col-sm-1 control-label text-right"></label>
                                <div class="col-sm-10" style="margin-left: 10px">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <textarea rows="10" cols="52" class="form-control" id="content" name="content"></textarea> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
      
    });
    
    function sendEmail(){
//            alert($('#sendTo').val());
//            alert($('#sendCc').val());
//            alert($('#subject').val());
//            alert($('#fileAttachment').val());
//            alert($('#message').val());
            var servletName = 'MailServlet';
            var servicesName = 'AJAXBean';
            var sendTo = document.getElementById('sendTo').value;;
            var sendCc = document.getElementById('sendCc').value;;
            var subject = document.getElementById('subject').value;
            var attachfile = document.getElementById('attachfile').value;
            var content = document.getElementById('content').value;

            var param = 'action=' + 'text' +
                '&servletName=' + servletName +
                '&servicesName=' + servicesName +
                '&sendTo=' + sendTo +
                '&sendCc=' + sendCc +
                '&subject=' + subject +
                '&attachfile=' + attachfile +
                '&content=' + content +
                '&type=' + 'sendMail';

                if(confirm('Send Email ?')){
                    callAjaxSendEmail(param);
                }

        }
        
    function callAjaxSendEmail(param){
        var url = 'AJAXServlet';
            $.ajax({
                type: "POST",
                url: url,
                cache: false,
                data: param,
                success: function(msg) {

                    if(msg =='success'){
                        alert('send successful');
                    }else{
                        alert('send unsuccessful');
                    }
                }, error: function(msg) {
                   alert('send unsuccessful');
                }
            });
    }

</script>


