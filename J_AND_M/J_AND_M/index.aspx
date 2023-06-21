<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="J_AND_M.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>J AND M</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <link href="UI/style/css/normalize.css" rel="stylesheet" />
    <link href="UI/style/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="UI/style/login/login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" />

    <style type="text/css">
        #loader {
            position: fixed;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #FFF;
            filter: opacity(60);
            opacity: 0.75;
            z-index: 10000;
            display: none;
            justify-content: center;
            align-items: center;
        }

        .centerProgress {
            width: 285px;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }

            .centerProgress img {
                width: 100%;
                border-radius: 10px;
                z-index: 100004;
            }
    </style>
</head>
<body>
    <div id="loader">
        <div class="centerProgress d-flex justify-content-between d-flex align-items-center">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/UI/style/img/loading.gif" />
        </div>
    </div>

    <div class="container">
        <div class="d-flex justify-content-center h-100 flex-sm-row flex-column">

            <div class="title-login align-self-center">
                <h1 class="display-4" style="text-shadow: 2px 2px #000000; text-align:center">J && M <br /> Boutique</h1>
            </div>

            <div class="card test">
                <div class="card-body">
                    <asp:Image ID="Image1" CssClass="mx-auto d-block imgLogin mt-4 mb-4" runat="server" ImageUrl="~/UI/style/img/logo.png" />
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input class="form-control" id="pUsername" type="text" name="username" placeholder=" Usuario" data-placement="right" data-content="Este campo es requerido." />
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-unlock-alt"></i></span>
                        </div>
                        <input class="form-control" id="pPassword" type="password" name="username" placeholder=" Contraseña" data-placement="right" data-content="Este campo es requerido." />
                    </div>
                    <div class="form-group">
                        <button class="btn float-right login_btn" style="width: 100%;" onclick="acceptButton();" id="btnLogin">
                            Acceder
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    
    <script src="UI/style/js/jquery-3.3.1.min.js"></script>
    <script src="UI/style/js/popper.min.js"></script>
    <script src="UI/style/js/sweetalert.min.js"></script>
    <script src="UI/style/js/bootstrap/bootstrap.min.js"></script>
    <script src="UI/js/sweetalert.min.js"></script>
    <script src="UI/index/index.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#pUsername').keypress(function (e) {
                if (e.keyCode == 13)
                    $('#btnLogin').click();
            });
            $('#pPassword').keypress(function (e) {
                if (e.keyCode == 13)
                    $('#btnLogin').click();
            });
        });


        var spinner = $("#loader");
        function acceptButton() {
            spinner.show();
            setTimeout(function () {
                var username = document.getElementById("pUsername").value;
                var pass = document.getElementById("pPassword").value;
                if (username.trim() != "") {

                    var params = {
                        user: username,
                        password: pass
                    };

                    $.ajax({
                        type: "POST",
                        url: 'index.aspx/login',
                        data: JSON.stringify(params),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: true,
                        success: function (data) {
                            console.log(data.d)
                            if (data.d) {
                                window.location.href = 'UI/inicio/inicio.aspx';
                            } else {
                                ErrorLogin()
                            }

                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                }
                else {
                    $('#pUsername').popover('enable');
                    $('#pUsername').popover('toggle');
                    setTimeout(function () {
                        $('#pUsername').popover('toggle');
                        $('#pUsername').popover('disable');
                    }, 2000);
                    spinner.hide();
                }
            }, 500);
        }

        function ErrorLogin() {
            swal({
                text: 'El usuario o la contraseña es incorrecta',
                type: "error",
                icon: "error",
                time: 3000,
                buttons: {
                    confirm: true,
                },
            })
            spinner.hide();
        };


    </script>
</body>
</html>
