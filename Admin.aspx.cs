using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; 

public partial class Admins : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            Label10.Text = Session["username"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBS"].ConnectionString);
        if (productimage.HasFile)
        {
            string filename = productimage.PostedFile.FileName;
            string filepath = "img/" + productimage.FileName;
            productimage.PostedFile.SaveAs(Server.MapPath("~/img/") + filename);
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into adcar values('" + productname.Text + "', '" + filepath + "', '" + price.Text + "', '" + keywordsearch.Text + "', '" + description.Text + "', '" + smalldes.Text + "', '" + cat.Text + "', '" + diff.Text + "')", con);
            Label1.Text = "Product Has Been Added";
            cmd.ExecuteNonQuery();
            con.Close();
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
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx?signout=true");
    }
}
