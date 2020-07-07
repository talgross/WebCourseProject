using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class SecondPageWithMasterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new WebProjectEntities())
            {

                var courses = db.courses;

                foreach (var course in courses)
                {
                    var courseTreeNode = new TreeNode() { Text = course.courseName };
                    var courseAssignments = db.assignments.Where(a => a.courseID == course.courseID);
                    foreach (var assignment in courseAssignments)
                    {
                        var assingmentTreeNode = new AssignmentTreeNodeView(assignment.assignmentID, assignment.assignmentName, course.courseID, course.courseName);
                        courseTreeNode.ChildNodes.Add(assingmentTreeNode);
                    }
                    treeView.Nodes.Add(courseTreeNode);
                }
            }
        }

        protected void SelectedNodeChanged()
        {

        }
        protected void hLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
        }

        internal class AssignmentTreeNodeView : TreeNode
        {
            public AssignmentTreeNodeView(int assignmentID, string assignmentName, int courseID, string courseName)
            {
                AssignmentID = assignmentID;
                AssignmentName = assignmentName;

                this.Text = this.AssignmentName; // Set the text of the node
                CourseID = courseID;
                CourseName = courseName;
            }

            public int AssignmentID { get; set; }
            public string AssignmentName { get; set; }
            public int CourseID { get; set; }
            public string CourseName { get; set; }
        }
    }
}