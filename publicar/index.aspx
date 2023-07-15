<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="J_AND_M.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>X-MONT Distribuidora</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <link href="UI/style/css/normalize.css" rel="stylesheet" />
    <link href="UI/style/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="UI/style/login/login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" />

    <style type="text/css">
        html, body * {
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }

        body {
            background: linear-gradient( rgba(246,247,249,0.8), rgba(246,247,249,0.8)), url(https://dl.dropboxusercontent.com/u/22006283/preview/codepen/sky-clouds-cloudy-mountain.jpg) no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            width: 100%;
            padding-top: 60px;
            padding-bottom: 100px;
        }

        .frame {
            height: 575px;
            width: 364px;
            background: linear-gradient( rgba(35,43,85,0.75), rgba(35,43,85,0.95)), url(https://dl.dropboxusercontent.com/u/22006283/preview/codepen/clouds-cloudy-forest-mountain.jpg) no-repeat center center;
            background-size: cover;
            margin-left: auto;
            margin-right: auto;
            border-top: solid 1px rgba(255,255,255,.5);
            border-radius: 5px;
            box-shadow: 0px 2px 7px rgba(0,0,0,0.2);
            overflow: hidden;
            transition: all .5s ease;
        }

        .frame-long {
            height: 615px;
        }

        .frame-short {
            height: 400px;
            margin-top: 50px;
            box-shadow: 0px 2px 7px rgba(0,0,0,0.1);
        }

        .nav {
            width: 100%;
            height: 100px;
            padding-top: 40px;
            opacity: 1;
            transition: all .5s ease;
        }

        .nav-up {
            transform: translateY(-100px);
            opacity: 0;
        }

        li {
            padding-left: 10px;
            font-size: 18px;
            display: inline;
            text-align: left;
            text-transform: uppercase;
            padding-right: 10px;
            color: #ffffff;
        }

        .signin-active a {
            padding-bottom: 10px;
            color: #ffffff;
            text-decoration: none;
            border-bottom: solid 2px #1059FF;
            transition: all .25s ease;
            cursor: pointer;
        }

        .signin-inactive a {
            padding-bottom: 0;
            color: rgba(255,255,255,.3);
            text-decoration: none;
            border-bottom: none;
            cursor: pointer;
        }

        .signup-active a {
            cursor: pointer;
            color: #ffffff;
            text-decoration: none;
            border-bottom: solid 2px #1059FF;
            padding-bottom: 10px;
        }

        .signup-inactive a {
            cursor: pointer;
            color: rgba(255,255,255,.3);
            text-decoration: none;
            transition: all .25s ease;
        }

        .form-signin {
            width: 100%;
            height: 375px;
            font-size: 16px;
            font-weight: 300;
            padding-left: 37px;
            padding-right: 37px;
            padding-top: 55px;
            transition: opacity .5s ease, transform .5s ease;
        }

        .form-signin-left {
            transform: translateX(-400px);
            opacity: .0;
        }

        .form-signup {
            width: 100%;
            height: 375px;
            font-size: 16px;
            font-weight: 300;
            padding-left: 37px;
            padding-right: 37px;
            padding-top: 55px;
            position: relative;
            top: -375px;
            left: 400px;
            opacity: 0;
            transition: all .5s ease;
        }

        .form-signup-left {
            transform: translateX(-399px);
            opacity: 1;
        }

        .form-signup-down {
            top: 0px;
            opacity: 0;
        }

        .success {
            width: 80%;
            height: 150px;
            text-align: center;
            position: relative;
            top: -890px;
            left: 450px;
            opacity: .0;
            transition: all .8s .4s ease;
        }

        .success-left {
            transform: translateX(-406px);
            opacity: 1;
        }

        .successtext {
            color: #ffffff;
            font-size: 16px;
            font-weight: 300;
            margin-top: -35px;
            padding-left: 37px;
            padding-right: 37px;
        }

        #check path {
            stroke: #ffffff;
            stroke-linecap: round;
            stroke-linejoin: round;
            stroke-width: .85px;
            stroke-dasharray: 60px 300px;
            stroke-dashoffset: -166px;
            fill: rgba(255,255,255,.0);
            transition: stroke-dashoffset 2s ease .5s, fill 1.5s ease 1.0s;
        }

        #check.checked path {
            stroke-dashoffset: 33px;
            fill: rgba(255,255,255,.03);
        }

        .form-signin input, .form-signup input {
            color: #ffffff;
            font-size: 13px;
        }

        .form-styling {
            width: 100%;
            height: 35px;
            padding-left: 15px;
            border: none;
            border-radius: 20px;
            margin-bottom: 20px;
            background: rgba(255,255,255,.2);
        }

        label {
            font-weight: 400;
            text-transform: uppercase;
            font-size: 13px;
            padding-left: 15px;
            padding-bottom: 10px;
            color: rgba(255,255,255,.7);
            display: block;
        }

        :focus {
            outline: none;
        }

        .form-signin input:focus, textarea:focus, .form-signup input:focus, textarea:focus {
            background: rgba(255,255,255,.3);
            border: none;
            padding-right: 40px;
            transition: background .5s ease;
        }

        [type="checkbox"]:not(:checked),
        [type="checkbox"]:checked {
            position: absolute;
            display: none;
        }

            [type="checkbox"]:not(:checked) + label,
            [type="checkbox"]:checked + label {
                position: relative;
                padding-left: 85px;
                padding-top: 2px;
                cursor: pointer;
                margin-top: 8px;
            }

                [type="checkbox"]:not(:checked) + label:before,
                [type="checkbox"]:checked + label:before,
                [type="checkbox"]:not(:checked) + label:after,
                [type="checkbox"]:checked + label:after {
                    content: '';
                    position: absolute;
                }

                [type="checkbox"]:not(:checked) + label:before,
                [type="checkbox"]:checked + label:before {
                    width: 65px;
                    height: 30px;
                    background: rgba(255,255,255,.2);
                    border-radius: 15px;
                    left: 0;
                    top: -3px;
                    transition: all .2s ease;
                }

                [type="checkbox"]:not(:checked) + label:after,
                [type="checkbox"]:checked + label:after {
                    width: 10px;
                    height: 10px;
                    background: rgba(255,255,255,.7);
                    border-radius: 50%;
                    top: 7px;
                    left: 10px;
                    transition: all .2s ease;
                }

                /* on checked */
                [type="checkbox"]:checked + label:before {
                    background: #0F4FE6;
                }

                [type="checkbox"]:checked + label:after {
                    background: #ffffff;
                    top: 7px;
                    left: 45px;
                }

                [type="checkbox"]:checked + label .ui,
                [type="checkbox"]:not(:checked) + label .ui:before,
                [type="checkbox"]:checked + label .ui:after {
                    position: absolute;
                    left: 6px;
                    width: 65px;
                    border-radius: 15px;
                    font-size: 14px;
                    font-weight: bold;
                    line-height: 22px;
                    transition: all .2s ease;
                }

                [type="checkbox"]:not(:checked) + label .ui:before {
                    content: "no";
                    left: 32px;
                    color: rgba(255,255,255,.7);
                }

                [type="checkbox"]:checked + label .ui:after {
                    content: "yes";
                    color: #ffffff;
                }

        [type="checkbox"]:focus + label:before {
            box-sizing: border-box;
            margin-top: -1px;
        }

        body, html {
            height: 100%;
        }

        .btn-signin, .btn-cambiar {
            float: left;
            padding-top: 8px;
            width: 100%;
            height: 35px;
            border: none;
            border-radius: 20px;
            margin-top: -8px;
        }

        .btn-animate {
            float: left;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 13px;
            text-align: center;
            color: rgba(255,255,255, 1);
            padding-top: 8px;
            width: 100%;
            height: 35px;
            border: none;
            border-radius: 20px;
            margin-top: 23px;
            background-color: rgba(16,89,255, 1);
            left: 0px;
            top: 0px;
            transition: all .5s ease, top .5s ease .5s, height .5s ease .5s, background-color .5s ease .75s;
        }

        .btn-animate-grow {
            width: 130%;
            height: 625px;
            position: relative;
            left: -55px;
            top: -420px;
            color: rgba(255,255,255,0);
            background-color: rgba(255,255,255,1);
        }

        a.btn-signup:hover, a.btn-signin:hover {
            cursor: pointer;
            background-color: #0F4FE6;
            transition: background-color .5s;
        }

        .forgot {
            height: 100px;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding-top: 24px;
            margin-top: -535px;
            border-top: solid 1px rgba(255,255,255,.3);
            transition: all 0.5s ease;
        }

        .forgot-left {
            transform: translateX(-400px);
            opacity: 0;
        }

        .forgot-fade {
            opacity: 0;
        }

        .forgot a {
            color: rgba(255,255,255,.3);
            font-weight: 400;
            font-size: 13px;
            text-decoration: none;
        }

        .welcome {
            width: 100%;
            height: 50px;
            position: relative;
            color: rgba(35,43,85,0.75);
            opacity: 0;
            transition: transform 1.5s ease .25s, opacity .1s ease 1s;
        }

        .welcome-left {
            transform: translateY(-780px);
            opacity: 1;
        }

        .cover-photo {
            height: 150px;
            position: relative;
            left: 0px;
            top: -900px;
            background: linear-gradient( rgba(35,43,85,0.75), rgba(35,43,85,0.95)), url(https://dl.dropboxusercontent.com/u/22006283/preview/codepen/landscape-nature-man-person.jpeg);
            background-size: cover;
            opacity: 0;
            transition: all 1.5s ease 0.55s;
        }

        .cover-photo-down {
            top: -575px;
            opacity: 1;
        }

        .profile-photo {
            height: 125px;
            width: 125px;
            position: relative;
            border-radius: 70px;
            left: 155px;
            top: -1000px;
            background: url(https://dl.dropboxusercontent.com/u/22006283/preview/codepen/nature-water-rocks-hiking.jpg);
            background-size: 100% 135%;
            background-position: 100% 100%;
            opacity: 0;
            transition: top 1.5s ease 0.35s, opacity .75s ease .5s;
            border: solid 3px #ffffff;
        }

        .profile-photo-down {
            top: -636px;
            opacity: 1;
        }

        h1 {
            color: #ffffff;
            font-size: 35px;
            font-weight: 300;
            text-align: center;
        }

        .btn-goback {
            position: relative;
            margin-right: auto;
            top: -400px;
            float: left;
            padding: 8px;
            width: 83%;
            margin-left: 37px;
            margin-right: 37px;
            height: 35px;
            border-radius: 20px;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 13px;
            text-align: center;
            color: #1059FF;
            margin-top: -8px;
            border: solid 1px #1059FF;
            opacity: 0;
            transition: top 1.5s ease 0.35s, opacity .75s ease .5s;
        }

        .btn-goback-up {
            top: -1080px;
            opacity: 1;
        }

        a.btn-goback:hover {
            cursor: pointer;
            background-color: #0F4FE6;
            transition: all .5s;
            color: #ffffff;
        }

        /* refresh button styling */

        #refresh {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #ffffff;
            width: 50px;
            height: 50px;
            border-radius: 25px;
            box-shadow: 0px 2px 7px rgba(0,0,0,0.1);
            padding: 13px 0 0 13px;
        }

        .refreshicon {
            fill: #d3d3d3;
            transform: rotate(0deg);
            transition: fill .25s ease, transform .25s ease;
        }

            .refreshicon:hover {
                cursor: pointer;
                fill: #1059FF;
                transform: rotate(180deg);
            }


        #loader {
            position: fixed;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #FFF;
            filter: alpha(opacity=60);
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
    </style>
</head>
<body style="background-image: url('https://images.unsplash.com/photo-1533109721025-d1ae7ee7c1e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'); /* full height */
  height: 100%; /* center and scale the image nicely */
  background-position: center; background-repeat: no-repeat; background-size: cover;">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css' />
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <div id="loader">
        <div class="centerProgress d-flex justify-content-between d-flex align-items-center">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/UI/style/img/loading.gif" Style="width: 100%" />
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="frame">
                    <div class="nav">
                        <ul class="links">
                            <li class="signin-active"><a class="btn">Login</a></li>
                            <li class="signup-inactive"><a class="btn">Contraseña</a></li>
                        </ul>
                    </div>
                    <div ng-app="" ng-init="checked = false">
                        <div class="form-signin">
                            <label for="username">Nombre de Usuario o Email</label>
                            <input class="form-styling" type="text" name="username" placeholder="usuario@gmail.com" id="pUsername" required="required" data-placement="right" data-content="Este campo es requerido." />
                            <label for="password">Contraseña</label>
                            <input class="form-styling" type="password" name="Contraseña" placeholder="" id="pPassword" required="required" data-placement="right" data-content="Este campo es requerido." />
                            <div class="btn-animate">
                                <input type="button" class="btn-signin" value="Iniciar Sesión" id="btnLogin" style="background-color: darkblue" />
                            </div>
                        </div>
                        <div class="form-signup">
                            <label for="fullname">Nombre Usuario</label>
                            <input class="form-styling" type="text" name="NombreUsuario" id="nombreUsuario" placeholder="" />
                            <label for="email">Email</label>
                            <input class="form-styling" type="text" name="email" id="email" placeholder="" />
                            <label for="password">Contraseña</label>
                            <input class="form-styling" type="password" name="Contraseña" id="contrasena" placeholder="" />
                            <label for="confirmpassword">Confirmar Contraseña</label>
                            <input class="form-styling" type="password" name="ConfirmarContraseña" id="confContrasena" placeholder="" />
                            <input type="button" id="btnCambiarContrasena" class="btn-cambiar" value="Cambiar Contraseña" style="background-color: darkblue" />
                        </div>
                    </div>

                </div>
            </div>
        </div>



    </div>


    <script src="UI/style/js/jquery-3.3.1.min.js"></script>
    <script src="UI/style/js/popper.min.js"></script>
    <script src="UI/style/js/sweetalert.min.js"></script>

    <script src="UI/js/sweetalert.min.js"></script>
    <script src="UI/index/index.js"></script>

    <script>


        localStorage.setItem('Usuario', null);
        $(document).ready(function () {
            var elements = document.getElementsByTagName('div');

            for (var i = 0; i < elements.length; i++) {
                console.log(elements[i].innerText)
                if (elements[i].innerText.includes("Hosted Windows Virtual Server. 2.5GHz CPU, 2GB RAM, 60GB SSD. Try it now for $1")) {
                    elements[i].style.visibility = "hidden";
                    elements[i - 1].style.visibility = "hidden";
                }
            }
            elements = document.getElementsByTagName('a');

            for (var i = 0; i < elements.length; i++) {
                if (elements[i].innerText.includes("Web hosting by")) {
                    elements[i].style.visibility = "hidden";
                }
            }

            $('#pUsername').keypress(function (e) {
                if (e.keyCode == 13)
                    $('#btnLogin').click();
            });
            $('#pPassword').keypress(function (e) {
                if (e.keyCode == 13)
                    $('#btnLogin').click();
            });
        });
        $(function () {
            $(".btn").click(function () {
                $(".form-signin").toggleClass("form-signin-left");
                $(".form-signup").toggleClass("form-signup-left");
                $(".frame").toggleClass("frame-long");
                $(".signup-inactive").toggleClass("signup-active");
                $(".signin-active").toggleClass("signin-inactive");
                $(".forgot").toggleClass("forgot-left");
                $(this).removeClass("idle").addClass("active");
            });
        });

        $(function () {
            $(".btn-signup").click(function () {
                $(".nav").toggleClass("nav-up");
                $(".form-signup-left").toggleClass("form-signup-down");
                $(".success").toggleClass("success-left");
                $(".frame").toggleClass("frame-short");
            });
        });

        var spinner = $("#loader");

        $(function () {
            $(".btn-signin").click(function () {
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

                                var xmlDoc = $.parseXML(data.d);
                                var xml = $(xmlDoc);
                                var info = xml.find("Usuario");

                                if (data.d == "1") {
                                    window.location.href = 'UI/inicio/inicio.aspx';
                                    localStorage.setItem('Usuario', data.d);
                                } else {
                                    var existe = "";
                                    $(info).each(function () {
                                        existe = $(this).find("Resultado").text()
                                        console.log(existe)
                                    })

                                    if (existe != "" && existe != "No existe el usuario" && existe != "El usuario está inactivo") {
                                        window.location.href = 'UI/inicio/inicio.aspx';
                                        localStorage.setItem('Usuario', existe);
                                    } else {
                                        ErrorLogin(existe)
                                    }
                                }

                            },
                            error: function (result) {
                                alert("Error");
                            }
                        })
                    }
                    else {
                        swal({
                            text: "Debe digitar el nombre del usuario",
                            type: "error",
                            icon: "error",
                            time: 3000,
                            buttons: {
                                confirm: true,
                            }
                        })
                        spinner.hide();
                    }
                }, 500);
            });
        });

        function ErrorLogin(valor) {
            if (valor == "") {
                valor = 'El usuario o la contraseña es incorrecta'
            }

            swal({
                text: valor,
                type: "error",
                icon: "error",
                time: 3000,
                buttons: {
                    confirm: true,
                },
            })
            spinner.hide();
        };

        $(function () {
            $(".btn-cambiar").click(function () {
                spinner.show();
                setTimeout(function () {

                    let nombreUsuario = document.getElementById("nombreUsuario").value;
                    let email = document.getElementById("email").value;
                    let contrasena = document.getElementById("contrasena").value;
                    let confContrasena = document.getElementById("confContrasena").value;
                    if (nombreUsuario.trim() != "" && email.trim() != "" && contrasena.trim() != "" && confContrasena.trim() != "") {

                        if (contrasena != confContrasena) {
                            swal({
                                text: "La contraseñas digitadas no son iguales",
                                type: "error",
                                icon: "error",
                                time: 3000,
                                buttons: {
                                    confirm: true,
                                }
                            })
                            spinner.hide();
                        } else {
                            let params = {
                                NombreUsuario: nombreUsuario,
                                Email: email
                            };
                            $.ajax({
                                type: "POST",
                                url: 'index.aspx/RevisarUsuario',
                                data: JSON.stringify(params),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                async: true,
                                success: function (data) {
                                    console.log(data.d)
                                    if (data.d != "") {
                                        let params2 = {
                                            NombreUsuario: nombreUsuario,
                                            Email: email,
                                            Contrasenna: contrasena
                                        };

                                        $.ajax({
                                            type: "POST",
                                            url: 'index.aspx/CambiarContrasenna',
                                            data: JSON.stringify(params2),
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            async: true,
                                            success: function () {

                                                swal({
                                                    text: "Se ha cambiado la contraseña correctamente",
                                                    type: "success",
                                                    icon: "success",
                                                    time: 3000,
                                                    buttons: {
                                                        confirm: true,
                                                    }
                                                })
                                                document.getElementById("nombreUsuario").value = "";
                                                document.getElementById("email").value = "";
                                                document.getElementById("contrasena").value = "";
                                                document.getElementById("confContrasena").value = "";

                                            },
                                            error: function (result) {
                                                alert("Error");
                                            }
                                        })

                                        spinner.hide();
                                    } else {
                                        swal({
                                            text: "El usuario o el email son incorrectos",
                                            type: "error",
                                            icon: "error",
                                            time: 3000,
                                            buttons: {
                                                confirm: true,
                                            }
                                        })
                                        spinner.hide();
                                    }

                                },
                                error: function (result) {
                                    alert("Error");
                                }
                            })
                        }
                    } else {
                        swal({
                            text: "Debe rellenar todos los campos",
                            type: "error",
                            icon: "error",
                            time: 3000,
                            buttons: {
                                confirm: true,
                            }
                        })
                        spinner.hide();
                    }
                }, 500);

            });
        });

    </script>
</body>
</html>
