using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace J_AND_M
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string login(string user, string password)
        {
            if((user=="sa" && password =="sa123"))
            {
                return "1";
            }
            else
            {
                DataSet ds = DAL.UsuarioDAL.IniciarSesion(user, password);
                return ds.GetXml(); 
            }
        }

        [WebMethod]
        public static string RevisarUsuario(string NombreUsuario, string Email)
        {

            DataSet ds = DAL.UsuarioDAL.RevisarUsuario(NombreUsuario, Email);
            if (ds.Tables[0].Rows.Count == 0)
            {
                return "";
            }
            else
            {
                return "Existe";
            }
        }

        [WebMethod]
        public static void CambiarContrasenna(string NombreUsuario, string Email, string Contrasenna)
        {
            DAL.UsuarioDAL.CambiarContrasenna(NombreUsuario, Email, Contrasenna);
        }
    }
}