using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class Forgotpass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        String password;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True";
        String myquery = "Select * from reglog where username='" + txt_username.Text + "' and email='" + txt_email.Text + "'";
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
            //Label3.Text = "Data Found";
            password = ds.Tables[0].Rows[0]["password"].ToString();
            sendpassword(password, txt_username.Text);
            Label1.Text = "Your Password Has Been Sent to Registered Email Address. Check Your Mail Inbox";
        }
        else
        {
            Label1.Text = "Your Username is Not Valid or Email Not Registered";
        }
        con.Close();
    }
    private void sendpassword(String password, String email)
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("fashionmenswear10@gmail.com", "vemwvhyagfwzfboh");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Forgot Password ( Fashion Men's Wear )";
        msg.Body = "Dear " + txt_username.Text + ", Your Password is " + password + "\n\n\nThanks & Regards\nFashion Men's Wear";
        string toaddress = txt_email.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Fashion Men's Wear <fashionmenswear10@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }
    
}
