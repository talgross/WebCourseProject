<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:220px;margin:20px auto">
            <h1>Login</h1>
             <div class="form-group">
                <label>Email address</label>
                <%--<input type="email" runat="server" class="form-control" id="mail" placeholder="Enter email">   --%>   
                 <asp:TextBox runat="server" ID="mail" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" 
                        Display="Dynamic" 
                        ControlToValidate="mail" 
                        Text="mail is required field" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator
                        runat="server" ErrorMessage="invalid email .."
                        ControlToValidate="mail"
                        ForeColor="Red" Font-Size="Smaller"
                        Display="Dynamic"
                        ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
             </div>
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox runat="server" ID="password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="password" Text="password is required field" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Button runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="Submit_Click" ID="submit" />
                <div>
                    <asp:Label runat="server" ID="error" ForeColor="Red"></asp:Label>
                </div>
                
            </div>
        </div>

    </form>
</body>
</html>
