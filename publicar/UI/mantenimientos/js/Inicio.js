var spinner = $("#loader");
var Titulo1 = 0;
$(document).ready(function () {
    spinner.show();
    cargarInicial();
});




//Funcion para crear la tabla 
function cargarInicial() {
    spinner.show();

    setTimeout(function () {

        $.ajax({
            type: "POST",
            url: "Inicio.aspx/AllTable",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Inicio");


                    $(info).each(function () {
                        document.getElementById("txtTitulo2").value = $(this).find("Titulo2").text();
                        document.getElementById("txtTexto").value = $(this).find("Texto").text();
                        document.getElementById("txtTitulo1_1").value = $(this).find("Titulo1_1").text();
                        document.getElementById("txtTexto_1").value = $(this).find("Texto_1").text();
                        document.getElementById("txtSubTexto1").value = $(this).find("SubTexto1").text();
                        document.getElementById("txtImgRuta1").value = $(this).find("ImgRuta1").text();
                        document.getElementById("txtSubTexto2").value = $(this).find("SubTexto2").text();
                        document.getElementById("txtImgRuta2").value = $(this).find("ImgRuta2").text();
                        document.getElementById("txtSubTexto3").value = $(this).find("SubTexto3").text();
                        document.getElementById("txtImgRuta3").value = $(this).find("ImgRuta3").text();

                        document.getElementById("imagen_Ruta1").src = $(this).find("ImgRuta1").text();
                        document.getElementById("imagen_Ruta2").src = $(this).find("ImgRuta2").text();
                        document.getElementById("imagen_Ruta3").src = $(this).find("ImgRuta3").text();

                        document.getElementById("txtImagenCorrusel1").value = $(this).find("Imagen_Carrousel_1").text();
                        document.getElementById("txtImagenCorrusel2").value = $(this).find("Imagen_Carrousel_2").text();
                        document.getElementById("txtColorCategoria").value = $(this).find("Color_Categoria").text();

                        document.getElementById("imagenCorrusel1").src = $(this).find("Imagen_Carrousel_1").text();
                        document.getElementById("imagenCorrusel2").src = $(this).find("Imagen_Carrousel_2").text();
                    })

            },
            error: function (result) {
                alert("Error");
            }
        }).done(function (data) {
            spinner.hide();
        });
    }, 500);
}

function btnAccept() {



    var Titulo2 = document.getElementById("txtTitulo2").value;
    var Texto = document.getElementById("txtTexto").value;
    var Titulo1_1 = document.getElementById("txtTitulo1_1").value;
    var Titulo2_2 = "";
    var Texto_1 = document.getElementById("txtTexto_1").value;
    var SubTexto1 = document.getElementById("txtSubTexto1").value;
    var ImgRuta1 = document.getElementById("txtImgRuta1").value;
    var SubTexto2 = document.getElementById("txtSubTexto2").value;
    var ImgRuta2 = document.getElementById("txtImgRuta2").value;
    var SubTexto3 = document.getElementById("txtSubTexto3").value;
    var ImgRuta3 = document.getElementById("txtImgRuta3").value;
    var Imagen_Carrousel_1 = document.getElementById("txtImagenCorrusel1").value;
    var Imagen_Carrousel_2 = document.getElementById("txtImagenCorrusel2").value;
    var ColorCategoria = document.getElementById("txtColorCategoria").value;

        spinner.show();
        setTimeout(function () {

            var params = {
                Titulo1: Titulo1,
                Titulo2: Titulo2,
                Texto: Texto,
                Titulo1_1: Titulo1_1,
                Titulo2_2: Titulo2_2,
                Texto_1: Texto_1,
                SubTexto1: SubTexto1,
                ImgRuta1: ImgRuta1,
                SubTexto2: SubTexto2,
                ImgRuta2: ImgRuta2,
                SubTexto3: SubTexto3,
                ImgRuta3: ImgRuta3,
                Imagen_Carrousel_1: Imagen_Carrousel_1,
                Imagen_Carrousel_2: Imagen_Carrousel_2,
                ColorCategoria: ColorCategoria
            };

            $.ajax({
                type: "POST",
                url: "Inicio.aspx/NewUpdate",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    cargarInicial();

                },
                error: function (result) {
                    alert("Error");
                }
            });
        }, 500);
}