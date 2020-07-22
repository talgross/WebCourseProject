<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="WebProject.Menu" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<div class="collapse navbar-collapse" id="navbarColor01" >
    <asp:Panel ID="user" runat="server">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item <%if (Page.Title == "Home")
                {%>active<%}%>">
                <a href="SecondPageWithMasterPage.aspx" class="nav-link">Home</a>
            </li>
            <li class="nav-item <%if (Page.Title == "Contact")
                {%>active<%}%>">
                <a href="Contact.aspx" class="nav-link">Contact</a>
            </li>
            <li class="nav-item <%if (Page.Title == "Logout")
                {%>active<%}%>">
                <asp:LinkButton runat="server" OnClick="clickLogout" class="nav-link">Logout</asp:LinkButton>
            </li>
        </ul>
    </asp:Panel>

</div>
