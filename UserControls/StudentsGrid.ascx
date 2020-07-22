<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentsGrid.ascx.cs" Inherits="WebProject.UserControls.StudentsGrid" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Example - Ajax and DB</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.9/angular.js" integrity="sha256-JCDFk3Tc3BypchwzSjKv7pLwYQKAyuDRs5UrEnm8KyQ=" crossorigin="anonymous"></script>
</head>
<body ng-app="app" ng-controller="usersCtrl">
    <div class="container0">
        <div>
            <div style="float: left">
                <h1>Grades</h1>
            </div>
            <div style="clear: both"></div>
        </div>

        <div class="table-responsive">
            <asp:GridView runat="server" ID="gridView"
                CssClass="table table-sm table-hover table-bordered"
                AllowSorting="false" PagerStyle-CssClass="pgr"
                AutoGenerateColumns="false" AllowPaging="True" PageSize="20">
                <Columns>
                    <asp:BoundField DataField="AssignmentID" ItemStyle-Width="20%" HeaderText="AssignmentID" SortExpression="Id" />
                    <asp:BoundField DataField="StudentID" ItemStyle-Width="20%" HeaderText="StudentID" SortExpression="Id" />
                    <asp:BoundField DataField="StudentName" ItemStyle-Width="15%" HeaderText="StudentName" SortExpression="User" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" ItemStyle-Width="15px" ItemStyle-HorizontalAlign="Center" SortExpression="Ordered" DataFormatString="{0:#,0.######}" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" type="button" class="btn btn-info" OnClick="ChangeGrade_Clicked" Text="Change Grade" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />

            </asp:GridView>
        </div>
        <%-- --%>
    </div>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
</body>
</html>

