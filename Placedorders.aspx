<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Placedorders.aspx.cs" Inherits="Placedorders" %>

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
        .style2
        {
            width: 100%;
            height: 653px;
        }
        .style4
        {
            height: 67px;
        }
        .style5
        {
            height: 126px;
        }
        .style6
        {
            width: 100%;
        }
        .style12
        {
            height: 197px;
        }
        .style14
        {
            height: 168px;
            width: 472px;
        }
        .style16
        {
            height: 128px;
        }
        .style18
        {
            height: 86px;
        }
        .style20
        {
            height: 168px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar">
            <div class="navitem">
                <img src="img/logo.png" width=250px alt="">
            </div>
            </div>
            <div class="cont">
    <p>
        <br /><br />
        Order ID :
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
                <p style="margin-left: 480px">
                    &nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="X-Large" 
                        style="text-align: center" Text="Your Payment is Processed. Thanks for your Payment."></asp:Label>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" 
            style="text-align: center" Text="Your Order Has been Placed Successfully"></asp:Label>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Height="58px" onclick="Button1_Click" 
            Text="Download Invoice" Width="215px" CssClass="btnn" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" CssClass="btnn" Height="58px" 
            onclick="Button2_Click" Text="See Your Order" Width="215px" />
    </p>
    <div>
    
        <asp:Panel ID="Panel1" runat="server" Height="795px">
            <table border="1" class="style2">
                <tr>
                    <td class="style4" style="text-align: center" bgcolor="#FFFF66">
                        Retail Invoice</td>
                </tr>
                <tr>
                    <td class="style5" bgcolor="#FFFF66">
                        Name:
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                        <br />
                        <br />
                        Order No:
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />
                        <br />
                        Order Date:
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style12" bgcolor="#FFFF66">
                        <table border="1" class="style6">
                            <tr>
                                <td class="style14">
                                    Buyer Address<br />
                                    <asp:Label ID="Label4" runat="server"></asp:Label>
                                </td>
                                <td class="style20">
                                    Seller Address<br /> Fashion Men&#39;s Wear Mumbai</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style18" bgcolor="#FFFF66">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            Height="180px" Width="926px">
                            <Columns>
                                <asp:BoundField DataField="sno" HeaderText="Sr No">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="designid" HeaderText="Product ID">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="productname" HeaderText="Product Name">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="Price">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="style16" bgcolor="#FFFF66">
                        This is a computer generated invoice and does not required signature.</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
    
    </div>
    </div>
    </form>
</body>
</html>
