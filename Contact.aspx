<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Fashion Men's Wear</title>
    <meta charset="UTF-8 "/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="Shortcut Icon" type="x-icon" href="img/logo.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    </head>
<body>
    <form id="form1" runat="server">
    <div style="height: 1055px">
    <nav>
        <div class="navbar">
            <div class="navitem">
                <a href="index.aspx"><img src="img/logo.png" width=250px alt=""></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="navitem">
                <div class="search">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Login.aspx"><asp:Button ID="Button1" runat="server" Text="Logout" 
                        onclick="Button1_Click" Height="42px" style="margin-top: 0px" 
                        Width="83px" CssClass="btnn"></asp:Button></a>
                    &nbsp;<asp:Label ID="Label7" 
                        runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="Addtocart.aspx"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </div> 
            </div>
        </div>
        <div class="cont">
        <ul class="navcontain">
            <li><a href="index.aspx">Home</a></li>
            <li><a href="product.aspx">Products</a></li>
            <li><a href="newarr.aspx">New Arrivals</a></li>
            <li><a href="About_us.aspx">About Us</a></li>
            <li><a class="active" href="Contact.aspx">Contacts</a></li>
            <li><a href="yourorder.aspx">Your Orders</a></li>       
        </ul>
        </nav>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <div class="products">
        <h2 style="height: 22px; margin-top: 0px">CONTACTS</h2>
        </div>
        <div class="form-details" style="background-color: #FFFF66">
            <span>LEAVE A MEASSAGE</span>
            <h2>We love to hear from you</h2>
&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" 
                Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" BackColor="White" 
                BorderColor="Black" ForeColor="Black" Height="30px" style="margin-left: 19px" 
                Width="310px"></asp:TextBox>
            <br />
            <br />
            <br />
&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" 
                Text="E-mail"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="Black" 
                ForeColor="Black" Height="30px" Width="307px"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" 
                Text="Mobile Number"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" BackColor="White" BorderColor="Black" 
                ForeColor="Black" Height="30px" style="margin-left: 0px" Width="307px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" 
                Text="Message"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" BackColor="White" BorderColor="Black" 
                ForeColor="Black" Height="85px" TextMode="MultiLine" Width="307px" 
                style="margin-top: 0px"></asp:TextBox>
            <br /><br />
            <br /> <br />
            <asp:Button ID="Button2" runat="server" CssClass="btnn" Height="42px" 
                Text="Submit" Width="94px" onclick="Button2_Click" />
        </div>

        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <br />
        <br />
            
    <div class="footer">
            <div class="image-section">
                <img src="img/logo.png" />
            </div>
                <div class="con">
                    <div class="row">
                        
                        <div class="footer-col">
                            <h4>Company</h4>
                            <ul>
                                <li><a href="About_us.aspx">about us</a></li>
                                <li><a href="Contact.aspx">Contacts</a></li>
                                <li><a href="index.aspx">program</a></li>
                            </ul>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="footer-col">
                            <h4>online shop</h4>
                            <ul>
                                <li><a href="Shirt.aspx">Shirt</a></li>
                                <li><a href="T-Shirt.aspx">T-Shirt</a></li>
                                <li><a href="Pant.aspx">Pants</a></li>
                            </ul>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="footer-col">
                            <h4>follow us</h4>
                            <div class="social-links">
                                <a href="http://www.facebook.com"><i class="fab fa-facebook-f"></i></a>
                                <a href="http://www.twitter.com"><i class="fab fa-twitter"></i></a>
                                <a href="http://www.instagram.com"><i class="fab fa-instagram"></i></a>
                                <a href="http://www.linkedin.com"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>        
        </div>
        </div>
    </form>
</body>
</html>
