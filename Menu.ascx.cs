using System;

namespace WebProject
{
    public partial class Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clickLogout(object sender, EventArgs e)
        {
            Site1.loggedInLecturer = null;
            Session.Clear();
            Session.Abandon();
            Response.Redirect("LoginWithMasterPage.aspx");
        }
    }
}