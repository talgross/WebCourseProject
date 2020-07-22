using iTextSharp.text.pdf;
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using static WebProject.UserControls.StudentsGrid;

namespace WebProject
{
    public partial class SecondPageWithMasterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Site1.loggedInLecturer == null)
            {
                Response.Redirect("LoginWithMasterPage.aspx");
            }
            if (!IsPostBack)
            {
                Site1.MainGridView = StudentsGrid.gridView;

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
                            assingmentTreeNode.Value = courseTreeNode.Text + assignment.assignmentName;
                            //assingmentTreeNode.SelectAction = TreeNodeSelectAction.Select;
                            courseTreeNode.ChildNodes.Add(assingmentTreeNode);
                        }
                        treeView.Nodes.Add(courseTreeNode);
                    }
                }

                if (Site1.SelectedTreeNode != null)
                {
                    foreach (TreeNode courseNode in treeView.Nodes)
                    {
                        foreach (TreeNode assingmentNode in courseNode.ChildNodes)
                        {
                            if (assingmentNode.Value == Site1.SelectedTreeNode.Value)
                            {
                                assingmentNode.Select();
                                this.SelectedNodeChanged(this, EventArgs.Empty);
                            }
                        }
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
                var assignment = db.assignments.Where(a => a.assignmentName == selectedNode.Text && a.courseID == course.courseID).ToList().First();
                var grades = db.grades.Where(g => g.assignmentID == assignment.assignmentID).ToList();
                //var students = db.students.Where(s => studentsInCourse.Any(sic => sic.studentID == s.studentID)).ToList();
                var students = db.students.ToList();

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[4] { new DataColumn("AssignmentID"), new DataColumn("StudentID"), new DataColumn("StudentName"), new DataColumn("Grade") });
                foreach (var student in studentsInCourse)
                {
                    //var name = (course.studentsInCourses.First(s => s.studentID == student.studentID));
                    var row = new GridRow()
                    {
                        AssignmentID = assignment.assignmentID,
                        StudentID = student.studentID ?? 0,
                        StudentName = students.Where(s => s.studentID == student.studentID).First().studentName,
                        Grade = grades.Where(g => g.studentID == student.studentID).First().grade1 ?? 0
                    };
                    dt.Rows.Add(row.AssignmentID, row.StudentID, row.StudentName, row.Grade);
                }

                ViewState["data"] = dt;
                Site1.SelectedTreeNode = selectedNode;

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


        //foreach (var c in db.courses.ToList())
        //{
        //    foreach (var a in db.assignments)
        //    {
        //        if (a.courseID == c.courseID)
        //        {
        //            foreach (var s in db.studentsInCourses)
        //            {
        //                if (s.courseID == c.courseID)
        //                {
        //                    using (var file = new PdfReader(@"D:\Program Files\Oracle\Virtual Machines\VM shared folder\Studies\שנה 4\WEB\FakeAssignment.pdf"))
        //                    {
        //                        var page = file.GetPageContent(1);
        //                        var gradeline = new grade() { assignmentID = a.assignmentID, studentID = s.studentID, grade1 = 0, submittedAssignment = page };
        //                        db.grades.Add(gradeline);

        //                    }
        //                }
        //                //var gradeline = new grade() { assignmentID = a.assignmentID, studentID = s.studentID, grade1 = 0 , submittedAssignment};


        //                //db.grades.Add(gradeline);
        //            }
        //        }
        //    }
        //    db.SaveChanges();
        //}

    }
}