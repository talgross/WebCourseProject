<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SecondPageWithMasterPage.aspx.cs" Inherits="WebProject.SecondPageWithMasterPage" %>

<%--<%@ Register Src="~/LeftMenu.ascx" TagPrefix="uc2" TagName="LeftMenu" %>--%>
<%@ Register Src="~/UserControls/StudentsGrid.ascx" TagPrefix="uc3" TagName="StudentsGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        var app = angular.module('app', [])
            .controller('usersCtrl', function ($scope, $http) {

                $scope.something = function () {

                }

            });
    </script>
    <asp:Panel runat="server" ID="SecondPage">

        <%--        <div class="container">
            <h1 runat="server" id="hText"></h1>
            <div>
                <asp:LinkButton runat="server" ID="hLogout" Text="Logout" OnClick="hLogout_Click"></asp:LinkButton></div>
        </div>--%>
        <div class="container-fluid" style="margin-left: 0px">
            <div class="row">
                <div class="col-md-2 list-group">
                    <%--left menu--%>
                    <%--<uc2:LeftMenu runat="server" ID="LeftMenu" />--%>
                    <div>
                        <asp:TreeView ID="treeView" runat="server" OnSelectedNodeChanged="SelectedNodeChanged" NodeStyle-CssClass="list-group-item-text" BorderStyle="Ridge" BorderColor="AliceBlue" />
                    </div>
                </div>
                <div class="col-md-9">
                    <uc3:StudentsGrid runat="server" ID="StudentsGrid" />
                </div>
            </div>

            <%--            <div>
                <div style="float:left;width:200px;border:1px solid silver">

                </div>
                <div style="float:left;">content</div>
                <div style="clear:both"></div>
            </div>--%>



            <%--    <asp:ContentPlaceHolder ID="ContentPlaceHolder2" runat="server">
            </asp:ContentPlaceHolder>--%>
        </div>
    </asp:Panel>
</asp:Content>
