<%@ Page Title="" Language="C#" MasterPageFile="~/UI/master/master.Master" AutoEventWireup="true" CodeBehind="Prenda.aspx.cs" Inherits="J_AND_M.UI.mantenimientos.Prenda" %>



<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="../style/OwnJS/myStyle.css" rel="stylesheet" />
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
                                    <h2 style="text-transform: none;">Productos</h2>
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
                            <div class="d-flex justify-content-between">
                                <div class="form-group">
                                    <label>Género</label>
                                    <select style="width: 100%" id="ddlGenero" onchange="fillTable()">
                                    </select>
                                </div>
                            </div>
                            <hr />
                            <div class="table-responsive">
                                <table id="gvTable" class="table table-hover table-bordered" style="text-align: center; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Imagen</th>
                                            <th>Nombre</th>
                                            <th>Precio</th>
                                            <th>Género</th>
                                            <th>Categoría</th>
                                            <th>Más Vendido</th>
                                            <th>Nuevo</th>
                                            <th>Agotado</th>
                                            <th>Eliminar</th>

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
                        <div class="modal-dialog" style="max-width: 80%">
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
                                            <label>Precio</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1">₡</span>
                                                <input id="txtPrecio" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>UrlImg</label>
                                        <label for="basic-url">Your vanity URL</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon3" style="cursor:pointer" onclick="Drive()">Convertir a formato Drive</span>
                                            </div>
                                            
                                            <input onblur="cambioImagen()" id="txtUrlImg" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                        </div>
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <image style="max-width: 20%" id="imagen_Ruta" src="../style/img/banner/banner-1.jpg"></image>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-12 col-lg-4">
                                            <div class="form-group">
                                                <label>Categoria</label>
                                                <select style="width: 100%" id="ddlCategoria">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="form-group">
                                                <label>Género</label>
                                                <select style="width: 100%; display: block" id="ddlGeneroModal">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="form-group">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="cbMasVendido">
                                                    <label class="form-check-label">
                                                        Más vendido
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="cbNuevo">
                                                    <label class="form-check-label" for="flexCheckChecked">
                                                        Nuevo
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="cbAgotado">
                                                    <label class="form-check-label" for="flexCheckChecked">
                                                        Agotado
                                                    </label>
                                                </div>
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
    <script src="../style/OwnJS/functions.js"></script>
    <script src="js/Prenda.js"></script>
</asp:Content>
