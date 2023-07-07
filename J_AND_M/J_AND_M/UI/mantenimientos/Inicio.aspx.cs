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
    public partial class WebForm1 : System.Web.UI.Page
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

            DataSet ds = DAL.InicioDAL.All();
            return ds.GetXml();
        }

        //Funcion para crear o actualizar el formulario 
        [WebMethod]
        public static void NewUpdate(int Titulo1, string Titulo2, string Texto, string Titulo1_1, string Titulo2_2, string Texto_1, string SubTexto1, string ImgRuta1, string SubTexto2, string ImgRuta2, string SubTexto3, string ImgRuta3
            , string Imagen_Carrousel_1, string Imagen_Carrousel_2, string ColorCategoria, string Catalogo, string ListaPrecios)
        {
           DAL.InicioDAL.Update(Titulo1, Titulo2, Texto, Titulo1_1, Titulo2_2, Texto_1, SubTexto1, 
               ImgRuta1, SubTexto2, ImgRuta2, SubTexto3, ImgRuta3, Imagen_Carrousel_1, Imagen_Carrousel_2, ColorCategoria,Catalogo,ListaPrecios);
        }


    }
}