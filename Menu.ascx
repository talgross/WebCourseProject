<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="WebProject.Menu" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script>
    var app = angular.module('app', [])
        .controller('usersCtrl', function ($scope, $http) {



            $scope.HomeClicked = function () {
                if (Site1.loggedInLecturer != null) {
                    window.location.href = "SecondPageWithMasterPage.aspx";
                }
                else {
                    window.location.href = "LoginWithMasterPage.aspx";
                }
            }
        });
</script>
<div class="collapse navbar-collapse" id="navbarColor01">
    <asp:Panel ID="user" runat="server">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item <%if (Page.Title == "Home")
                {%>active<%}%>">
                <a href="SecondPageWithMasterPage.aspx" onclick="HomeClicked(); return false;" class="nav-link">Home</a>
            </li>
            <li class="nav-item <%if (Page.Title == "About")
                {%>active<%}%>">
                <a href="About.aspx" class="nav-link">About</a>
            </li>
            <li class="nav-item <%if (Page.Title == "Contact")
                {%>active<%}%>">
                <a href="Contact.aspx" class="nav-link">Contact</a>
            </li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="guest" runat="server" Visible="false">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item <%if (Page.Title == "Login")
                {%>active<%}%>">
                <a href="Login.aspx" class="nav-link">Login</a>
            </li>
            <li class="nav-item <%if (Page.Title == "Registration")
                {%>active<%}%>">
                <a href="Registration.aspx" class="nav-link">Registration</a>
            </li>
        </ul>
    </asp:Panel>

</div>
