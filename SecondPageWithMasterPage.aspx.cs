using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using static WebProject.CustomTreeView;
using static WebProject.UserControls.StudentsGrid;

namespace WebProject
{
    public partial class SecondPageWithMasterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (var db = new WebProjectEntities())
                {

                    var courses = db.courses;

                    foreach (var course in courses)
                    {
                        var courseTreeNode = new TreeNode() { Text = course.courseName };
                        courseTreeNode.SelectAction = TreeNodeSelectAction.None;
                        var courseAssignments = db.assignments.Where(a => a.courseID == course.courseID);
                        foreach (var assignment in courseAssignments)
                        {
                            var assingmentTreeNode = new TreeNode();
                            assingmentTreeNode.Text = assignment.assignmentName;
                            //assingmentTreeNode.SelectAction = TreeNodeSelectAction.Select;
                            courseTreeNode.ChildNodes.Add(assingmentTreeNode);
                        }
                        treeView.Nodes.Add(courseTreeNode);
                    }
                }
            }
            else
            {
                StudentsGrid.gridView.DataSource = (DataTable)ViewState["data"];
            }
        }

        protected void SelectedNodeChanged(object sender, EventArgs e)
        {
            var selectedNode = treeView.SelectedNode;

            using (var db = new WebProjectEntities())
            {
                int parentEndIndex = selectedNode.ValuePath.IndexOf('/');
                var course = db.courses.Where(c => c.courseName == selectedNode.ValuePath.Substring(0, parentEndIndex)).ToList()[0];
                var studentsInCourse = db.studentsInCourses.Where(s => s.courseID == course.courseID).ToList();

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] { new DataColumn("StudentID"), new DataColumn("StudentName"), new DataColumn("Grade") });
                dt.Rows.Add(new gridRow() { StudentID = 1, StudentName = "me", Grade = 50 });
                ViewState["data"] = dt;

                StudentsGrid.gridView.DataSource = (DataTable)ViewState["data"];
                StudentsGrid.gridView.DataBind();
                //var studentsInfo = db.students.Where(s => studentsInCourse.Contains(s.studentID)
                //    db.students.Where(s1 =>
                //{
                //    var inCourse = db.studentsInCourses.Where(s => s.studentID == s1.studentID && s.courseID == assignmentNode.CourseID);
                //});
            }
        }
        protected void hLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
        }

        //internal class AssignmentTreeNodeView : TreeNode
        //{
        //    public AssignmentTreeNodeView(int assignmentID, string assignmentName, int courseID, string courseName)
        //    {
        //        AssignmentID = assignmentID;
        //        AssignmentName = assignmentName;

        //        this.Text = this.AssignmentName; // Set the text of the node
        //        CourseID = courseID;
        //        CourseName = courseName;
        //    }

        //    public int AssignmentID { get; set; }
        //    public string AssignmentName { get; set; }
        //    public int CourseID { get; set; }
        //    public string CourseName { get; set; }
        //}
    }
}