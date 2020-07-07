<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldSecondPage.aspx.cs" Inherits="lab8.SecondPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Home page</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 runat="server" id="hText"></h1>
            <div><asp:LinkButton runat="server" ID="hLogout" Text="Logout" OnClick="hLogout_Click"></asp:LinkButton></div>
        </div>
        
    </form>
</body>
</html>

