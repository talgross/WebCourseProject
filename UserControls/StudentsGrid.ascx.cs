using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject.UserControls
{
    public partial class StudentsGrid : System.Web.UI.UserControl
    {
        //public SortDirection GridViewSortDirection
        //{
        //    get
        //    {
        //        if (ViewState["SortDirection"] == null)
        //            ViewState["SortDirection"] = SortDirection.Ascending;

        //        return (SortDirection)ViewState["SortDirection"];
        //    }
        //    set { ViewState["SortDirection"] = value; }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    var s = GridData();
            //    var data = JsonConvert.DeserializeObject(s);
            //    gvData.DataSource = data;
            //    gvData.DataBind();                
            //}
        }

        public void SetGridViewDataSource(TreeView treeView)
        {
            var selectedNode = treeView.SelectedNode;

            using (var db = new WebProjectEntities())
            {
                int parentEndIndex = selectedNode.ValuePath.IndexOf('/');
                var course = db.courses.Where(c => c.courseName == selectedNode.ValuePath.Substring(0, parentEndIndex)).ToList()[0];
                var studentsInCourse = db.studentsInCourses.Where(s => s.courseID == course.courseID).ToList();

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] { new DataColumn("StudentID"), new DataColumn("StudentName"), new DataColumn("Grade")});
                dt.Rows.Add(new gridRow() { StudentID = 1, StudentName = "me", Grade = 50 });
                ViewState["data"] = dt;

                this.gridView.DataSource = (DataTable)ViewState["data"];
                //var studentsInfo = db.students.Where(s => studentsInCourse.Contains(s.studentID)
                //    db.students.Where(s1 =>
                //{
                //    var inCourse = db.studentsInCourses.Where(s => s.studentID == s1.studentID && s.courseID == assignmentNode.CourseID);
                //});
            }
        }

        public class gridRow
        {
            public int StudentID { get; set; }
            public string StudentName { get; set; }
            public int Grade { get; set; }
        }

        //private string GridData()
        //{
        //    string readContents;
        //    if (ViewState["data"] == null)
        //    {
        //        var path = string.Format("{0}\\testdata.txt", Server.MapPath("."));
        //        using (StreamReader streamReader = new StreamReader(path, Encoding.UTF8))
        //        {
        //            readContents = streamReader.ReadToEnd();
        //            ViewState["data"] = readContents;
        //        }
        //    }
        //    else
        //    {
        //        readContents = ViewState["data"].ToString();
        //    }
        //    return readContents;            
        //}

        //protected void gvData_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    var s = GridData();
        //    var data = JsonConvert.DeserializeObject(s);

        //    DataView view = data.DefaultView;
        //    view.Sort = String.Format("{0} {1}", e.SortExpression, GridViewSortDirection == SortDirection.Ascending ? "asc" : "desc");

        //    if (GridViewSortDirection == SortDirection.Ascending)
        //        GridViewSortDirection = SortDirection.Descending;
        //    else
        //        GridViewSortDirection = SortDirection.Ascending;

        //    ViewState["SortExpression"] = e.SortExpression;

        //    gvData.DataSource = view;
        //    gvData.DataBind();

        //}

        //protected void gvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    gvData.PageIndex = e.NewPageIndex;
        //    FillGrids();
        //}
    }
}