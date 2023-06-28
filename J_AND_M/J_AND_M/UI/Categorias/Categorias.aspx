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


        input {
            outline: none;
            box-sizing: border-box;
            height: 60px;
            width: 0;
            padding: 0 20px;
            color: black;
            border-radius: 50px;
            font-size: 20px;
            border: 1px solid #0026ff;
            transition: all .7s ease;
        }

        ::placeholder {
            color: grey;
        }

                        
        .download-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .download-button:hover {
            background-color: greenyellow;
        }
              .price-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .price-button:hover {
            background-color: greenyellow;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option" id="color">
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
                <div class="col-lg-12 row">
                    <div class="col-4">
                        <input id="txtBuscar" type="text" class="form-control" placeholder="Buscar...">
                    </div>
                    <div class="col-2">
                        <div class="btn btn-dark" style="margin-top: -5%" onclick=" PrendasPorNombre()">
                            <i class="fa fa-search"></i>
                        </div>
                    </div>
                    <div class="col-2">
                        <button class="btn btn-success" onclick="descargarImagenesDesdeGoogleDrive()">Descargar todas las imagenes</button>
                    </div>
                      <div class="col-2">
                        <a href="https://onedrive.live.com/embed?resid=B39257C85152C73%2189462&authkey=!AN3HEuvtC8Vx0zM&em=2">
                            <button class="download-button">Descargar Catalogo</button>
                        </a>
                    </div>
                      <div class="col-2">
                        <a href="https://onedrive.live.com/embed?resid=B39257C85152C73%2195466&authkey=%21AN3HEuvtC8Vx0zM&width=2480&height=3508" download>
                            <button id="boton" class="price-button">Descargar lista de Precios</button>
                        </a>
                    </div>
                </div>
            </div>
            <hr />
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


                    <a id="downloadLink" style="font-size: 35px" href="#" download><i class="fa fa-floppy-o" style="color: black"></i></a>


                    <button type="button" style="font-size: 35px" class="close" data-dismiss="modal">&times;</button>

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

        var myArray = []; //Link de todas las imagenes


        function descargarImagenesDesdeGoogleDrive() {

            // Función auxiliar para descargar una imagen
            function descargarImagen(url, nombreArchivo) {
                return new Promise((resolve, reject) => {
                    const enlaceTemporal = document.createElement('a');
                    enlaceTemporal.href =  url;
                    enlaceTemporal.download = nombreArchivo;

                    enlaceTemporal.style.display = 'none';
                    document.body.appendChild(enlaceTemporal);

                    // Esperar a que el enlace se haya agregado correctamente antes de hacer click
                    setTimeout(() => {
                        try {
                            enlaceTemporal.click();
                            resolve();
                        } catch (error) {
                            reject(error);
                        } finally {
                            document.body.removeChild(enlaceTemporal);
                        }
                    }, 500);
                });
            }

            // Función principal asincrónica para descargar todas las imágenes
            async function descargarTodasLasImagenes() {
                for (let i = 0; i < myArray.length; i++) {
                    const url = myArray[i];
                    const nombreArchivo = `imagen_${i + 1}.jpg`; // Nombre de archivo único para cada imagen

                    try {
                        await descargarImagen(url, nombreArchivo);
                        console.log(`Imagen ${i + 1} descargada con éxito.`);
                    } catch (error) {
                        console.error(`Error al descargar imagen ${i + 1}:`, error);
                    }
                }
            }

            // Llamar a la función principal asincrónica para descargar las imágenes
            descargarTodasLasImagenes();
        }




        var TipoUsuario = "normal";

        if (localStorage.getItem('Usuario') != null && localStorage.getItem('Usuario') != "null") {
            TipoUsuario = "admin";
        }

        var spinner = $("#loader");

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

                    document.getElementById("color").style.backgroundColor = $(this).find("Color").text();

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
            spinner.show();
            setTimeout(function () {
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

                        myArray = [];

                        $(info).each(function () {

                            var Precio = "";
                            if (TipoUsuario == "admin") {
                                Precio = '<h5>₡ ' + $(this).find("Precio").text() + '</h5>';
                            }

                            myArray.push($(this).find("UrlImg").text());

                            cuerpo += '<div class="col-lg-4 col-md-6 col-sm-6" onclick="test(\'' + $(this).find("UrlImg").text() + '\')">\
                            <div class="product__item">\
                        <div class="product__item__pic set-bg d-flex justify-content-center">\
                        <img style="max-width:65%" src="'+ $(this).find("UrlImg").text() + '" />\
                        </div>\
                        <div class="product__item__text">\
                              <center>\
                            <h6>'+ $(this).find("Nombre").text() + '</h6>\
                            <a href="https://wa.me/50686321956" target="_blank"><i class="fa fa-whatsapp"></i></a>\
                            '+ Precio + '\
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

                }).done(function (data) {
                    spinner.hide();
                });
            }, 500);
        }

        function PrendasPorNombre() {
            spinner.show();
            setTimeout(function () {
                var params = "{ Nombre:'" + document.getElementById("txtBuscar").value + "' }";
                $.ajax({
                    type: "POST",
                    url: "Categorias.aspx/Categoria_Nombre",
                    data: params,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var info = xml.find("Categoria");
                        var cuerpo = "";
                        console.log(info)
                        $(info).each(function () {

                            var Precio = "";
                            if (TipoUsuario == "admin") {
                                Precio = '<h5>₡ ' + $(this).find("Precio").text() + '</h5>';
                            }

                            cuerpo += '<div class="col-lg-4 col-md-6 col-sm-6" onclick="test(\'' + $(this).find("UrlImg").text() + '\')">\
                            <div class="product__item">\
                        <div class="product__item__pic set-bg d-flex justify-content-center">\
                        <img style="max-width:65%" src="'+ $(this).find("UrlImg").text() + '" />\
                        </div>\
                        <div class="product__item__text">\
                              <center>\
                            <h6>'+ $(this).find("Nombre").text() + '</h6>\
                            <a href="https://wa.me/50686321956" target="_blank"><i class="fa fa-whatsapp"></i></a>\
                            '+ Precio + '\
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

                }).done(function (data) {
                    spinner.hide();
                });
            }, 500);
        }


        function test(url) {
            document.getElementById("imgModal").src = url;
            document.getElementById("downloadLink").href = url;
            $("#myModal").modal("toggle");
        }



    </script>
</asp:Content>
