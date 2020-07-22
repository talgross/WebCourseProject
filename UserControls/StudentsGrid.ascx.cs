using System;
using System.Web.UI.WebControls;

namespace WebProject.UserControls
{
    public partial class StudentsGrid : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["lecturerID"] = Site1.loggedInLecturer.lecturerID;
            Session["grid"] = this.gridView;
        }

        protected void ChangeGrade_Clicked(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            var parent = btn.Parent;
            while (parent.GetType() != typeof(GridViewRow))
            {
                parent = parent.Parent;
            }

            Site1.SelectedGridRow = (GridViewRow)parent;
            Response.Redirect("ViewAssignmentPage.aspx");

        }

        public class GridRow
        {
            public int AssignmentID { get; set; }
            public int StudentID { get; set; }
            public string StudentName { get; set; }
            public int Grade { get; set; }
        }
    }
}