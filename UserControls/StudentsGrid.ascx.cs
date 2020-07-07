using System;
using System.Collections.Generic;
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