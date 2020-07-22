<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SecondPageWithMasterPage.aspx.cs" Inherits="WebProject.SecondPageWithMasterPage" %>

<%--<%@ Register Src="~/LeftMenu.ascx" TagPrefix="uc2" TagName="LeftMenu" %>--%>
<%@ Register Src="~/UserControls/StudentsGrid.ascx" TagPrefix="uc3" TagName="StudentsGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="SecondPage">

        <%-- --%>
        <div class="container-fluid" style="margin-left: 0px">
            <div class="row">
                <div class="col-md-2 list-group">
                    <label class="col-form-label-lg">Courses</label>
                    <div>
                        <asp:TreeView ID="treeView" runat="server" OnSelectedNodeChanged="SelectedNodeChanged" NodeStyle-CssClass="list-group-item-text" BorderStyle="Ridge" BorderColor="AliceBlue" ShowLines="true" />
                    </div>
                </div>
                <div class="col-md-9">
                    <uc3:StudentsGrid runat="server" ID="StudentsGrid" />
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
