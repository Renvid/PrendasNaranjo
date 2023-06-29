var spinner = $("#loader");
var idGenero = 0;
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
            url: "Generos.aspx/AllTable",
            
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var cuerpo = "";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find("Genero");

                if (data.d.length > 0) {    
                    $(info).each(function () {
                        var Activo = "Género Inactivo";
                        if ($(this).find("Activo").text() == 1)
                            Activo = "Género Activo"
                        cuerpo += "<tr  alt='Editar' title='Editar'  style='cursor: pointer;' id='" + $(this).find("idGenero").text() + "' onClick='btnEdit_click(this.id)' >\
<td>" + $(this).find("NombreGenero").text() + "</td> \
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
    document.getElementById("txtNombreGenero").value = "";
    document.getElementById("cbActivo").checked = true;
    document.getElementById("titleModal").innerHTML = "Nuevo";
    idGenero = 0;

    $("#myModal").modal("toggle");
}

function btnEdit_click(clicked_id) {

    var params = "{ idGenero:'" + clicked_id + "' }";
    $.ajax({
        type: "POST",
        url: "Generos.aspx/One",
        data: params,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {

            var xmlDoc = $.parseXML(data.d);
            var xml = $(xmlDoc);
            var info = xml.find("Genero");

            $(info).each(function () {
                document.getElementById("txtNombreGenero").value = $(this).find("NombreGenero").text();
                if ($(this).find("Activo").text() == 1)
                    document.getElementById("cbActivo").checked = true
                else
                    document.getElementById("cbActivo").checked = false

                idGenero = clicked_id;
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

    var NombreGenero = document.getElementById("txtNombreGenero").value;

    if (NombreGenero.trim() == "") {
        isGood = false;
        document.getElementById("txtNombreGenero").focus();
        $("#txtNombreGenero").popover("enable");
        $("#txtNombreGenero").popover("toggle");

        setTimeout(function () {
            $("#txtNombreGenero").popover("toggle");
            $("#txtNombreGenero").popover("disable");
        }, 3000);
    }

    return isGood;
}

function btnAccept() {



    var NombreGenero = document.getElementById("txtNombreGenero").value;
    var Activo = "0";
    if (document.getElementById("cbActivo").checked == true)
        Activo = "1";

    if (validate()) {
        spinner.show();
        setTimeout(function () {

            var params = {
                idGenero: idGenero,
                NombreGenero: NombreGenero,
                Activo: Activo
            };

            $.ajax({
                type: "POST",
                url: "Generos.aspx/NewUpdate",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {

                    fillTable();
                    if (idGenero == 0) {
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
