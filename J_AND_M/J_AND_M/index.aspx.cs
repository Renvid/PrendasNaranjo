using System;
using System.Collections.Generic;
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
        public static bool login(string user, string password)
        {
            if((user=="mnavarro" && password =="Volcano18*")|| (user == "jzuniga" && password == "jenni2022*"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}