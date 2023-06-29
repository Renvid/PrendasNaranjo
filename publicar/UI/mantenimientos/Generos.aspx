<%@ Page Title="" Language="C#" MasterPageFile="~/UI/master/master.Master" AutoEventWireup="true" CodeBehind="Generos.aspx.cs" Inherits="J_AND_M.UI.mantenimientos.Generos" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <script src="../style/js/jquery-3.3.1.min.js"></script>
    <link href="../style/css/select2.min.css" rel="stylesheet" />
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
                                    <h2 style="text-transform: none;">Género</h2>
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
                            <div class="table-responsive">
                                <table id="gvTable" class="table table-hover table-bordered" style="text-align: center; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Estado</th>
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
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <label id="titleModal">Nuevo</label>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input id="txtNombreGenero" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>


                                    <div class="form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="cbActivo">
                                            <label class="form-check-label" for="cbActivo" style="cursor: pointer">
                                                Activo
                                            </label>
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
    </div>
    <script src="js/Generos.js"></script>

</asp:Content>
