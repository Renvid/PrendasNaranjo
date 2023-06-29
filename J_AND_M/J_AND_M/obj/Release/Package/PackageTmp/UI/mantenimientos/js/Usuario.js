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
                    var Tipo = "";
                    if ($(this).find("Tipo").text() == "1") {
                        Tipo = "Admin";
                    } else if ($(this).find("Tipo").text() == "2") {
                        Tipo = "Cliente";
                    }

                    var Activo = "Usuario Inactivo";
                    if ($(this).find("activo").text() == 1)
                        Activo = "Usuario Activo"

                    var Fecha1 = new Date();
                    var Fecha2 = new Date($(this).find("fecha").text());
                    var Difference_In_Time = Fecha1.getTime() - Fecha2.getTime();
                    var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);

                    var Color = " style='cursor: pointer;background-color:white'";
                    if (Activo == "Usuario Inactivo" || (Difference_In_Days > 30 && Tipo == "Cliente")) {
                        Color =" style='cursor: pointer;background-color:lightcoral'"
                    }

                    cuerpo += "<tr alt='Editar' title='Editar'  " + Color+" id='" + $(this).find("idUsuario").text() + "' onClick='btnEdit_click(this.id)' >\
                                    <td>" + $(this).find("Nombre").text() + "</td> \
                                    <td>" + $(this).find("Email").text() + "</td> \
                                    <td>" + $(this).find("NombreUsuario").text() + "</td> \
                                    <td>" + $(this).find("Telefono").text() + "</td> \
                                    <td>" + $(this).find("fecha").text() + "</td> \
                                    <td>" + Activo + "</td> \
                                    <td>" + Tipo + "</td> \
                                   </tr>";
                })

                document.getElementById("cuerpoTb").innerHTML = cuerpo;

                    let table = new DataTable('#gvTable');

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
    document.getElementById("txtFecha").value = "";
    document.getElementById("TipoUsuario").value = "2";
    document.getElementById("cbActivo").checked = true;
    document.getElementById("txtApellidos").value = "";
    document.getElementById("txtMayorista").value = "";
    document.getElementById("txtProvincia").value = "";
    document.getElementById("txtCanton").value = "";
    document.getElementById("txtDistrito").value = "";
    document.getElementById("txtObservaciones").value = "";
    document.getElementById("txtDireccion").value = "";

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
                document.getElementById("txtFecha").value = $(this).find("fecha").text();
                document.getElementById("TipoUsuario").value = $(this).find("Tipo").text();
                $("#TipoUsuario").select2({
                    placeholder: $(this).find("Tipo").text()
                });


                if ($(this).find("activo").text() == 1)
                    document.getElementById("cbActivo").checked = true
                else
                    document.getElementById("cbActivo").checked = false

                document.getElementById("txtApellidos").value = $(this).find("apellidos").text();
                document.getElementById("txtMayorista").value = $(this).find("mayorista").text();
                document.getElementById("txtProvincia").value = $(this).find("provincia").text();
                document.getElementById("txtCanton").value = $(this).find("canton").text();
                document.getElementById("txtDistrito").value = $(this).find("distrito").text();
                document.getElementById("txtDireccion").value = $(this).find("direccion").text();
                document.getElementById("txtObservaciones").value = $(this).find("observaciones").text();

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
    var Fecha = document.getElementById("txtFecha").value;
    var Tipo = document.getElementById("TipoUsuario").value;

    var Activo = "0";
    if (document.getElementById("cbActivo").checked == true)
        Activo = "1";

    var apellidos =document.getElementById("txtApellidos").value 
    var mayorista = document.getElementById("txtMayorista").value 
    var provincia = document.getElementById("txtProvincia").value
    var canton=document.getElementById("txtCanton").value
    var distrito = document.getElementById("txtDistrito").value
    var observaciones =document.getElementById("txtObservaciones").value 
    var direccion =document.getElementById("txtDireccion").value 

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
                fecha: Fecha,
                Tipo: Tipo,
                apellidos: apellidos,
                mayorista: mayorista,
                activo: Activo,
                provincia: provincia,
                canton: canton,
                distrito: distrito,
                direccion: direccion,
                observaciones: observaciones
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
