using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class newarr2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {
                Label4.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label4.Text = "0";
            }
            Session["addproduct"] = "false";
            if (Request.QueryString["diff"] != null)
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource4;
                DataList1.DataBind();
            }
            else
            {
                Response.Redirect("newarr.aspx?diff=newarr");
            }
            if (Session["username"] == null)
            {
                if (Request.Form["username"] != null)
                {
                    if (checkusername() == true)
                    {
                        Session["username"] = Request.Form["username"];
                        Response.Redirect("newarr.aspx");
                    }
                    else
                    {
                        Response.Redirect("Default.aspx?validlogin=false");
                    }
                }
            }
            else
            {
                Label5.Text = Session["username"].ToString();   
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx?signout=true");
    }
    private Boolean checkusername()
    {
        Boolean validlogin = false;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True";
        SqlConnection scon = new SqlConnection(mycon);
        String myquery = "select * from reglog where username='" + Request.Form["username"].ToString() + "'";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = scon;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        String username;
        String password;
        if (ds.Tables[0].Rows.Count > 0)
        {
            username = ds.Tables[0].Rows[0]["username"].ToString();
            password = ds.Tables[0].Rows[0]["password"].ToString();
            scon.Close();

            if (username == Request.Form["username"].ToString() && password == Request.Form["password"].ToString())
            {
                Session["username"] = username;
                validlogin = true;
            }

        }
        return validlogin;
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
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {   
        if (e.CommandName == "addtocart")
        {
            Session["addproduct"] = "true";
            Response.Redirect("Addtocart.aspx?id=" + e.CommandArgument.ToString());
        }
        if (e.CommandName == "viewdetails")
        {
            Response.Redirect("Proddetails2.aspx?id=" + e.CommandArgument.ToString());
        }
    }  
}
