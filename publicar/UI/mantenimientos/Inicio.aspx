<%@ Page Title="" Language="C#" MasterPageFile="~/UI/master/master.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="J_AND_M.UI.mantenimientos.WebForm1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <script src="../style/js/jquery-3.3.1.min.js"></script>
    <link href="../style/css/select2.min.css" rel="stylesheet" />
    <link href="../style/OwnJS/myStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 1.5%; min-width: 97%">
        <div class="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <h2 style="text-transform: none;">Presentación inicial</h2>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <h2>Carousel inicial</h2>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label>Titulo primer imagen</label>
                                        <input id="txtTitulo1_1" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group">
                                        <label>Texto primer imagen</label>
                                        <input id="txtTexto" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group">
                                        <label>Url Imagen</label>
                                        <input id="txtImagenCorrusel1" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <image style="width: 250px; height: 250px" id="imagenCorrusel1" src="../style/img/banner/banner-1.jpg"></image>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label>Titulo segunda imagen</label>
                                        <input id="txtTitulo2" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group">
                                        <label>Texto segunda imagen</label>
                                        <input id="txtTexto_1" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group">
                                        <label>Url Imagen</label>
                                        <input id="txtImagenCorrusel2" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <image style="width: 250px; height: 250px" id="imagenCorrusel2" src="../style/img/banner/banner-1.jpg"></image>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="form-group col-12 col-lg-4">
                                    <label>Color de categorías</label>
                                    <input id="txtColorCategoria" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                </div>
                                <div class="form-group col-12 col-lg-4">
                                    <label>Catálogo de ropa</label>
                                    <input id="txtCatalogo" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                </div>
                                <div class="form-group col-12 col-lg-4">
                                    <label>Lista de precios</label>
                                    <input id="txtListaPrecios" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                </div>
                            </div>
                            <hr />
                            <div class="d-flex justify-content-center">
                                <h2>Imagenes pantalla principal</h2>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-12 col-lg-4">
                                    <div class="form-group">
                                        <label>Texto</label>
                                        <input id="txtSubTexto1" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group">
                                        <label>URL Imagen</label>
                                        <input id="txtImgRuta1" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <image style="width: 250px; height: 250px" id="imagen_Ruta1" src="../style/img/banner/banner-1.jpg"></image>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-4">
                                    <div class="form-group">
                                        <label>Texto 2</label>
                                        <input id="txtSubTexto2" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group">
                                        <label>Url Imagen</label>
                                        <input id="txtImgRuta2" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <image style="width: 250px; height: 250px" id="imagen_Ruta2" src="../style/img/banner/banner-1.jpg"></image>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-4">

                                    <div class="form-group">
                                        <label>Texto 3</label>
                                        <input id="txtSubTexto3" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group">
                                        <label>Url Imagen</label>
                                        <input id="txtImgRuta3" type="text" class="form-control" required="required" data-placement="right" data-content="Este campo es requerido." />
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <image style="width: 250px; height: 250px" id="imagen_Ruta3" src="../style/img/banner/banner-1.jpg"></image>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary" onclick="btnAccept();">Actualizar</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="js/Inicio.js"></script>
    <script>
        if (localStorage.getItem('Usuario') != "1") {
            window.location.href = "../inicio/inicio.aspx";
        }
    </script>
</asp:Content>
