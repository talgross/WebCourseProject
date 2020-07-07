using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        struct predefinedUserData
        {
            public string userName;
            public string password;
        }

        List<predefinedUserData> users = new List<predefinedUserData>();
        protected void Page_Load(object sender, EventArgs e)
        {
            users.Add(new predefinedUserData() { userName = "user", password = "123" });
            users.Add(new predefinedUserData() { userName = "user2", password = "1234" });

        }

        protected void register_Click(object sender, EventArgs e)
        {
            ShowLogin(false);
        }

        protected void loginLink_Click(object sender, EventArgs e)
        {
            ShowLogin(true);
        }

        private void ShowLogin(bool show)
        {
            login.Visible = show;
            registration.Visible = !show;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string enteredUsername = this.user.Text;
            string enteredPassword = this.password.Text;
            bool loginSuccessful = false;
            using (var db = new WebProjectEntities())
            {

                var lecturers = db.lecturers;

                foreach (var lecturer in lecturers)
                {
                    if(lecturer.userName.Equals(enteredUsername) && lecturer.password.Equals(enteredPassword))
                    {
                        loginSuccessful = true;
                        Response.Redirect(nameof(WebProject.SecondPageWithMasterPage) + ".aspx");
                    }
                }
            }

            if (loginSuccessful == false)
            {
                this.lblError.Visible = true;
            }
            else
            {
                this.lblError.Visible = false;
            }
        }

    }
}