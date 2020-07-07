<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grid.aspx.cs" Inherits="grid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grid</title>
    <link href="inc/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="frame" style="width:700px;">
    <asp:GridView runat="server" ID="myGrid" AutoGenerateColumns="False"
        AllowPaging="True" AllowSorting="True" OnPageIndexChanging="myGrid_PageIndexChanging"
        OnSorting="myGrid_Sorting" OnRowCreated="OnRowCreated">
        <PagerSettings Mode="NumericFirstLast" />
            <columns>
                <asp:boundfield datafield="Name" HeaderText="Name" sortexpression="Name" ItemStyle-Width="200"/>
                <asp:boundfield datafield="Bid" HeaderText="Bid" sortexpression="Bid"  ItemStyle-Width="100"/>
                <asp:boundfield datafield="TLD" HeaderText="Tld" sortexpression="TLD"  ItemStyle-Width="100"/>
                <asp:boundfield datafield="Length" HeaderText="Length" sortexpression="Length"  ItemStyle-Width="100"/>
            </columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
