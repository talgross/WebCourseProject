using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                hText.InnerText = string.Format("Welcome {0} !", Convert.ToString(Session["user"]));
            }
        }

        protected void hLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
        }
    }
}