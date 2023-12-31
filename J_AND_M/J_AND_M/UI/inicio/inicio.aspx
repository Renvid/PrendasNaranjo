﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UI/master/master.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="J_AND_M.UI.inicio.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media only screen and (max-width: 480px) {
            img {
                width: 100%;
            }
        }
    </style>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section Begin -->
    <section class="hero" style="width: 100%">
        <div class="hero__slider owl-carousel" id="carouselPrincipal">
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic d-flex justify-content-end">
                            <img id="txtImgRuta1" src=".." alt="" style="max-width: 45%">
                        </div>
                        <div class="banner__item__text">
                            <h2 id="txtSubTexto1"></h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img id="txtImgRuta2" src=".." alt="" style="max-width: 60%">
                        </div>
                        <div class="banner__item__text">
                            <h2 id="txtSubTexto2"></h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic d-flex justify-content-end">
                            <img id="txtImgRuta3" src=".." alt="" style="max-width: 45%">
                        </div>
                        <div class="banner__item__text">
                            <h2 id="txtSubTexto3"></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Productos estrella</li>
                        <li data-filter=".mas-vendido">Productos en tendencia</li>
                        <li data-filter=".nuevas" id="btnMasvendido">Productos nuevos</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter" id="PrendasNuevas_Vendida">
            </div>
        </div>

    </section>
    <!-- Product Section End -->


    <!-- Footer Section Begin -->
    <div class="row">
        <div class="col-lg-12 text-center">
            <div class="footer__copyright__text">
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: rgba(192,192,192,0.6);">
                <!-- Modal Header -->
                <div class="modal-header">


                    <a id="downloadLink" class="btn btn-dark" download style="font-size: 35px">Descargar Imagen</a>


                    <button type="button" class="close" style="font-size: 35px" data-dismiss="modal">&times;</button>

                </div>


            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="form-group">
                    <image src="" id="imgModal"></image>
                </div>

            </div>

        </div>
    </div>

    <!-- Footer Section End -->


    <script src="../servicios/servicios.js"></script>

    <script type="text/javascript">

        var TipoUsuario = "normal";

        if (localStorage.getItem('Usuario') != null && localStorage.getItem('Usuario') != "null") {
            TipoUsuario = "admin";
        } else {
            TipoUsuario = "normal";
        }

        $(document).ready(async () => {

            $("#carouselPrincipal").owlCarousel({
                nav: true,
                items: 2
            });



            $.ajax({
                type: "POST",
                url: "../mantenimientos/Inicio.aspx/AllTable",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find("Inicio");


                    $(info).each(function () {
                        var comillaSimple = "'";
                        var cuerpo = '<div class="hero__items set-bg" style="background: url(' + comillaSimple + '' + $(this).find("Imagen_Carrousel_1").text() + '' + comillaSimple + ');background-repeat: no-repeat;background-size: cover; background-attachment: fixed;">\
                        <div class="container">\
                            <div class="row">\
                                <div class="col-xl-5 col-lg-7 col-md-8">\
                                    <div class="hero__text">\
                                        <h2>'+ $(this).find("Titulo1_1").text() + '</h2>\
                                        <h4>'+ $(this).find("Texto").text() + '</h4>\
                                    </div>\
                                </div>\
                            </div>\
                </div>\
            </div>';
                        $('#carouselPrincipal').trigger('add.owl.carousel', [cuerpo])
                            .trigger('refresh.owl.carousel');
                        var cuerpo2 = '<div class="hero__items set-bg"  style="background: url(' + comillaSimple + '' + $(this).find("Imagen_Carrousel_2").text() + '' + comillaSimple + ');background-repeat: no-repeat;background-size: cover;">\
                        <div class="container">\
                            <div class="row">\
                                <div class="col-xl-5 col-lg-7 col-md-8">\
                                    <div class="hero__text">\
                                        <h1>'+ $(this).find("Titulo2").text() + '</h1>\
                                        <h3>'+ $(this).find("Texto_1").text() + '</h3>\
                                    </div>\
                                </div>\
                            </div>\
                </div>\
            </div>';
                        $('#carouselPrincipal').trigger('add.owl.carousel', [cuerpo2])
                            .trigger('refresh.owl.carousel');

                        document.getElementById("txtSubTexto1").innerHTML = $(this).find("SubTexto1").text();
                        document.getElementById("txtImgRuta1").src = $(this).find("ImgRuta1").text();
                        document.getElementById("txtSubTexto2").innerHTML = $(this).find("SubTexto2").text();
                        document.getElementById("txtImgRuta2").src = $(this).find("ImgRuta2").text();
                        document.getElementById("txtSubTexto3").innerHTML = $(this).find("SubTexto3").text();
                        document.getElementById("txtImgRuta3").src = $(this).find("ImgRuta3").text();
                    })

                },
                error: function (result) {
                    alert("Error");
                }
            })


        });

        function test(url) {
            document.getElementById("imgModal").src = url;
            document.getElementById("downloadLink").href = url;
            $("#myModal").modal("toggle");
        }

        $.ajax({
            type: "POST",
            url: "inicio.aspx/PrendasNuevas",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Prendas");

                var cuerpo = "";
                $(info).each(function () {
                    var Precio = "";
                    if (TipoUsuario == "admin") {
                        Precio = '<h5>₡ ' + $(this).find("Precio").text() + '</h5>';
                    }

                    cuerpo += '<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix nuevas">\
                        <div class="product__item">\
                        <div class="product__item__pic set-bg d-flex justify-content-center">\
                        <img onerror="retryImageLoad(this,\''+ $(this).find("UrlImg").text() + '\')"  onclick="test(\'' + $(this).find("UrlImg").text() + '\')" style="max-width:65%" src="' + $(this).find("UrlImg").text() + '" />\
                        </div>\
                        <div class="product__item__text">\
                              <center>\
                            <h6>'+ $(this).find("Nombre").text() + '</h6>\
                            <a href="#">'+ $(this).find("Nombre").text() + '</a>\
                            '+ Precio + '\
                            </center>\
                        </div>\
                    </div >\
                </div> '
                })
                document.getElementById("PrendasNuevas_Vendida").innerHTML += cuerpo;

            },
            error: function (result) {
                alert("Error");
            }
        })


        $.ajax({
            type: "POST",
            url: "inicio.aspx/PrendasMasVendidas",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Prendas");

                var cuerpo = "";
                $(info).each(function () {
                    var Precio = "";
                    if (TipoUsuario == "admin") {
                        Precio = '<h5>₡ ' + $(this).find("Precio").text() + '</h5>';
                    }

                    cuerpo += '<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix mas-vendido">\
                        <div class="product__item">\
                        <div class="product__item__pic set-bg d-flex justify-content-center">\
                        <img onerror="retryImageLoad(this,\''+ $(this).find("UrlImg").text() + '\')"  onclick="test(\'' + $(this).find("UrlImg").text() + '\')" style="max-width:65%" src="' + $(this).find("UrlImg").text() + '" />\
                        </div>\
                        <div class="product__item__text">\
                        <center>\
                            <h6>'+ $(this).find("Nombre").text() + '</h6>\
                            <a href="#">'+ $(this).find("Nombre").text() + '</a>\
                            '+ Precio + '\
                            </center>\
                        </div>\
                    </div >\
                </div> '
                })
                document.getElementById("PrendasNuevas_Vendida").innerHTML += cuerpo;

            },
            error: function (result) {
                alert("Error");
            }
        })

        function retryImageLoad(img, URL) {
            const maxRetries = 10;
            let retries = 0;

            function loadImg() {
                img.src = URL;
            }

            img.onerror = function () {
                if (retries < maxRetries) {
                    retries++;
                    loadImg();
                } else {
                    // Aquí puedes hacer algo si la imagen no carga después de varios intentos.
                    console.log('No se pudo cargar la imagen después de varios intentos.' + URL);
                }
            };

            loadImg(); // Inicia el primer intento de carga.
        }

    </script>
</asp:Content>
