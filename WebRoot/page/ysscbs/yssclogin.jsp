<%--
  Created by IntelliJ IDEA.
  User: Yejunjie
  Date: 2017/6/1
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>云书商城后台管理系统</title>
    <link rel="shortcut icon" href="../../img/yunlogo.ico" type="image/x-icon"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/xenon-core.css">
    <link rel="stylesheet" href="assets/css/xenon-forms.css">
    <link rel="stylesheet" href="assets/css/xenon-components.css">
    <link rel="stylesheet" href="assets/css/xenon-skins.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <script src="assets/js/jquery-1.11.1.min.js"></script>


</head>
<body class="page-body login-page login-light">


<div class="login-container">

    <div class="row">

        <div class="col-sm-6" id="loginbox">

            <script type="text/javascript">
                jQuery(document).ready(function($)
                {
                    // Reveal Login form
                    setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);


                    // Validation and Ajax action
                    $("form#login").validate({
                        rules: {
                            username: {
                                required: true
                            },

                            passwd: {
                                required: true
                            }
                        },

                        messages: {
                            username: {
                                required: '请输入用户名'
                            },

                            passwd: {
                                required: '请输入密码'
                            }
                        },

                        // Form Processing via AJAX
                        submitHandler: function(form)
                        {
                            show_loading_bar(70); // Fill progress bar to 70% (just a given value)

                            var opts = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-top-full-width",
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "5000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            };

                            $.ajax({
                                url: "data/login-check.php",
                                method: 'POST',
                                dataType: 'json',
                                data: {
                                    do_login: true,
                                    username: $(form).find('#username').val(),
                                    passwd: $(form).find('#passwd').val(),
                                },
                                success: function(resp)
                                {
                                    show_loading_bar({
                                        delay: .5,
                                        pct: 100,
                                        finish: function(){

                                            // Redirect after successful login page (when progress bar reaches 100%)
                                            if(resp.accessGranted)
                                            {
                                                window.location.href = 'dashboard-1.html';
                                            }
                                        }
                                    });


                                    // Remove any alert
                                    $(".errors-container .alert").slideUp('fast');


                                    // Show errors
                                    if(resp.accessGranted == false)
                                    {
                                        $(".errors-container").html('<div class="alert alert-danger">\
												<button type="button" class="close" data-dismiss="alert">\
													<span aria-hidden="true">&times;</span>\
													<span class="sr-only">Close</span>\
												</button>\
												' + resp.errors + '\
											</div>');


                                        $(".errors-container .alert").hide().slideDown();
                                        $(form).find('#passwd').select();
                                    }
                                }
                            });

                        }
                    });

                    // Set Form focus
                    $("form#login .form-group:has(.form-control):first .form-control").focus();
                });
            </script>

            <!-- Errors container -->
            <div class="errors-container">

            </div>

            <!-- Add class "fade-in-effect" for login form effect -->
            <form method="post" role="form" id="login" name="loginform" class="login-form fade-in-effect">

                <div class="login-header">
                        <img src="assets/images/logo-white-bg@2x.png" alt="" width="120" />
                        <span>后台系统管理系统</span>
                </div>

                <div class="form-group">
                    <label class="control-label" for="username">用户名</label>
                    <input type="text" class="form-control" name="username" id="username" autocomplete="off" />
                </div>

                <div class="form-group">
                    <label class="control-label" for="passwd">密码</label>
                    <input type="password" class="form-control" name="passwd" id="passwd" autocomplete="off" />
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary  btn-block text-left">
                        <i class="fa-lock"></i>
                        登录账号
                    </button>
                </div>

                <div class="login-footer">
                    <a href="ysscforget.jsp" target="_self" style="cursor: pointer">忘记密码?</a>
                </div>
            </form>
        </div>


    </div>
</div>



<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>
<script src="assets/js/jquery-validate/jquery.validate.min.js"></script>
<script src="assets/js/toastr/toastr.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
