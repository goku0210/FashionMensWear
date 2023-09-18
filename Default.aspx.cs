using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["addproduct"] = "false";
            if (Request.QueryString["diff"] != null)
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource1;
                DataList1.DataBind();
            }
            else
            {
                Response.Redirect("Default.aspx?diff=prod");
            }
        }
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            DataList1.DataSourceID = null;
            DataList1.DataSource = SqlDataSource3;
            DataList1.DataBind();
        }
    }
    protected void Datalist1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "viewdetails")
        {
            Response.Redirect("Proddetails.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}
