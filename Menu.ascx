<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="WebProject.Menu" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script>
    //var app = angular.module('app-menu', [])
    //    .controller('usersCtrl-menu', function ($scope, $http) {

    //        angular.element(document).ready(function () {
    //            //$scope.getUsers();GetAssignmentGrade
    //            $http.get("WebService1.asmx/GetLoggedUserID", {
    //                reponseType: 'arraybuffer'
    //            })
    //                .then(function (response) {
    //                    $scope.userID = $scope.getResponceXML(response);

    //                })
    //        });


    //        $scope.HomeClicked = function () {
    //            $http.get("WebService1.asmx/GetLoggedUserID", {
    //                reponseType: 'arraybuffer'
    //            })
    //                .then(function (response) {
    //                    $scope.userID = $scope.getResponceXML(response);

    //                    if ($scope.userID != -1) {
    //                        //window.location.href = "SecondPageWithMasterPage.aspx";
    //                        angular.element(document.location = "SecondPageWithMasterPage.aspx");

    //                    }
    //                    else {
    //                        angular.element(document.location = "LoginWithMasterPage.aspx");

    //                        //window.location.href = "LoginWithMasterPage.aspx";
    //                    }
    //                })


    //        }

    //        // data from service xml -> json
    //        $scope.getResponceXML = function (d) {
    //            var xmlDoc = $.parseXML(d.data);
    //            if (xmlDoc == null) { // json format
    //                return JSON.parse(d.data.d);
    //            } else { // xml format
    //                return JSON.parse(xmlDoc.documentElement.textContent);
    //            }
    //        }
    //    });
</script>
<div class="collapse navbar-collapse" id="navbarColor01" >
    <asp:Panel ID="user" runat="server">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item <%if (Page.Title == "Home")
                {%>active<%}%>">
                <a href="SecondPageWithMasterPage.aspx" class="nav-link">Home</a>
            </li>
            <li class="nav-item <%if (Page.Title == "About")
                {%>active<%}%>">
                <a href="About.aspx" class="nav-link">About</a>
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
