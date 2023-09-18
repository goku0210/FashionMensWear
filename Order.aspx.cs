using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Net;

public partial class Order : System.Web.UI.Page
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
                        Response.Redirect("Order.aspx");
                    }
                    else
                    {
                        Response.Redirect("Login.aspx?validlogin=false");
                    }
                }
            }
            else
            {
                Label1.Text = Session["username"].ToString();
                Label6.Text = Session["username"].ToString();
            }
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("designid");
            dt.Columns.Add("productname");
            dt.Columns.Add("productimage");
            dt.Columns.Add("price");
            if (Request.QueryString["id"] != null)
            {
                if (Session["Buyitems"] == null)
                {

                    dr = dt.NewRow();
                    String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
                    SqlConnection scon = new SqlConnection(mycon);
                    String myquery = "Select * from adcar where designid=" + Request.QueryString["id"];
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = scon;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = 1;
                    dr["designid"] = ds.Tables[0].Rows[0]["designid"].ToString();
                    dr["productname"] = ds.Tables[0].Rows[0]["productname"].ToString();
                    dr["productimage"] = ds.Tables[0].Rows[0]["productimage"].ToString();
                    dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                    Response.Redirect("Addtocart.aspx");
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    int sr;
                    sr = dt.Rows.Count;
                    dr = dt.NewRow();
                    String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
                    SqlConnection scon = new SqlConnection(mycon);
                    String myquery = "Select * from adcar where designid=" + Request.QueryString["id"];
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = scon;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = sr + 1;
                    dr["designid"] = ds.Tables[0].Rows[0]["designid"].ToString();
                    dr["productname"] = ds.Tables[0].Rows[0]["productname"].ToString();
                    dr["productimage"] = ds.Tables[0].Rows[0]["productimage"].ToString();
                    dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        Label3.Text = DateTime.Now.ToShortDateString();
        findorderid();
    }
    public void findorderid()
    {
        String pass = "abcdefghijklmnopqrstuvwxyz123456789";
        Random r = new Random();
        char[] mypass = new char[5];
        for (int i = 0; i < 5; i++)
        {
            mypass[i] = pass[(int)(35 * r.NextDouble())];
        }
        String orderid;
        orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);
        Label2.Text = orderid;
    }
    public void saveaddress()
    {
        String updatepass = "insert into orderadd(orderid,address,mobilenumber,email) values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "')";
        String mycon1 = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        SqlConnection s = new SqlConnection(mycon1);
        s.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = updatepass;
        cmd1.Connection = s;
        cmd1.ExecuteNonQuery();
        s.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt;
        dt = (DataTable)Session["buyitems"];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            String updatepass = "insert into orderdet(username,orderid,address,mobilenumber,email,designid,productname,productimage,price,dateoforder) values('" + Label6.Text + "','" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "'," + dt.Rows[i]["designid"] + ",'" + dt.Rows[i]["productname"] + "','" + dt.Rows[i]["productimage"] + "','" + dt.Rows[i]["price"] + "','" + Label3.Text + "')";
            String mycon1 = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
            SqlConnection s = new SqlConnection(mycon1);
            s.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = updatepass;
            cmd1.Connection = s;
            cmd1.ExecuteNonQuery();
            s.Close();
        }
        saveaddress();
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("fashionmenswear10@gmail.com", "vemwvhyagfwzfboh");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Hello Thanks for Your Order at Fashion Men's Wear";
        msg.Body = "Hi, Thanks Your Orderid" + Label2.Text + "has been placed at Fashion Men's Wear. Thanks";
        string toaddress = TextBox3.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Fashion Men's Wear <fashionmenswear10@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
            Response.Redirect("Placedorders.aspx?orderid=" + Label2.Text);
            Label2.Text = "";
            TextBox3.Text = "";
        }
        catch
        {
            throw;
        }
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
        Session.Abandon();
        Response.Redirect("Default.aspx?signout=true");
    }
}

