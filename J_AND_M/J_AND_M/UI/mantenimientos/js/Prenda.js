var spinner = $("#loader");
var idPrenda = 0;
$(document).ready(function () {
    spinner.show();
    setTimeout(function () {
        combo1ParamSinPlaceHolder2ddl("Generos", "AllTable", "Genero", "idGenero", "NombreGenero", "ddlGenero","ddlGeneroModal");
        combo1ParamSinPlaceHolder("Categoria", "AllTable", "Categoria", "idCategoria", "Nombre", "ddlCategoria");
        fillTable();
    }, 500);
});



//Funcion para crear la tabla 
function fillTable() {
    spinner.show();

    setTimeout(function () {
        var valorGenero = 0;
        if (document.getElementById("ddlGenero").value != "")
            valorGenero = document.getElementById("ddlGenero").value

        var params = "{ idGenero:'" + valorGenero + "' }";

        $.ajax({
            type: "POST",
            url: "Prenda.aspx/AllTable",
            contentType: "application/json; charset=utf-8",
            data: params,
            dataType: "json",
            async: false,
            success: function (data) {
                var cuerpo = "";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Prendas");

                $(info).each(function () {
                    var MasVendido = "No";
                    var Nuevo = "No";
                    var Agotado = "No";
                    if ($(this).find("MasVendido").text() == 1)
                        MasVendido = "Si"

                    if ($(this).find("Nuevo").text() == 1)
                        Nuevo = "Si"


                    if ($(this).find("Agotado").text() == 1)
                        Agotado = "Si"


                    cuerpo += "<tr  alt='Editar' title='Editar'  style='cursor: pointer;'>\
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' ><image class='rounded-circle' style='max-height:60px;max-width:60px;'  src='" + $(this).find("UrlImg").text() + "'></image></td> \
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' > " + $(this).find("Nombre").text() + "</td > \
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' >" + $(this).find("Precio").text() + "</td> \
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' >" + $(this).find("NombreGenero").text() + "</td> \
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' >" + $(this).find("NombreCategoria").text() + "</td> \
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' >" + MasVendido + "</td> \
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' >" + Nuevo + "</td> \
                            <td onClick='btnEdit_click(" + $(this).find("idPrenda").text() + ")' >" + Agotado + "</td> \
                            <td><button type='button'' class='btn btn-danger'' onclick='EliminarPrenda(" + $(this).find("idPrenda").text() + ");'>Eliminar</button></td> \
                            </tr>";
                })


                document.getElementById("cuerpoTb").innerHTML = cuerpo;

            },
            error: function (result) {
                alert("Error");
            }
        }).done(function (data) {
            spinner.hide();
        });
    }, 500);
}

function cambioImagen() {
    if (document.getElementById("txtUrlImg").value=="")
        document.getElementById("imagen_Ruta").src = "../style/img/banner/banner-1.jpg";
    else
        document.getElementById("imagen_Ruta").src = document.getElementById("txtUrlImg").value;
}

function EliminarPrenda(id) {
    Swal.fire({
        title: 'Está seguro que desea eliminar la prenda?',
        text: "Esta acción no se puede revertir!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            var params = "{ idPrenda:'" + id + "' }";
            $.ajax({
                type: "POST",
                url: "Prenda.aspx/Delete",
                data: params,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {

                    Swal.fire(
                        'Eliminado!',
                        'La prenda fue eliminada correctamente',
                        'success'
                    )
                    fillTable();
                },
                error: function (result) {
                    alert("Error");
                }
            });
        }
    })
}

function limpiarPantalla() {
    document.getElementById("txtNombre").value = "";
    document.getElementById("txtPrecio").value = "";
    document.getElementById("txtUrlImg").value = "";
    document.getElementById("imagen_Ruta").src = "../style/img/banner/banner-1.jpg";
    document.getElementById("cbNuevo").checked = true;
    document.getElementById("cbMasVendido").checked = false;
    document.getElementById("cbAgotado").checked = false;


    document.getElementById("titleModal").innerHTML = "Nuevo";
    idPrenda = 0;
}

//Funciones para crear o actualizar el formulario
function btnNew() {
    document.getElementById("txtNombre").value = "";
    document.getElementById("txtPrecio").value = "";
    document.getElementById("txtUrlImg").value = "";
    document.getElementById("imagen_Ruta").src = "../style/img/banner/banner-1.jpg";
    document.getElementById("cbNuevo").checked = true;
    document.getElementById("cbMasVendido").checked = false;
    document.getElementById("cbAgotado").checked = false;

    document.getElementById("titleModal").innerHTML = "Nuevo";
    idPrenda = 0;

    $("#myModal").modal("toggle");
}

function btnEdit_click(clicked_id) {
    //document.getElementById("divStatus").style.display = "block";

    var params = "{ idPrenda:'" + clicked_id + "' }";
    $.ajax({
        type: "POST",
        url: "Prenda.aspx/One",
        data: params,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {

            var xmlDoc = $.parseXML(data.d);
            var xml = $(xmlDoc);
            var info = xml.find("Prendas");

            $(info).each(function () {
                document.getElementById("txtNombre").value = $(this).find("Nombre").text();
                document.getElementById("txtPrecio").value = $(this).find("Precio").text();
                document.getElementById("txtUrlImg").value = $(this).find("UrlImg").text();
                document.getElementById("imagen_Ruta").src = $(this).find("UrlImg").text();

                document.getElementById("ddlCategoria").value = $(this).find("idCategoria").text();
                $("#ddlCategoria").select2({
                    placeholder: $(this).find("NombreCategoria").text()
                });

                document.getElementById("ddlGeneroModal").value = $(this).find("idGenero").text();
                $("#ddlGeneroModal").select2({
                    placeholder: $(this).find("NombreGenero").text()
                });

                if ($(this).find("MasVendido").text() == 1)
                    document.getElementById("cbMasVendido").checked = true
                else
                    document.getElementById("cbMasVendido").checked = false

                if ($(this).find("Nuevo").text() == 1)
                    document.getElementById("cbNuevo").checked = true
                else
                    document.getElementById("cbNuevo").checked = false

                if ($(this).find("Agotado").text() == 1)
                    document.getElementById("cbAgotado").checked = true
                else
                    document.getElementById("cbAgotado").checked = false

                idPrenda = clicked_id;
                document.getElementById("titleModal").innerHTML = "Actualizar";

                $("#myModal").modal("toggle");
            });
        },
        error: function (result) {
            alert("Error");
        }
    });

}

//Funcion para validar el formulario
function validate() {
    var isGood = true;

    var Nombre = document.getElementById("txtNombre").value;

    if (Nombre.trim() == "") {
        isGood = false;
        document.getElementById("txtNombre").focus();
        $("#txtNombre").popover("enable");
        $("#txtNombre").popover("toggle");
        setTimeout(function () {
            $("#txtNombre").popover("toggle");
            $("#txtNombre").popover("disable");
        }, 3000);
    }
    var Precio = document.getElementById("txtPrecio").value;

    if (Precio.trim() == "") {
        isGood = false;
        document.getElementById("txtPrecio").focus();
        $("#txtPrecio").popover("enable");
        $("#txtPrecio").popover("toggle");
        setTimeout(function () {
            $("#txtPrecio").popover("toggle");
            $("#txtPrecio").popover("disable");
        }, 3000);
    }
    var UrlImg = document.getElementById("txtUrlImg").value;

    if (UrlImg.trim() == "") {
        isGood = false;
        document.getElementById("txtUrlImg").focus();
        $("#txtUrlImg").popover("enable");
        $("#txtUrlImg").popover("toggle");
        setTimeout(function () {
            $("#txtUrlImg").popover("toggle");
            $("#txtUrlImg").popover("disable");
        }, 3000);
    }

    return isGood;
}

function btnAccept() {
    var Nombre = document.getElementById("txtNombre").value;
    var Precio = document.getElementById("txtPrecio").value;
    var UrlImg = document.getElementById("txtUrlImg").value;
    var idGenero = document.getElementById("ddlGeneroModal").value;
    var idCategoria = document.getElementById("ddlCategoria").value;
    var Nuevo = "0";
    if (document.getElementById("cbNuevo").checked == true)
        Nuevo = "1";

    var MasVendido = "0";
    if (document.getElementById("cbMasVendido").checked == true)
        MasVendido = "1";

    var Agotado = "0";
    if (document.getElementById("cbAgotado").checked == true)
        Agotado = "1";


    if (validate()) {
        spinner.show();
        setTimeout(function () {

            var params = {
                idPrenda: idPrenda,
                Nombre: Nombre,
                Precio: Precio,
                UrlImg: UrlImg,
                idGenero: idGenero,
                idCategoria: idCategoria,
                MasVendido: MasVendido,
                Nuevo: Nuevo,
                Agotado: Agotado
            };

            $.ajax({
                type: "POST",
                url: "Prenda.aspx/NewUpdate",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {

                    fillTable();
                    if (idPrenda == 0) {
                        New()
                        limpiarPantalla();
                    }
                    else {
                        Update()
                        $("#myModal").modal("toggle");
                        limpiarPantalla();
                    }

                },
                error: function (result) {
                    alert("Error");
                }
            });
        }, 500);
    }
}

//Mensajes de confirmacion de acciones para el usuario

function New() {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Se ha creado con éxito!',
        showConfirmButton: false,
        timer: 1500
    })
};

function Update() {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Se ha actualizado con éxito!',
        showConfirmButton: false,
        timer: 1500
    })
};


function Drive() {
        var text = document.getElementById("txtUrlImg").value;
    document.getElementById("txtUrlImg").value = "https://drive.google.com/uc?export=download&id=" + text.substring(32, 65);
    document.getElementById("imagen_Ruta").src = "https://drive.google.com/uc?export=download&id=" + text.substring(32, 65);
}