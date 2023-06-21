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
    public partial class Prenda : System.Web.UI.Page
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
        public static string AllTable(int idGenero)
        {

            DataSet ds = DAL.PrendaDAL.All(idGenero);
            return ds.GetXml();
        }

        //Funcion para crear o actualizar el formulario 
        [WebMethod]
        public static void NewUpdate(int idPrenda, string Nombre, string Precio, string UrlImg, int idGenero, int idCategoria, int MasVendido, int Nuevo, int Agotado)
        {
            if (idPrenda == 0)
            {
                DAL.PrendaDAL.New(Nombre, Precio, UrlImg, idGenero, idCategoria, MasVendido, Nuevo, Agotado);
            }
            else
            {
                DAL.PrendaDAL.Update(idPrenda, Nombre, Precio, UrlImg, idGenero, idCategoria, MasVendido, Nuevo, Agotado);
            }
        }


        //Funcion que retorna un elemento 
        [WebMethod]
        public static string One(int idPrenda)
        {
            DataSet ds = DAL.PrendaDAL.One(idPrenda);
            return ds.GetXml();
        }

        //Funcion para eliminar prendas
        [WebMethod]
        public static void Delete(int idPrenda)
        {
            DAL.PrendaDAL.Delete(idPrenda);
        }

    }
}