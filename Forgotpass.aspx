<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgotpass.aspx.cs" Inherits="Forgotpass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fashion Men's Wear</title>
    <link rel="Shortcut Icon" type="x-icon" href="img/logo.png" />
   
    <link rel="stylesheet" href="css/form.css"/>
    </head>
<body>
    <form id="form1" runat="server">
    <div class="main">      
        <div class="navbar">
            <div class="icon">
                <a href="index2.aspx"><img src="img/logo.png" width=250px alt=""></a>
   
            </div>
        </div>     
        </div>
    <div class="form1" style="background-color: #333333">
                <h2>Forgot Password</h2>
&nbsp;
                &nbsp;&nbsp;<br />
                <asp:Label ID="Label2" runat="server" Text="User Name" ForeColor="White" Font-Bold="True" 
                    Font-Size="X-Large"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txt_username" runat="server" Width="284px" BackColor="#FFFFCC" 
                    BorderColor="#CCCCCC" ForeColor="Black" Height="23px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label3" runat="server" Text="E-mail" Font-Bold="True" 
                    Font-Size="X-Large" ForeColor="White"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txt_email" runat="server" Width="281px" BackColor="White" 
                    BorderColor="White" ForeColor="Black" Height="25px"></asp:TextBox>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
        style="text-align: center" ForeColor="White"></asp:Label>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="Red" CssClass="btnn" 
                    Font-Bold="True" Height="60px" onclick="Button1_Click1" Text="Get Password" 
                    Width="134px" />
                    <br />
                <br />
<p class="link" style="color: #FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Login.aspx">Login </a> here</a></p>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
    </form>
</body>
</html>
