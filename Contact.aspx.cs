using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Collections.Specialized;

public partial class Contact2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        if (dt != null)
        {
            Label1.Text = dt.Rows.Count.ToString();
        }
        else
        {
            Label1.Text = "0";
        }
        if (Session["username"] == null)
        {
            if (Request.Form["username"] != null)
            {
                if (checkusername() == true)
                {
                    Session["username"] = Request.Form["username"];
                    Response.Redirect("Contact.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx?validlogin=false");
                }
            }
        }
        else
        {
            Label7.Text = Session["username"].ToString(); 
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        String today = DateTime.Now.ToLongDateString().ToString();
        String query = "insert into contact(clientname,emailid,mobileno,message,messagedate) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + today + "')";
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Label6.Text = "Thanks For Contacting Us, We will reach You very Soon.";    
    }
}
