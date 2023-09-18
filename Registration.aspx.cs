using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;
using System.Net.Mail;
using System.Net;
using System.Collections.Specialized;
using System.Text;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (checkusername() == true)
        {
            Label5.Text = "Your Username Already Registered with Us";
            txt_username.BackColor = System.Drawing.Color.PaleGreen;
        }
        else if (checkemail() == true)
        {
            Label5.Text = "Your Email Already Registered with Us";
            txt_email.BackColor = System.Drawing.Color.PaleGreen;
        }
        else if (checkpassword() == true)
        {
            Label5.Text = "Your Password is Already Taken";
            txt_password.BackColor = System.Drawing.Color.PaleGreen;
        }
        else if (txt_username.Text == "")
        {
            Label5.Text = "Please enter a valid username";
            txt_username.BackColor = System.Drawing.Color.PaleGreen;
        }
        else if (checkPasswordMatch())
        {

            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True");
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO reglog (username, email, password) VALUES ('" + txt_username.Text + "', '" + txt_email.Text + "', '" + txt_password.Text + "')", conn);

            // Set the parameters of the command to the values entered by the user
            cmd.Parameters.AddWithValue("@username", txt_username.Text);
            cmd.Parameters.AddWithValue("@email", txt_email.Text);
            cmd.Parameters.AddWithValue("@password", txt_password.Text);


            // Execute the command to insert the new user into the database
            cmd.ExecuteNonQuery();

            // Close the database connection
            conn.Close();

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("fashionmenswear10@gmail.com", "vemwvhyagfwzfboh");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Hello " + txt_username.Text + " Thanks for Register at Fashion Men's Wear";
            msg.Body = "Hi, Thanks For Your Registration at Fashion Men's Wear, We will Provide You The Latest Update. Thanks";
            string toaddress = txt_email.Text;
            msg.To.Add(toaddress);
            string fromaddress = "Fashion Men's Wear <fashionmenswear10@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
                Label5.Text = "You have Successfully Registered - Thank You";
                txt_username.Text = "";
                txt_email.Text = "";
            }
            catch
            {
                throw;
            }
        }
    }
    private Boolean checkemail()
    {
        Boolean emailavailable = false;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True";
        String myquery = "Select * from reglog where email='" + txt_email.Text + "'";
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
            emailavailable = true;
        }
        con.Close();
        return emailavailable;
    }
    private Boolean checkusername()
    {
        Boolean usernameavailable = false;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True";
        String myquery = "Select * from reglog where username='" + txt_username.Text + "'";
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
            usernameavailable = true;
        }
        con.Close();
        return usernameavailable;
    }
    private Boolean checkpassword()
    {
        Boolean passwordavailable = false;
        String mycon = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True";
        String myquery = "Select * from reglog where password='" + txt_password.Text + "'";
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
            passwordavailable = true;
        }
        con.Close();
        return passwordavailable;
    }
    bool checkPasswordMatch()
    {
        if (txt_password.Text == txt_conpassword.Text)
        {

            return true;
        }
        else
        {
            Label5.Text = "Password and Confirm Password not match";
            return false;
        }
    }
}
