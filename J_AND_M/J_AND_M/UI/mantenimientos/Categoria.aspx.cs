using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace J_AND_M.UI.mantenimientos
{
    public partial class Categoria : System.Web.UI.Page
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

            DataSet ds = DAL.CategoriaDAL.All();
            return ds.GetXml();
        }

        //Funcion para crear o actualizar el formulario 
        [WebMethod]
        public static void NewUpdate(int idCategoria, string Nombre, int Activo)
        {
            if (idCategoria == 0)
            {
                DAL.CategoriaDAL.New(Nombre,Activo);
            }
            else
            {
                DAL.CategoriaDAL.Update(idCategoria, Nombre, Activo);
            }
        }


        //Funcion que retorna un elemento 
        [WebMethod]
        public static string One(int idCategoria)
        {
            DataSet ds = DAL.CategoriaDAL.One(idCategoria);
            return ds.GetXml();
        }

    }
}