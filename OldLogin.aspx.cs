using System;
using System.Collections.Generic;

namespace lab8
{
    public partial class WebForm1 : System.Web.UI.Page
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

        protected void btn_Click(object sender, EventArgs e)
        {
            string enteredUsername = this.user.Text;
            string enteredPassword = this.password.Text;
            bool loginSuccessful = false;
            foreach (var existingUser in users)
            {
                if (existingUser.userName.Equals(enteredUsername) && existingUser.password.Equals(enteredPassword))
                {
                    // do stuff
                    loginSuccessful = true;
                    Response.Redirect("SecondPage.aspx");
                }
            }

            if (loginSuccessful == false)
            {
                this.errorMsg.Visible = true;
            }
            else
            {
                this.errorMsg.Visible = false;
            }
        }
    }
}