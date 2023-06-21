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
    public partial class Generos : System.Web.UI.Page
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

            DataSet ds = DAL.GenerosDAL.All();
            return ds.GetXml();
        }

        //Funcion para crear o actualizar el formulario 
        [WebMethod]
        public static void NewUpdate(int idGenero, string NombreGenero, int Activo)
        {
            if (idGenero == 0)
            {
                DAL.GenerosDAL.New(NombreGenero, Activo);
            }
            else
            {
                DAL.GenerosDAL.Update(idGenero, NombreGenero, Activo);
            }
        }


        //Funcion que retorna un elemento 
        [WebMethod]
        public static string One(int idGenero)
        {
            DataSet ds = DAL.GenerosDAL.One(idGenero);
            return ds.GetXml();
        }


    }
}