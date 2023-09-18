using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class userorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
                Label13.Text = Session["username"].ToString();
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx?signout=true");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sno = GridView1.SelectedRow.Cells[0].Text;
        Response.Redirect("userorders.aspx?sno=" + sno);
    } 
}
