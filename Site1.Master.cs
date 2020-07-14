using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        internal static lecturer loggedInLecturer { get; set; } = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}