using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class grid : System.Web.UI.Page
{
    private DataSet m_dsDomains;
    private String m_strSortExp;
    private SortDirection m_SortDirection = SortDirection.Ascending;

    protected void Page_Load(object sender, EventArgs e)
    {
        GetDomains();
        if (!IsPostBack)
        {
            m_strSortExp = String.Empty;
            LoadData();
        }
        else
        {
            if (null != ViewState["_SortExp_"])
            {
                m_strSortExp = ViewState["_SortExp_"] as String;
            }

            if (null != ViewState["_Direction_"])
            {
                m_SortDirection = (SortDirection)ViewState["_Direction_"];
            }
        }
    }

    private void LoadData(){
        var data = LoadDataTable();
        myGrid.DataSource = data;
        myGrid.DataBind();
    }


    // This is a helper method used to determine the index of the
    // column being sorted. If no column is being sorted, -1 is returned.
    private int GetSortColumnIndex(String strCol)
    {
        foreach (DataControlField field in myGrid.Columns)
        {
            if (field.SortExpression == strCol)
            {
                return myGrid.Columns.IndexOf(field);
            }
        }

        return -1;
    }

    private void AddSortImage(GridViewRow headerRow)
    {
        Int32 iCol = GetSortColumnIndex(m_strSortExp);
        if (-1 == iCol)
        {
            return;
        }
        // Create the sorting image based on the sort direction.
        Image sortImage = new Image();
        if (SortDirection.Ascending == m_SortDirection)
        {
            sortImage.ImageUrl = "img/dwn.gif";
        }
        else
        {
            sortImage.ImageUrl = "img/up.gif";
        }

        // Add the image to the appropriate header cell.
        headerRow.Cells[iCol].Controls.Add(sortImage);
    }

    private void BindGridView()
    {
        String strSort = String.Empty;
        if (null != m_strSortExp &&
            String.Empty != m_strSortExp)
        {
            strSort = String.Format("{0} {1}", m_strSortExp, (m_SortDirection == SortDirection.Descending) ? "DESC" : "ASC");
        }
        DataView dv = new DataView(m_dsDomains.Tables[0], String.Empty, strSort, DataViewRowState.CurrentRows);
        myGrid.DataSource = dv;
        myGrid.DataBind();
    }
    
    protected void OnRowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            if (String.Empty != m_strSortExp)
            {
                AddSortImage(e.Row);
            }
        }
    }

    private void GetDomains()
    {
        if (!IsPostBack)
        {
            m_dsDomains = new DataSet();
            var tb = LoadDataTable();
            m_dsDomains.Tables.Add(tb); 
            Session["_Domains_Set_"] = m_dsDomains;
        }
        else
        {
            m_dsDomains = Session["_Domains_Set_"] as DataSet;
        }
    }


    private void BindData()
    {
        m_dsDomains = Session["_Domains_Set_"] as DataSet;
        myGrid.DataSource = m_dsDomains.Tables[0];
        myGrid.DataBind();
    }

    protected void myGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        myGrid.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void myGrid_Sorting(object sender, GridViewSortEventArgs e)
    {

        if (String.Empty != m_strSortExp)
        {
            if (String.Compare(e.SortExpression, m_strSortExp, true) == 0)
            {
                m_SortDirection = (m_SortDirection == SortDirection.Ascending) ? SortDirection.Descending : SortDirection.Ascending;
            }
        }

        ViewState["_Direction_"] = m_SortDirection;
        ViewState["_SortExp_"] = m_strSortExp = e.SortExpression;

        BindGridView();
    }

    private DataTable LoadDataTable()
    {
        var path = string.Format("{0}\\{1}", Server.MapPath("."),
               WebConfigurationManager.AppSettings["DataFolder"]);
        List<string> readFile = File.ReadAllLines(path).ToList();
        var tb = new DataTable();
        tb.Columns.Add("Name", typeof(string));
        tb.Columns.Add("Bid", typeof(double));
        tb.Columns.Add("TLD", typeof(string));
        tb.Columns.Add("Length", typeof(int));
        for (var i = 1; i < readFile.Count; i++)
        {
            var row = readFile[i].Split('\t');
            var dr = tb.NewRow();
            dr["Name"] = row[0];
            double b;
            bool isNumeric = double.TryParse(row[1], out b);
            dr["Bid"] = isNumeric ? b : 0;
            dr["TLD"] = row[6];
            int l;
            isNumeric = int.TryParse(row[7], out l);
            dr["Length"] = isNumeric ? l : 0;
            tb.Rows.Add(dr);
        }
        return tb;
    }

    


}





public class Domain
{
    public string Name { get; set; }
    public double Bid { get; set; }
    public string TLD { get; set; }
    public int Length { get; set; }

    public Domain(string[] row)
    {
        Name = row[0];
        double b;
        bool isNumeric = double.TryParse(row[1],out b);
        Bid = isNumeric ? b : 0;
        TLD = row[6];
        int l;
        isNumeric = int.TryParse(row[7], out l);
        Length = isNumeric ? l : 0;
    }
}
