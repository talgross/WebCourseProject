using System;

namespace WebProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

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