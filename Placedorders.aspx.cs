using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

public partial class Placedorders : System.Web.UI.Page
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
                    Response.Redirect("yourorder.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx?validlogin=false");
                }
            }
        }
        else
        {
            Label6.Text = Session["username"].ToString();
        }
        Label1.Text = Request.QueryString["orderid"];
        Label2.Text = Label1.Text;
        findorderdate(Label2.Text);
        findaddress(Label2.Text);
        showgrid(Label2.Text);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        exportpdf();
    }
    private void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
    private void findorderdate(String Orderid)
    {
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        String myquery = "Select * from orderdet where orderid='" + Orderid + "'";
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label3.Text = ds.Tables[0].Rows[0]["dateoforder"].ToString();
        }
        con.Close();
    }
    private void findaddress(String Orderid)
    {
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        String myquery = "Select * from orderadd where orderid='" + Orderid + "'";
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label4.Text = ds.Tables[0].Rows[0]["address"].ToString();
        }
        con.Close();
    }
    private void showgrid(String Orderid)
    {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add("sno");
        dt.Columns.Add("designid");
        dt.Columns.Add("productname");
        dt.Columns.Add("price");
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=addcart;Integrated Security=True";
        SqlConnection scon = new SqlConnection(mycon);
        String myquery = "Select * from orderdet where orderid='" + Orderid + "'";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = scon;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        int totalrows = ds.Tables[0].Rows.Count;
        int i = 0;
        while (i < totalrows)
        {
            dr = dt.NewRow();
            dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
            dr["designid"] = ds.Tables[0].Rows[i]["designid"].ToString();
            dr["productname"] = ds.Tables[0].Rows[i]["productname"].ToString();
            dr["price"] = ds.Tables[0].Rows[i]["price"].ToString();
            dt.Rows.Add(dr);
            i = i + 1;
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();

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
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("yourorder.aspx");
    }
}
