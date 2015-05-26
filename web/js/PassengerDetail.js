$(document).ready(function () {
    // DATATIMEPICKER
    $('.date').datetimepicker();
    $('span').click(function () {
        var position = $(this).offset();
        $(".bootstrap-datetimepicker-widget").css("top", position.top + 32);
    });
    $('body').on('click mousemove', function () {
        //getDate();
        var birthDate = new Date($('#birthDate').val());
        var age = _calculateAge(birthDate);
        $("#age").val(age);
    });
    // VALIDATE
    $('#PassengerForm')
            .bootstrapValidator({
                container: 'tooltip',
                excluded: [':disabled'],
                feedbackIcons: {
                    required: 'glyphicon glyphicon-asterisk',
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    MInitialname: {
                        validators: {
                            notEmpty: {
                                message: 'The Initialname is required'
                            }
                        }
                    },
                    firstName: {
                        validators: {
                            notEmpty: {
                                message: 'The FirstName is required'
                            }
                        }
                    },
                    lastName: {
                        validators: {
                            notEmpty: {
                                message: 'The lastName is required'
                            }
                        }
                    },
                    birthDate: {
                        validators: {
                            date: {
                                format: 'YYYY-MM-DD',
                                message: 'The value is not a valid date'
                            }
                        }
                    },
                    postalCode: {
                        validators: {
                            digits: {
                                message: 'The Postal Code is Number'
                            }
                        }
                    },
                    email: {
                        validators: {
                            emailAddress: {
                                message: 'The value is not a valid email address'
                            },
                            regexp: {
                                regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                                message: 'The value is not a valid email address'
                            }
                        }
                    }

                }
            }).on('success.field.bv', function (e, data) {
        if (data.bv.isValid()) {
            data.bv.disableSubmitButtons(false);
        }
    });
});

$(document).ready(function () {
    console.log(customer);
    var codeCustomer = [];
    $.each(customer, function (key, value) {
        codeCustomer.push(value.code);
    });
    $("#passengerId").autocomplete({
        source: codeCustomer
    });
    $("#passengerId").on('keyup', function () {
        var position = $(this).offset();
        console.log("positon :" + position.top);
        $(".ui-widget").css("top", position.top + 30);
        $(".ui-widget").css("left", position.left);
        var code = this.value.toUpperCase();
        $("#id,#MInitialname,#firstName,#lastName,#sex,#address,#tel,#phone,#email,#remark,#Passport,#firstNameJapan,#lastNameJapan").val(null);
        $.each(customer, function (key, value) {
            //console.log('each : ' + value.code);
            //console.log('val : ' + $("#agent_user").val());
            if (value.code.toUpperCase() === code) {
                console.log('ok');
                //$("#id").val(value.id);
                $("#MInitialname").val(value.initialId);
                $("#firstName").val(value.firstname);
                $("#lastName").val(value.lastname);
                $("#sex").val(value.sex);
                $("#address").val(value.address);
                $("#tel").val(value.tel);
                $("#phone").val(value.phone);
                $("#email").val(value.email);
                $("#remark").val(value.remark);
                $("#Passport").val(value.passportNo);
                $("#firstNameJapan").val(value.firstNameJapan);
                $("#lastNameJapan").val(value.lastNameJapan);
            }
        });
    });
    $("#CustomerTable tr").on('click', function () {
        var customer_id = $(this).find(".customer-id").text();
        var customer_code = $(this).find(".customer-code").text();
        var customer_initial = $(this).find(".customer-initial").text();
        var customer_initialId = $(this).find(".customer-initialId").text();
        var customer_firstname = $(this).find(".customer-firstname").text();
        var customer_lastname = $(this).find(".customer-lastname").text();
        var customer_sex = $(this).find(".customer-sex").text();
        var customer_address = $(this).find(".customer-address").text();
        var customer_tel = $(this).find(".customer-tel").text();
        var customer_phone = $(this).find(".customer-phone").text();
        var customer_postal = $(this).find(".customer-postal").text();
        var customer_email = $(this).find(".customer-email").text();
        var customer_remark = $(this).find(".customer-remark").text();
        var customer_passportno = $(this).find(".customer-passportno").text();
        var customer_japanfirstname = $(this).find(".customer-japanfirstname").text();
        var customer_japanlastname = $(this).find(".customer-japanlastname").text();
        $("#customerId").val(customer_id);
        $("#MInitialname").val(customer_initialId);
        $("#passengerId").val(customer_code);
        $("#firstName").val(customer_firstname);
        $("#lastName").val(customer_lastname);
        $("#sex").val(customer_sex);
        $("#address").val(customer_address);
        $("#tel").val(customer_tel);
        $("#phone").val(customer_phone);
        $("#email").val(customer_email);
        $("#remark").val(customer_remark);
        $("#Passport").val(customer_passportno);
        $("#CustomerModal").modal('hide');
    });
    // PASSENGER TABLE
    $('#CustomerTable').dataTable({bJQueryUI: true,
        "sPaginationType": "full_numbers",
        "bAutoWidth": false,
        "bFilter": true,
        "bPaginate": true,
        "bInfo": false,
        "bLengthChange": false,
        "iDisplayLength": 10
    });
    $('#CustomerTable tbody').on('click', 'tr', function () {
        $(this).addClass('row_selected').siblings().removeClass('row_selected');
    });
});

function _calculateAge(birthday) {
    var ageDifMs = Date.now() - birthday.getTime();
    var ageDate = new Date(ageDifMs);
    return Math.abs(ageDate.getUTCFullYear() - 1970);
}