<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenu.ascx.cs" Inherits="WebProject.LeftMenu" %>
<div>
    <asp:TreeView ID="treeView" runat="server" NodeStyle-CssClass="list-group-item-text" BorderStyle="Ridge" BorderColor="AliceBlue" OnSelectedNodeChanged="SelectedNodeChanged">
<%--        <Nodes>
            <asp:TreeNode Text="testTask">
                <asp:TreeNode Text="innerTest"></asp:TreeNode>
                <asp:TreeNode Text="innerTest2"></asp:TreeNode>
            </asp:TreeNode>
        </Nodes>--%>
    </asp:TreeView>

</div>
