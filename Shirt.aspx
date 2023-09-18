<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shirt.aspx.cs" Inherits="Shirt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fashion Men's Wear</title>
    <meta charset="UTF-8 ">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="Shortcut Icon" type="x-icon" href="img/logo.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"/>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 414px;
        }
        .style3
        {
            height: 25px;
        }
        .style4
        {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <nav>
        <div class="navbar">
            <div class="navitem">
                <a href="index.aspx"><img src="img/logo.png" width=250px alt=""></a>
            </div>
            <div class="navitem">
                <div class="search">
                    &nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Search brand,products" 
                        CssClass="searchbox" Width="200px" BackColor="White" BorderColor="Black" 
                        BorderStyle="Solid"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" CssClass="search-btn" Text="Search" 
                        onclick="Button1_Click" />
                    <br />              
&nbsp;<asp:Button ID="Button3" runat="server" Height="42px" onclick="Button3_Click" Text="Logout" 
                        Width="83px" CssClass="btnn" />
&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                    &nbsp;&nbsp;<a href="Addtocart.aspx"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:addcartConnectionString %>" 
                        SelectCommand="SELECT * FROM [adcar]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:addcartConnectionString %>" 
                        SelectCommand="SELECT * FROM [adcar] WHERE ([keywordSearch] LIKE '%' + @keywordSearch + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="keywordSearch" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    </div> 
            </div>
        </div>
        <div class="cont">
        <ul class="navcontain">
            <li><a class="active" href="index.aspx">Home</a></li>
            <li><a href="product.aspx">Products</a></li>
            <li><a href="newarr.aspx">New Arrivals</a></li>
            <li><a href="About_us.aspx">About Us</a></li>
            <li><a href="Contact.aspx">Contacts</a></li>
        </ul>   
        </nav>
        <div class="products">
            <h2>Shirts</h2>
        </div>     
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            onitemcommand="DataList1_ItemCommand" RepeatColumns="4" 
            RepeatDirection="Horizontal" style="margin-right: 53px" Width="857px" 
            Height="41px">
            <ItemTemplate>
            <div style="min-width:230px;border-radius: 25px;border:1px solid #000;cursor:pointer;margin:19px 0 15px 10px; padding:10px 25px;width:263px; height: 517px; background-color: #FFFF99;">
                &nbsp;<table class="style1">
                    <tr>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("designid") %>' 
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;<asp:Image ID="Image1" runat="server" Height="294px" 
                                ImageUrl='<%# Eval("productimage") %>' Width="265px" 
                                style="margin-top: 0px" />
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("productname") %>' 
                                Font-Bold="True" Font-Size="Large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                CommandArgument='<%# Eval("designid") %>' CommandName="addtocart" Height="30px" 
                                ImageUrl="~/img/sc.png" Width="30px" BorderColor="Black" CssClass="btnn" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" 
                                CommandArgument='<%# Eval("designid") %>' CommandName="viewdetails" 
                                 Text="Product Details" BorderColor="Black" Height="41px" CssClass="btnn" Width="244px" />
                            &nbsp; &nbsp;</td>
                    </tr>
                </table>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;<br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </ItemTemplate>
        </asp:DataList>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:addcartConnectionString %>" 
            SelectCommand="SELECT * FROM [adcar] WHERE ([Category] = @Category)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Category" QueryStringField="cat" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
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
