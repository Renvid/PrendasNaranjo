using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace J_AND_M.UI.inicio
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string PrendasNuevas()
        {

            DataSet ds = DAL.PrendaDAL.PrendasNuevas();
            return ds.GetXml();
        }
        [WebMethod]
        public static string PrendasMasVendidas()
        {

            DataSet ds = DAL.PrendaDAL.PrendasMasVendidas();
            return ds.GetXml();
        }
    }
}