using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class LeftMenu : System.Web.UI.UserControl
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

        private void assignmentTreeNode_SelectedNodeChanged()
        {

        }

        internal class AssignmentTreeNodeView : TreeNode
        {
            public int AssignmentID { get; set; }
            public string AssignmentName { get; set; }
            public int CourseID { get; set; }
            public string CourseName { get; set; }
        }

    }
}