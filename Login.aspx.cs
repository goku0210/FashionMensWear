using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Windows.Forms;


public partial class Login : System.Web.UI.Page
{
    static String decryptedpwd;
    private const string ConnectionString = "Data Source=DESKTOP-4LU2SLJ\\SQLEXPRESS;Initial Catalog=userreglog;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public Login()
    {
        InitializeComponent();
    }

    private void InitializeComponent()
    {
        
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        String username, password;
        username = txt_username.Text;
        password = txt_password.Text;

        bool isAdmin = CheckAdminLogin(username, password);
        bool isUser = CheckUserLogin(username, password);
        if (isAdmin)
        {
            Session["username"] = username;
            MessageBox.Show("Login Successful. Welcome, Admin");
            Response.Redirect("Admin.aspx");
        }
        else if (isUser)
        {
            Session["username"] = username;
            MessageBox.Show("Login Successful. Welcome, User");
            Response.Redirect("index.aspx");
        }
        else
        {
             // Login failed
             MessageBox.Show("Invalid username or password.");
        }
    }

    
    private bool CheckAdminLogin(string username, string password)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                string query = "SELECT id FROM admin WHERE username=@username AND password=@password";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        private bool CheckUserLogin(string username, string password)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                string query = "SELECT id FROM reglog WHERE username=@username AND password=@password";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forgotpass.aspx");
        }
        
}
