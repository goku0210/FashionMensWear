using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Proddetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["addproduct"] = "false";
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Session["addproduct"] = "true";
        Response.Redirect("Addtocart.aspx?id=" + e.CommandArgument.ToString());
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
