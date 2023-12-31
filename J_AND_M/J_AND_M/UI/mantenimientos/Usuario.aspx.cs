﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace J_AND_M.UI.mantenimientos
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }


        // ******************* Scripts Ajax - Json *********************//
        //Funcion filtrar los datos de la tabla 
        [WebMethod]
        public static string AllTable()
        {

            DataSet ds = DAL.UsuarioDAL.All();
            return ds.GetXml();
        }

        //Funcion para crear o actualizar el formulario 
        [WebMethod]
        public static void NewUpdate(int idUsuario, string Nombre, string Email, string NombreUsuario, string Contrasennia, string Telefono, string fecha, int Tipo
                                    , string apellidos, string mayorista, int activo, string provincia, string canton, string distrito, string direccion, string observaciones)
        {
            if (idUsuario == 0)
            {
                DAL.UsuarioDAL.New(Nombre, Email, NombreUsuario, Contrasennia, Telefono, fecha, Tipo, apellidos, mayorista, activo, provincia, canton, distrito, direccion, observaciones);
            }
            else
            {
                DAL.UsuarioDAL.Update(idUsuario, Nombre, Email, NombreUsuario, Contrasennia, Telefono, fecha, Tipo, apellidos, mayorista, activo, provincia, canton, distrito, direccion, observaciones);
            }
        }


        //Funcion que retorna un elemento 
        [WebMethod]
        public static string One(int idUsuario)
        {
            DataSet ds = DAL.UsuarioDAL.One(idUsuario);
            return ds.GetXml();
        }

    }
}