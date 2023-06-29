var spinner = $("#loader");
var idCategoria = 0;
$(document).ready(function () {
    spinner.show();
    setTimeout(function () {
        //En está sección se cargan los dropdown o las demás funciones  
    }, 500);
    fillTable();
});



//Funcion para crear la tabla 
function fillTable() {
    spinner.show();

    setTimeout(function () {

        $.ajax({
            type: "POST",
            url: "Categoria.aspx/AllTable",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var cuerpo = "";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Categoria");

                if (data.d.length > 0) {
                    $(info).each(function () {
                        var Activo = "Categoría Inactiva";
                        if ($(this).find("Activo").text() == 1)
                            Activo = "Categoría Activa"
                        cuerpo += "<tr  alt='Editar' title='Editar'  style='cursor: pointer;' id='" + $(this).find("idCategoria").text() + "' onClick='btnEdit_click(this.id)' >\
<td>" + $(this).find("Nombre").text() + "</td> \
<td>" + Activo + "</td> \
</tr>";
                    })
                }
                else {
                }

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


//Funciones para crear o actualizar el formulario
function btnNew() {
    document.getElementById("txtNombre").value = "";
    document.getElementById("cbActivo").checked = true;
    document.getElementById("titleModal").innerHTML = "Nuevo";
    idCategoria = 0;

    $("#myModal").modal("toggle");
}

function btnEdit_click(clicked_id) {

    var params = "{ idCategoria:'" + clicked_id + "' }";
    $.ajax({
        type: "POST",
        url: "Categoria.aspx/One",
        data: params,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {

            var xmlDoc = $.parseXML(data.d);
            var xml = $(xmlDoc);
            var info = xml.find("Categoria");

            $(info).each(function () {
                document.getElementById("txtNombre").value = $(this).find("Nombre").text();

                if ($(this).find("Activo").text() == 1)
                    document.getElementById("cbActivo").checked = true
                else
                    document.getElementById("cbActivo").checked = false


                idCategoria = clicked_id;
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

    return isGood;
}

function btnAccept() {



    var Nombre = document.getElementById("txtNombre").value;
    var Activo = "0";
    if (document.getElementById("cbActivo").checked == true)
        Activo = "1";
    if (validate()) {
        spinner.show();
        setTimeout(function () {

            var params = {
                idCategoria: idCategoria,
                Nombre: Nombre,
                Activo: Activo
            };

            $.ajax({
                type: "POST",
                url: "Categoria.aspx/NewUpdate",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {

                    fillTable();
                    if (idCategoria == 0) {
                        New() 
                    }
                    else {
                        Update()
                    }
                    $("#myModal").modal("toggle");

                },
                error: function (result) {
                    alert("Error");
                }
            });
        }, 500);
    }
}


