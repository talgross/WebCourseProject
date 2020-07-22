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
                    <asp:RequiredFieldValidator ID="errorMessage" runat="server" ControlToValidate="password" ErrorMessage="Required field" ForeColor="Red">Incorrect Password</asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label runat="server" ID="lblError" ForeColor="Red">Incorrect Password</asp:Label>
                </div>
            </div>
            <div class="modal-footer">
                <div style="width: 100%">
                    <div style="float: left; padding-top: 20px">
                        <asp:LinkButton runat="server" ID="register" Text="new user registration" OnClick="register_Click"></asp:LinkButton>
                    </div>
                    <div style="float: right">
                        <asp:Button runat="server" ID="btnLogin" Text="Submit" OnClick="btnLogin_Click" CssClass="btn btn-info" />
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>

</asp:Content>
