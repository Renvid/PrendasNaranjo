<%@ Page Title="" Language="C#" MasterPageFile="~/UI/master/master.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="J_AND_M.UI.Categorias.Categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .modal-content {
            background-color: rgba(192, 192, 192, 0.6);
        }

        #imgModal {
            display: block;
            margin-left: auto;
            margin-right: auto;
            max-width: 100%;
            height: auto;
        }

        /*   modal responsive*/
        @media (max-width: 767px) {
            .modal-dialog {
                max-width: 100%;
                margin: 1rem;
            }

            #imgModal {
                max-width: 90%;
                height: auto;
            }
        }


        input{
            outline:none;
            box-sizing: border-box;
            height:60px;
            width: 0;
            padding: 0 20px;
            color: black;
            border-radius: 50px;
            font-size: 20px;
            border: 1px solid #0026ff;
            transition: all .7s ease;
        }

        ::placeholder{
            color: grey;
        }

        .btn{
            position: absolute;
           
            width: 50px;
            height:50px;
            background: #0026ff;
            border-radius: 80px;
            text-align: center;
            cursor: pointer;
            transition: .5s;
        }

        .btn i{
            font-size: 25px;
            color: white;
            line-height: 30px;
            transition: all .7s ease;
        }

        .container:hover input{
            width: 350px;
        }

        .container:hover i{
            transform: rotate(-360deg);
        }

        .btn:hover{
            background:#0026ff
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Categorias</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Inicio</a>
                            <span>Categorias</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
   <section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form class="search-form">
                    <input type="text" placeholder="Buscar...">
                    <div class="btn">
                    <i class="fa fa-search"></i>
                        </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="shop__sidebar">
                    <div class="shop__sidebar__accordion">
                        <div class="accordion" id="accordionExample">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="row" id="divPrendasCategoria">
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: rgba(192,192,192,0.6);">
                <!-- Modal Header -->
                <div class="modal-header">


                    <a id="downloadLink" href="#" download><i class="fa fa-floppy-o" style="color: black"></i></a>


                    <button type="button" class="close" data-dismiss="modal">&times;</button>

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





    <script type="text/javascript">

        $.ajax({
            type: "POST",
            url: "Categorias.aspx/Generos",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Genero");

                var cuerpo = "";
                $(info).each(function () {

                    cuerpo += '<div class="card">\
                        <div class="card-heading">\
                            <a data-toggle="collapse" data-target="#collapse'+ $(this).find("NombreGenero").text() + '">' + $(this).find("NombreGenero").text() + '</a>\
                                    </div >\
                        <div id="collapse'+ $(this).find("NombreGenero").text() + '" class="collapse show" data-parent="#accordionExample">\
                            <div class="card-body">\
                                <div class="shop__sidebar__categories">\
                                    <ul class="nice-scroll">'



                    var params = "{ idGenero:'" + $(this).find("idGenero").text() + "' }";
                    $.ajax({
                        type: "POST",
                        url: "Categorias.aspx/CategoriasPorGenero",
                        data: params,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (data) {
                            var xmlDoc = $.parseXML(data.d);
                            var xml = $(xmlDoc);
                            var info = xml.find("Categoria");

                            $(info).each(function () {

                                cuerpo += '<li style="cursor:pointer"><a onclick="PrendasPorCategoria(' + $(this).find("idGenero").text() + ',' + $(this).find("idCategoria").text() + ')">' + $(this).find("NombreCategoria").text() + '</a></li>'
                            })
                            cuerpo += '</ul>\
                                </div>\
                            </div>\
                        </div>\
                                </div> '
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })

                document.getElementById("accordionExample").innerHTML += cuerpo;
            },
            error: function (result) {
                alert("Error");
            }
        })


        function PrendasPorCategoria(Genero, Categoria) {
            var params = "{ idGenero:'" + Genero + "',idCategoria:'" + Categoria + "' }";
            $.ajax({
                type: "POST",
                url: "Categorias.aspx/Prendas_Por_Categoria",
                data: params,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find("Prendas");
                    var cuerpo = "";
                    console.log(info)
                    $(info).each(function () {

                        cuerpo += '<div class="col-lg-4 col-md-6 col-sm-6" onclick="test(\'' + $(this).find("UrlImg").text() + '\')">\
                            <div class="product__item">\
                        <div class="product__item__pic set-bg d-flex justify-content-center">\
                        <img style="max-width:65%" src="'+ $(this).find("UrlImg").text() + '" />\
                        </div>\
                        <div class="product__item__text">\
                              <center>\
                            <h6>'+ $(this).find("Nombre").text() + '</h6>\
                            <a href="https://wa.me/50662596907" target="_blank"><i class="fa fa-whatsapp"></i></a>\
                            <h5>₡ '+ $(this).find("Precio").text() + '</h5>\
                            </center>\
                        </div>\
                            </div>\
                        </div>'
                    })

                    document.getElementById("divPrendasCategoria").innerHTML = cuerpo;

                },
                error: function (result) {
                    alert("Error");
                }

            })
        }

        function test(url) {
            document.getElementById("imgModal").src = url;
            document.getElementById("downloadLink").href = url;
            $("#myModal").modal("toggle");
        }



    </script>
</asp:Content>
