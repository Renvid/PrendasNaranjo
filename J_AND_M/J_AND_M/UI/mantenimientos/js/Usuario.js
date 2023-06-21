var spinner = $("#loader");
var idUsuario = 0;
$(document).ready(function () {
    spinner.show();
    fillTable();
});



//Funcion para crear la tabla 
function fillTable() {
    spinner.show();

    setTimeout(function () {

        $.ajax({
            type: "POST",
            url: "Usuario.aspx/AllTable",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var cuerpo = "";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Usuario");


                $(info).each(function () {
                    var tipo = "";
                    var Contrasennia = "********************";
                    if ($(this).find("Tipo").text() == "1") {
                        Tipo = "Admin";
                    } else if ($(this).find("Tipo").text() == "2") {
                        Tipo = "Cliente";
                    }

                    cuerpo += "<tr  alt='Editar' title='Editar'  style='cursor: pointer;' id='" + $(this).find("idUsuario").text() + "' onClick='btnEdit_click(this.id)' >\
                                    <td>" + $(this).find("Nombre").text() + "</td> \
                                    <td>" + $(this).find("Email").text() + "</td> \
                                    <td>" + $(this).find("NombreUsuario").text() + "</td> \
                                    <td>" + Contrasennia + "</td> \
                                    <td>" + $(this).find("Telefono").text() + "</td> \
                                    <td>" + $(this).find("Comentarios").text() + "</td> \
                                    <td>" + Tipo + "</td> \
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


//Funciones para crear o actualizar el formulario
function btnNew() {
    document.getElementById("txtNombre").value = "";
    document.getElementById("txtEmail").value = "";
    document.getElementById("txtNombreUsuario").value = "";
    document.getElementById("txtContrasennia").value = "";
    document.getElementById("txtTelefono").value = "";
    document.getElementById("txtComentarios").value = "";
    document.getElementById("TipoUsuario").value = "2";

    document.getElementById("titleModal").innerHTML = "Nuevo";
    idUsuario = 0;

    $("#myModal").modal("toggle");
}

function btnEdit_click(clicked_id) {
    //document.getElementById("divStatus").style.display = "block";

    var params = "{ idUsuario:'" + clicked_id + "' }";
    $.ajax({
        type: "POST",
        url: "Usuario.aspx/One",
        data: params,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {

            var xmlDoc = $.parseXML(data.d);
            var xml = $(xmlDoc);
            var info = xml.find("Usuario");

            $(info).each(function () {
                document.getElementById("txtNombre").value = $(this).find("Nombre").text();
                document.getElementById("txtEmail").value = $(this).find("Email").text();
                document.getElementById("txtNombreUsuario").value = $(this).find("NombreUsuario").text();
                document.getElementById("txtContrasennia").value = $(this).find("Contrasennia").text();
                document.getElementById("txtTelefono").value = $(this).find("Telefono").text();
                document.getElementById("txtComentarios").value = $(this).find("Comentarios").text();
                document.getElementById("TipoUsuario").value = $(this).find("Tipo").text();
                $("#TipoUsuario").select2({
                    placeholder: $(this).find("Tipo").text()
                });
                idUsuario = clicked_id;
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
    var Email = document.getElementById("txtEmail").value;

    if (Email.trim() == "") {
        isGood = false;
        document.getElementById("txtEmail").focus();
        $("#txtEmail").popover("enable");
        $("#txtEmail").popover("toggle");
        setTimeout(function () {
            $("#txtEmail").popover("toggle");
            $("#txtEmail").popover("disable");
        }, 3000);
    }
    var NombreUsuario = document.getElementById("txtNombreUsuario").value;

    if (NombreUsuario.trim() == "") {
        isGood = false;
        document.getElementById("txtNombreUsuario").focus();
        $("#txtNombreUsuario").popover("enable");
        $("#txtNombreUsuario").popover("toggle");
        setTimeout(function () {
            $("#txtNombreUsuario").popover("toggle");
            $("#txtNombreUsuario").popover("disable");
        }, 3000);
    }
    var Contrasennia = document.getElementById("txtContrasennia").value;

    if (Contrasennia.trim() == "") {
        isGood = false;
        document.getElementById("txtContrasennia").focus();
        $("#txtContrasennia").popover("enable");
        $("#txtContrasennia").popover("toggle");
        setTimeout(function () {
            $("#txtContrasennia").popover("toggle");
            $("#txtContrasennia").popover("disable");
        }, 3000);
    }
    var Telefono = document.getElementById("txtTelefono").value;

    if (Telefono.trim() == "") {
        isGood = false;
        document.getElementById("txtTelefono").focus();
        $("#txtTelefono").popover("enable");
        $("#txtTelefono").popover("toggle");
        setTimeout(function () {
            $("#txtTelefono").popover("toggle");
            $("#txtTelefono").popover("disable");
        }, 3000);
    }
    var Comentarios = document.getElementById("txtComentarios").value;

    if (Comentarios.trim() == "") {
        isGood = false;
        document.getElementById("txtComentarios").focus();
        $("#txtComentarios").popover("enable");
        $("#txtComentarios").popover("toggle");
        setTimeout(function () {
            $("#txtComentarios").popover("toggle");
            $("#txtComentarios").popover("disable");
        }, 3000);
    }
    var Tipo = document.getElementById("TipoUsuario").value;

    if (Tipo.trim() == "") {
        isGood = false;
        document.getElementById("TipoUsuario").focus();
        $("#TipoUsuario").popover("enable");
        $("#TipoUsuario").popover("toggle");
        setTimeout(function () {
            $("#TipoUsuario").popover("toggle");
            $("#TipoUsuario").popover("disable");
        }, 3000);
    }

    return isGood;
}

function btnAccept() {



    var Nombre = document.getElementById("txtNombre").value;
    var Email = document.getElementById("txtEmail").value;
    var NombreUsuario = document.getElementById("txtNombreUsuario").value;
    var Contrasennia = document.getElementById("txtContrasennia").value;
    var Telefono = document.getElementById("txtTelefono").value;
    var Comentarios = document.getElementById("txtComentarios").value;
    var Tipo = document.getElementById("TipoUsuario").value;

    if (validate()) {
        spinner.show();
        setTimeout(function () {

            var params = {
                idUsuario: idUsuario,
                Nombre: Nombre,
                Email: Email,
                NombreUsuario: NombreUsuario,
                Contrasennia: Contrasennia,
                Telefono: Telefono,
                Comentarios: Comentarios,
                Tipo: Tipo
            };

            $.ajax({
                type: "POST",
                url: "Usuario.aspx/NewUpdate",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {

                    fillTable();
                    if (idUsuario == 0) {
                        New();
                    }
                    else {
                        Update();
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

//Mensajes de confirmacion de acciones para el usuario

function New() {
    var placementFrom = "top";
    var placementAlign = "right";
    var state = "success";
    var content = {};

    content.message = "Se ha creado con éxito!";
    content.title = "Excelente";

    content.icon = "fa fa-check";

    $.notify(content, {
        type: state,
        placement: {
            from: placementFrom,
            align: placementAlign
        },
        time: 1000,
        delay: 3000,
    });
};

function Update() {
    var placementFrom = "top";
    var placementAlign = "right";
    var state = "warning";
    var content = {};

    content.message = "Se ha actualizado con éxito!";
    content.title = "Excelente";

    content.icon = "fa fa-check";

    $.notify(content, {
        type: state,
        placement: {
            from: placementFrom,
            align: placementAlign
        },
        time: 1000,
        delay: 3000,
    });
};
