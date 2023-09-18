using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class allproducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            if (Session["username"] == null)
            {
                if (Request.Form["username"] != null)
                {
                    if (checkusername() == true)
                    {
                        Session["username"] = Request.Form["username"];
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("Login.aspx?validlogin=false");
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
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
        Label15.Text = "";
        GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
        Label15.Text = "";
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label designid = GridView1.Rows[e.RowIndex].FindControl("Label14") as Label;
        TextBox productname = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
        TextBox productimage = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
        TextBox price = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
        TextBox keywordSearch = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
        TextBox description = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
        TextBox smalldescription = GridView1.Rows[e.RowIndex].FindControl("TextBox7") as TextBox;
        TextBox Category = GridView1.Rows[e.RowIndex].FindControl("TextBox8") as TextBox;
        TextBox differ = GridView1.Rows[e.RowIndex].FindControl("TextBox9") as TextBox;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        String updatedata = "Update adcar set productname='" + productname.Text + "', productimage='" + productimage.Text + "', price='" + price.Text + "', keywordSearch='" + keywordSearch.Text + "', description='" + description.Text + "', smalldescription='" + smalldescription.Text + "', Category='" + Category.Text + "', differ='" + differ.Text + "' where designid='" + designid.Text + "'";
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Label15.Text = "Data Has been Updated";
        GridView1.EditIndex = -1;
        SqlDataSource1.DataBind();
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label designid = GridView1.Rows[e.RowIndex].FindControl("Label6") as Label;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        String updatedata = "delete from adcar where designid=" + designid.Text;
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Label15.Text = "Data Has been deleted";
        GridView1.EditIndex = -1;
        SqlDataSource1.DataBind();
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx?signout=true");
    }
}
