<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yourorder.aspx.cs" Inherits="yourorder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fashion Men's Wear</title>
    <meta charset="UTF-8 "/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="Shortcut Icon" type="x-icon" href="img/logo.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <nav>
        <div class="navbar">
            <div class="navitem">
                <a href="index.aspx"><img src="img/logo.png" width=250px alt=""></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="navitem">
                <div class="search">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="Login.aspx"><asp:Button 
                        ID="Button3" runat="server" Text="Logout" Height="42px" style="margin-top: 0px" 
                        onclick="Button3_Click" Width="83px" CssClass="btnn"></asp:Button></a>
                    &nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="Addtocart.aspx"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>
                    <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                </div>
             </div>
         </div>
         <div class="cont">
         <ul class="navcontain">
            <li><a href="index.aspx">Home</a></li>
            <li><a href="product.aspx">Products</a></li>
            <li><a href="newarr.aspx">New Arrivals</a></li>
            <li><a href="About_us.aspx">About Us</a></li>
            <li><a href="Contact.aspx">Contacts</a></li>
            <li><a class="active" href="yourorder.aspx">Your Orders</a></li>
        </ul>
        </nav>
        <div class="products">
            <h2>Your Orders</h2>      
    <asp:Label ID="Label13" runat="server"></asp:Label>    
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" Height="320px" Width="966px" 
            style="margin-top: 0px; margin-left: 192px;" 
            EmptyDataText="No Orders here Buy now" 
             BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
            GridLines="Vertical" onrowdeleting="GridView1_RowDeleting"  
            >
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="Sr No" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" style="text-align: center" 
                            Text='<%# Eval("sno") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Order ID">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" style="text-align: center" 
                            Text='<%# Eval("orderid") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product ID">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("designid") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Name">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" style="text-align: center" 
                            Text='<%# Eval("productname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("productimage") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" style="text-align: center" 
                            Text='<%# Eval("price") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Of Order">
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" style="text-align: center" 
                            Text='<%# Eval("dateoforder") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete">Cancel Order</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    <br />
    <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:addcartConnectionString %>" 
        SelectCommand="SELECT * FROM [orderdet] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
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
