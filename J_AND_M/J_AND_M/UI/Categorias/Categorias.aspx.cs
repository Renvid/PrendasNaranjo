using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace J_AND_M.UI.Categorias
{
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Generos()
        {
            DataSet ds = DAL.GenerosDAL.All_Activo();
            return ds.GetXml();
        }

        [WebMethod]
        public static string CategoriasPorGenero(int idGenero)
        {
            DataSet ds = DAL.CategoriaDAL.CategoriasPorGenero(idGenero);
            return ds.GetXml();
        }

        [WebMethod]
        public static string Prendas_Por_Categoria(int idGenero,int idCategoria)
        {
            DataSet ds = DAL.PrendaDAL.Prendas_Por_Categoria(idGenero,idCategoria);
            return ds.GetXml();
        }

        [WebMethod]
        public static string Categoria_Nombre(string Nombre)
        {
            DataSet ds = DAL.CategoriaDAL.spCategoria_Nombre(Nombre);
            return ds.GetXml();
        }
    }
}