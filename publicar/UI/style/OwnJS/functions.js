//Combo con id
function comboID2Param(PageName, MethodName, TableName, IdTable,idDDL, Para1, Para2, ddlName) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option></option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option id="' + $(this).find("" + idDDL + "").text() + '" value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' / ' + $(this).find("" + Para2 + "").text() + ' </option>';
                })
                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2({
                    placeholder: "Seleccione alguna opción"
                });
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

function comboID3Param(PageName, MethodName, TableName, IdTable, idDDL, Para1, Para2,Para3, ddlName) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option></option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option id="' + $(this).find("" + idDDL + "").text() + '" value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' / ' + $(this).find("" + Para2 + "").text() + ' / ' + $(this).find("" + Para3 + "").text() + ' </option>';
                })
                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2({
                    placeholder: "Seleccione alguna opción"
                });
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

//Funciones para cargar todos los tipos de combos

function combo1ParamMultiple(PageName, MethodName, TableName, IdTable, Para1, ddlName,Array) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option value='0'> Todos </option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');
                
                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                    Array.push($(this).find("" + IdTable + "").text());
                })
                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").val(0);

            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

function combo1ParamSinPlaceHolder2ddl(PageName, MethodName, TableName, IdTable, Para1, ddlName,ddlName2) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                })

                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2();

                $("#" + ddlName2 + "").empty();
                $("#" + ddlName2 + "").append(cuerpo);

                $("#" + ddlName2 + "").select2();
            }
        },
        error: function (xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            alert(err.Message);
        }
    });
}

function combo1ParamSinPlaceHolder(PageName, MethodName, TableName, IdTable, Para1, ddlName) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                })

                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2();
            }
        },
        error: function (xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            alert(err.Message);
        }
    });
}

function combo1Param(PageName, MethodName, TableName, IdTable, Para1, ddlName) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option></option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                })

                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2({
                    placeholder: "Seleccione alguna opción"
                });
            }
        },
        error: function (xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            alert(err.Message);
        }
    });
}

function combo2ParamInt(PageName, MethodName, TableName, IdTable, Para1,Para2, ddlName, param) {

    params = {
        Param: param
    }
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        data: JSON.stringify(params),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option></option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' / ' + $(this).find("" + Para2 + "").text() + ' </option>';
                })
                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2({
                    placeholder: "Seleccione alguna opción"
                });
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

function combo1ParamInt(PageName, MethodName, TableName, IdTable, Para1, ddlName, param) {

    params = {
        Param: param
    }
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        data: JSON.stringify(params),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option></option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                })
                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2({
                    placeholder: "Seleccione alguna opción"
                });
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

function combo2Param(PageName, MethodName, TableName, IdTable, Para1, Para2, ddlName) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option></option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' / ' + $(this).find("" + Para2 + "").text() + ' </option>';
                })
                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2({
                    placeholder: "Seleccione alguna opción"
                });
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

function combo3Param(PageName, MethodName, TableName, IdTable, Para1, Para2, Para3, ddlName) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data.d.length > 0) {
                var cuerpo = "<option></option>";
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');

                $(info).each(function () {
                    cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' / ' + $(this).find("" + Para2 + "").text() + ' / ' + $(this).find("" + Para3 + "").text() + '</option>';
                })
                $("#" + ddlName + "").empty();
                $("#" + ddlName + "").append(cuerpo);

                $("#" + ddlName + "").select2({
                    placeholder: "Seleccione alguna opción"
                });
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
}

//Funciones para cagar un combo dependiente del otro

function comboDp1ParamMultiple(PageName, MethodName, TableName, IdTable, Para1, ddlName, ParaSearch, ParaSearchValue,arreglo) {

    if (ParaSearchValue != "") {
        var params = "{ " + ParaSearch + ":'" + ParaSearchValue + "' }";
        $.ajax({
            type: "POST",
            url: '' + PageName + '.aspx/' + MethodName + '',
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.d.length > 0) {
                    var cuerpo = "<option value='0'> Todos </option>";
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find('' + TableName + '');
                    
                    $(info).each(function () {
                        cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                        arreglo.push($(this).find("" + IdTable + "").text());
                    })

                    $("#" + ddlName + "").empty();
                    $("#" + ddlName + "").append(cuerpo);

                    $("#" + ddlName + "").val(0);
                }
            },
            error: function (result) {
                alert("Error");
            }
        });
    }
}

function comboDp1Param(PageName, MethodName, TableName, IdTable, Para1, ddlName, ParaSearch, ParaSearchValue) {

    if (ParaSearchValue != "") {

        var params = "{ " + ParaSearch + ":'" + ParaSearchValue + "' }";
        $.ajax({
            type: "POST",
            url: '' + PageName + '.aspx/' + MethodName + '',
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.d.length > 0) {
                    var cuerpo = "<option></option>";
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find('' + TableName + '');

                    $(info).each(function () {
                        cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                    })
                    if (cuerpo == "<option></option>") {
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "Sin Registros"
                        });
                    } else {
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "Seleccione alguna opción"
                        });
                    }
                    $("#" + ddlName + "").empty();
                    $("#" + ddlName + "").append(cuerpo);
                }
            },
            error: function (result) {
                alert("Error");
            }
        });
    } else {
        var cuerpo = "<option></option>";
        $("#" + ddlName + "").append(cuerpo);
        $("#" + ddlName + "").select2({
            
            placeholder: "Sin Registros"
        });
    }
}

function comboDp1ParamCosechaActual(PageName, MethodName, TableName, IdTable, Para1, ddlName, ParaSearch, ParaSearchValue) {

    if (ParaSearchValue != "") {

        var params = "{ " + ParaSearch + ":'" + ParaSearchValue + "' }";
        $.ajax({
            type: "POST",
            url: '' + PageName + '.aspx/' + MethodName + '',
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.d.length > 0) {
                    var cuerpo = "";
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find('' + TableName + '');

                    var ValueCosechaActual = "";


                    $(info).each(function () {
                        cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                        if (parseInt($(this).find("COSECHA_ACTUAL").text()) == 1) //CosechaActual
                            ValueCosechaActual = $(this).find("" + IdTable + "").text();
                    })
                    if (cuerpo == "<option></option>") {
                        $("#" + ddlName + "").select2({

                            placeholder: "Sin Registros"
                        });
                    } else {
                        $("#" + ddlName + "").empty();
                        $("#" + ddlName + "").append(cuerpo);

                        document.getElementById("" + ddlName + "").value = ValueCosechaActual;
                        $("#" + ddlName + "").select2({
                            placeholder: ValueCosechaActual
                        });
                    }
                }
            },
            error: function (result) {
                alert("Error");
            }
        });
    } else {
        var cuerpo = "<option></option>";
        $("#" + ddlName + "").append(cuerpo);
        $("#" + ddlName + "").select2({

            placeholder: "Sin Registros"
        });
    }
}




function comboDp1ParamProject(PageName, MethodName, TableName, IdTable, Para1, ddlName, ParaSearch, ParaSearchValue) {

    if (ParaSearchValue != "") {
        var params = "{ " + ParaSearch + ":'" + ParaSearchValue + "' }";
        $.ajax({
            type: "POST",
            url: '' + PageName + '.aspx/' + MethodName + '',
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.d.length > 0) {
                    var cuerpo = "<option></option>";
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find('' + TableName + '');

                    $(info).each(function () {
                        cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' </option>';
                    })
                    if (cuerpo == "<option></option>") {
                        cuerpo = "<option value='0'>N/A</option>";
                        $("#" + ddlName + "").append(cuerpo);
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "N/A"
                        });
                    } else {
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "Seleccione alguna opción"
                        });
                    }
                    $("#" + ddlName + "").empty();
                    $("#" + ddlName + "").append(cuerpo);
                }
            },
            error: function (result) {

            }
        });
    } else {
        var cuerpo = "<option value='0'>N/A</option>";
        $("#" + ddlName + "").append(cuerpo);
        $("#" + ddlName + "").select2({
            
            placeholder: "N/A"
        });
    }
}

function comboDp2Param(PageName, MethodName, TableName, IdTable, Para1, Para2, ddlName, ParaSearch, ParaSearchValue) {
    if (ParaSearchValue != "") {
        var params = "{ " + ParaSearch + ":'" + ParaSearchValue + "' }";
        $.ajax({
            type: "POST",
            url: '' + PageName + '.aspx/' + MethodName + '',
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.d.length > 0) {
                    var cuerpo = "<option></option>";
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find('' + TableName + '');

                    $(info).each(function () {
                        cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' / ' + $(this).find("" + Para2 + "").text() + ' </option>';
                    })
                    if (cuerpo == "<option></option>") {
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "Sin Registros"
                        });
                    } else {
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "Seleccione alguna opción"
                        });
                    }
                    $("#" + ddlName + "").empty();
                    $("#" + ddlName + "").append(cuerpo);
                }
            },
            error: function (result) {
                alert("Error");
            }
        });
    } else {
        var cuerpo = "<option></option>";
        $("#" + ddlName + "").append(cuerpo);
        $("#" + ddlName + "").select2({
            
            placeholder: "Sin Registros"
        });
    }
}

function comboDp3Param(PageName, MethodName, TableName, IdTable, Para1, Para2, Para3, ddlName, ParaSearch, ParaSearchValue) {
    if (ParaSearchValue != "") {
        var params = "{ " + ParaSearch + ":'" + ParaSearchValue + "' }";
        $.ajax({
            type: "POST",
            url: '' + PageName + '.aspx/' + MethodName + '',
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.d.length > 0) {
                    var cuerpo = "<option></option>";
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var info = xml.find('' + TableName + '');

                    $(info).each(function () {
                        cuerpo += '<option value="' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + ' / ' + $(this).find("" + Para2 + "").text() + ' / ' + $(this).find("" + Para3 + "").text() + '</option>';
                    })
                    if (cuerpo == "<option></option>") {
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "Sin Registros"
                        });
                    } else {
                        $("#" + ddlName + "").select2({
                            
                            placeholder: "Seleccione alguna opción"
                        });
                    }
                    $("#" + ddlName + "").empty();
                    $("#" + ddlName + "").append(cuerpo);
                }
            },
            error: function (result) {
                alert("Error");
            }
        });
    } else {
        var cuerpo = "<option></option>";
        $("#" + ddlName + "").append(cuerpo);
        $("#" + ddlName + "").select2({
            
            placeholder: "Sin Registros"
        });
    }
}

//Funcion para cargar una lista
function lista1Para(PageName, MethodName, TableName, IdTable, Para1, listName , ArrayName) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            var cuerpo = "";

            if (data.d.length > 0) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');
                $(info).each(function () {
                    cuerpo += '<li class="list-group-item" data-id="8" style="cursor: pointer;">\
                                  <div class="custom-control custom-switch">\
                                      <input type="checkbox" class="custom-control-input" id="'+ IdTable + '' + $(this).find("" + IdTable + "").text() +'" />\
                                      <label class="custom-control-label" for="'+ IdTable + '' + $(this).find("" + IdTable + "").text() + '">' + $(this).find("" + Para1 + "").text() + '</label>\
                                  </div>\
                               </li>';
                    ArrayName.push($(this).find("" + IdTable + "").text());
                })

                $("#" + listName+"").empty();
                $("#" + listName +"").append(cuerpo);
            }
            else {

            }

        },
        error: function (result) {
            alert("Error");
        }
    })
}

function lista2Para(PageName, MethodName, TableName, IdTable, Para1,Para2, listName, ArrayName, DescPara1, DescPara2) {
    $.ajax({
        type: "POST",
        url: '' + PageName + '.aspx/' + MethodName + '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            var cuerpo = "";

            if (data.d.length > 0) {
                var xmlDoc = $.parseXML(data.d);
                var xml = $(xmlDoc);
                var info = xml.find('' + TableName + '');
                $(info).each(function () {
                    cuerpo += '<li class="list-group-item" data-id="8" style="cursor: pointer;">\
                                  <div class="custom-control custom-switch">\
                                      <input type="checkbox" class="custom-control-input" id="'+ IdTable + '' + $(this).find("" + IdTable + "").text() + '" />\
                                      <label class="custom-control-label" for="'+ IdTable + '' + $(this).find("" + IdTable + "").text() + '">' + DescPara1 + ':  ' + $(this).find("" + Para1 + "").text() + ' / ' + DescPara2+':  ' + $(this).find("" + Para2 + "").text() + '</label>\
                                  </div>\
                               </li>';
                    ArrayName.push($(this).find("" + IdTable + "").text());
                })

                $("#" + listName + "").empty();
                $("#" + listName + "").append(cuerpo);
            }
            else {

            }

        },
        error: function (result) {
            alert("Error");
        }
    })
}

//Funcion para cargar calendarios
function Calendar(NameTXT) {
    $("#" + NameTXT+"").datepicker({
        autoclose: true,
        todayHighlight: true,
        dateFormat: 'dd/mm/yy'
    });

}

//funcion para cargar texbox con solo tiempo 
function Timer(NameTXT) {
    $('#' + NameTXT+'').timeEntry();
}

//Carga el datatable de la tabla
function loadTable(elemento) {
    $("#gvTable").DataTable().destroy();
    $("#cuerpoTb").empty();
    $("#cuerpoTb").append(elemento);

    var table = $("#gvTable").DataTable({
        "responsive": true,
        "autoWidth": false,
        "lengthMenu": [[-1,10,25, 50, 100, 200], ["Todo",10, 25, 50, 100, 200]],
        "sPaginationType": "full_numbers",
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "<<",
                "sLast": ">>",
                "sNext": ">",
                "sPrevious": "<"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });

};


//Solo permite introducir numeros.
function soloNumeros(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    var isGood = true;
    
    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57)) {
        isGood = false;
    }       

    if (charCode >= 96 && charCode <= 105) {
        isGood = true;
    }

    if (charCode === 37 || charCode === 39) {
        isGood = true;
    }

    if (charCode === 192 || charCode === 222) {
      
        isGood = false;
    }
    
    return isGood;
}


//Metodo para motrar un modal encima del otro
//$(document).on('show.bs.modal', '.modal', function (event) {
//    var zIndex = 1040 + (10 * $('.modal:visible').length);
//    $(this).css('z-index', zIndex);
//    setTimeout(function () {
//        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
//    }, 0);
//});

function resetearDropDown(ddlName) {
    document.getElementById("" + ddlName + "").value = "";
    $("#" + ddlName + "").select2({
        
        placeholder: "Seleccione alguna opción"
    });
}