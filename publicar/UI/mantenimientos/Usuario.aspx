<%@ Page Title="" Language="C#" MasterPageFile="~/UI/master/master.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="J_AND_M.UI.mantenimientos.Usuario" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="../style/OwnJS/myStyle.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top: 1.5%; min-width: 97%">
        <div class="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <h2 style="text-transform: none;">Usuarios</h2>
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-border btn-round" onclick="btnNew();">
                                        <span class="btn-label">
                                            <i class="fa fa-plus"></i>
                                        </span>
                                        Nuevo
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <hr />
                            <div class="table-responsive">
                                <table id="gvTable" class="table table-hover table-bordered" style="text-align: center; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Correo</th>
                                            <th>Nombre De Usuario</th>
                                            <th>Teléfono</th>
                                            <th>Fecha última venta</th>
                                            <th>Estado</th>
                                            <th>Tipo</th>
                                        </tr>
                                    </thead>
                                    <tbody id="cuerpoTb">
                                    </tbody>
                                </table>
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>

                    <!-- Modal 1 Nuevo -->
                    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
                        <div class="modal-dialog" style="min-width: 95%">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <label id="titleModal">Nuevo</label>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-12 col-lg-6">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input id="txtNombre" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="form-group">
                                                <label>Apellidos</label>
                                                <input id="txtApellidos" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="form-group">
                                                <label>Correo</label>
                                                <input id="txtEmail" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <div class="form-group">
                                                <label>Teléfono</label>
                                                <input id="txtTelefono" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <div class="form-group">
                                                <label>Nombre del usuario</label>
                                                <input id="txtNombreUsuario" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="form-group">
                                                <label>Contraseña</label>
                                                <div class="input-group mb-3">
                                                    <input id="txtContrasennia" type="password" class="form-control" aria-describedby="basic-addon1" required="required" data-placement="right" data-content="Este campo es requerido.">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <button onclick="mostrarContrasena()"><i class="fa fa-unlock-alt"></i></button>
                                                    </span>
                                                </div>
                                                <script>
                                                    function mostrarContrasena() {
                                                        var inputContrasena = document.getElementById("txtContrasennia");
                                                        inputContrasena.type = "text";

                                                        setTimeout(function () {
                                                            inputContrasena.type = "password";
                                                        }, 500);
                                                    }
                                                </script>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">

                                            <div class="form-group">
                                                <label>Tipo</label>
                                                <select id="TipoUsuario" style="width: 100%" class="form-control">
                                                    <option value="1">Admin</option>
                                                    <option value="2">Cliente</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <div class="form-group">
                                                <label>Fecha última compra</label>
                                                <input id="txtFecha" type="date" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-1">
                                            <div class="form-group" style="margin-top: 39px">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="cbActivo">
                                                    <label class="form-check-label" for="cbActivo" style="cursor: pointer">
                                                        Activo
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="form-group">
                                                <label>Mayorista / Detalle</label>
                                                <input id="txtMayorista" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="form-group">
                                                <label>Dirección</label>
                                                <input id="txtDireccion" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="form-group">
                                                <label>Provincia</label>
                                                <input id="txtProvincia" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="form-group">
                                                <label>Cantón</label>
                                                <input id="txtCanton" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="form-group">
                                                <label>Distrito</label>
                                                <input id="txtDistrito" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Observaciones</label>
                                                <textarea id="txtObservaciones" class="form-control" rows="4" cols="50"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="btnAccept();">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="../style/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="../style/OwnJS/functions.js"></script>
    <script src="js/Usuario.js"></script>
    <script>
        if (localStorage.getItem('Usuario') != "1") {
            window.location.href = "../inicio/inicio.aspx";
        }
    </script>
</asp:Content>
