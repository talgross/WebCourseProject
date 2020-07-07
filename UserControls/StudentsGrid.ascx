<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentsGrid.ascx.cs" Inherits="WebProject.UserControls.StudentsGrid" %>
<asp:Panel ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .pgr:hover td{
            background-color:white;
        }
         .pgr table td {
             background-color:white;
         }
        .pgr table td:hover{
            background-color:#dfe3e7;
        }
    </style>   
   
</asp:Panel>
<asp:Panel ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
     <div class="table-responsive">
                <asp:GridView runat="server" ID="gvData"
                    CssClass="table table-sm table-hover table-bordered" 
                     AllowSorting="true" PagerStyle-CssClass="pgr" 
                     AutoGenerateColumns="false" AllowPaging="True" PageSize="20"><%--OnPageIndexChanging="gvData_PageIndexChanging" OnSorting="gvData_Sorting" --%>
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                        <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
                        <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order" />
                        <asp:BoundField DataField="Tp" HeaderText="Tp" SortExpression="Tp" />
                        <asp:BoundField DataField="Symbol" HeaderText="Symbol" SortExpression="Symbol" />
                        <asp:BoundField DataField="Base" HeaderText="Base" SortExpression="Base" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Ordered" DataFormatString="{0:#,0.######}" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="${0:#,0.00}" />
                        <asp:BoundField DataField="CostD" HeaderText="Cost" SortExpression="Cost" DataFormatString="${0:#,0.00}" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yy HH:mm:ss}" />
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
</asp:Panel>
