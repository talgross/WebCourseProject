<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginWithMasterPage.aspx.cs" Inherits="WebProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="login">

                <div class="modal-content" style="width: 400px; margin: 40px auto">
            <div class="modal-header">
                <h4>Login</h4>
            </div>
            <div class="modal-body" style="padding: 20px;">
                <div class="form-group">
                    <label>Email address</label>                    
                    <asp:TextBox runat="server" ID="user" CssClass="form-control ng-pristine ng-untouched ng-valid ng-empty" 
                        placeholder="Enter email">Alex1</asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="user" ErrorMessage="Required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group mh-80">
                    <label for="exampleInputPassword1">Password</label>
                    <asp:TextBox runat="server" ID="password" CssClass="form-control ng-pristine ng-untouched ng-valid ng-empty" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="Required field" ForeColor="Red">Incorrect Password</asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label runat="server" ID="lblError" ForeColor="Red"></asp:Label>
                </div>
            </div>
            <div class="modal-footer">
                <div style="width: 100%">
                    <div style="float: left; padding-top: 20px">
                        <asp:LinkButton runat="server" ID="register" Text="new user registration" OnClick="register_Click"></asp:LinkButton>
                    </div>
                    <div style="float: right">
                        <asp:Button runat="server" ID="btnLogin" Text="Submit" OnClick="btnLogin_Click" CssClass="btn btn-info"/>                        
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
        </div>
                <%--<div style="width: 600px; margin: 20px auto; padding: 3px;">--%>
            <%--<h1 runat="server" id="myTitle">Hello</h1> <!-- runat allows me to change the text from the server -->--%>
<%--            <h1 class="h-25">Please enter login information</h1>
            <div>
                <label>Username</label>
                <asp:TextBox runat="server" ID="user"></asp:TextBox>
            </div>
            <div>
                <label>Password</label>
                <asp:TextBox runat="server" ID="password"></asp:TextBox>
            </div>
            <div>
                <asp:Button runat="server" ID="btn" OnClick="btnLogin_Click" Text="Submit" />
            </div>
            <div>
                <asp:Label CssClass="alert-info" runat="server" ID="errorMsg" Text="Invalid Username or Password" ForeColor="Red" Visible="false"></asp:Label>
            </div>

        </div>--%>
    </asp:Panel>

        <asp:Panel runat="server" ID="registration">
        <div class="modal-content" style="width: 400px; margin: 40px auto">
            <div class="modal-header">
                <h4 class="text-warning">Registration</h4>
            </div>

             <div class="modal-footer">
                 <asp:LinkButton runat="server" ID="loginLink" Text="login for existing user" OnClick="loginLink_Click"></asp:LinkButton>
             </div>
            
        </div>
    </asp:Panel>

</asp:Content>
