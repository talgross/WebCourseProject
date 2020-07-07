<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldLogin.aspx.cs" Inherits="lab8.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/cerulean/bootstrap.min.css" rel="stylesheet" integrity="sha384-b+jboW/YIpW2ZZYyYdXczKK6igHlnkPNfN9kYAbqYV7rNQ9PKTXlS2D6j1QZIATW" crossorigin="anonymous">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 600px; margin: 20px auto; padding: 3px;">
            <%--<h1 runat="server" id="myTitle">Hello</h1> <!-- runat allows me to change the text from the server -->--%>
            <h1 class="h-25">Please enter login information</h1>
            <div>
                <label>Username</label>
                <asp:TextBox runat="server" ID="user"></asp:TextBox>
            </div>
            <div>
                <label>Password</label>
                <asp:TextBox runat="server" ID="password"></asp:TextBox>
            </div>
            <div>
                <asp:Button runat="server" ID="btn" OnClick="btn_Click" Text="Submit" />
            </div>
            <div>
                <asp:Label CssClass="alert-info" runat="server" ID="errorMsg" Text="Invalid Username or Password" ForeColor="Red" Visible="false"></asp:Label>
            </div>

        </div>
    </form>
</body>
</html>
