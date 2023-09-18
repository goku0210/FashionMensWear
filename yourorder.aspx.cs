using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class yourorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {
                Label14.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label14.Text = "0";
            }
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            if (Session["username"] == null)
            {
                if (Request.Form["username"] != null)
                {
                    if (checkusername() == true)
                    {
                        Session["username"] = Request.Form["username"];
                        Response.Redirect("yourorder.aspx");
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
    private Boolean checkusername()
    {
        Boolean validlogin = false;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True";
        SqlConnection scon = new SqlConnection(mycon);
        String myquery = "select * from admin where username='" + Request.Form["username"].ToString() + "'";
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx?signout=true");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label sno = GridView1.Rows[e.RowIndex].FindControl("Label6") as Label;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        String updatedata = "delete from orderdet where sno=" + sno.Text;
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Label13.Text = "Your Order is Successfully Cancelled";
        GridView1.EditIndex = -1;
        SqlDataSource1.DataBind();
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
    }
}
