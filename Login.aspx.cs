using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // w/o submit
                error.Visible = false;
            }
            else
            {
                // after submit
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if(mail.Text == "a@a.com" && password.Text == "123")
            {
                // redirect to home page
                Session["user"] = mail.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                // show error message
                error.Text = "error login, try again ..";
                error.Visible = true;
            }
        }
    }
}