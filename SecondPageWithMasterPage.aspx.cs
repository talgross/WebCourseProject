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

                        var assingmentTreeNode = new TreeNode() { Text = assignment.assignmentName };
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
    }
}