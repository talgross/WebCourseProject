<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewAssignmentPage.aspx.cs" Inherits="WebProject.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.9/angular.js" integrity="sha256-JCDFk3Tc3BypchwzSjKv7pLwYQKAyuDRs5UrEnm8KyQ=" crossorigin="anonymous"></script>
    <script>
        var app = angular.module('app', [])
            .controller('ViewAssignmentPage', function ($scope, $http) {
                // open modal
                $scope.assignmentModalShow = function (user) {
                    $http.get("WebService1.asmx/GetSpecificAssingment", {
                        reponseType: 'arraybuffer'
                    })
                        .then(function (response) {
                            $scope.assignment = response.data;

                            var file = new Blob([response.data], { type: 'application/pdf' })
                            var fileURL = URL.createObjectURL(file)
                            window.open(fileURL);
                            //$("#assignmentModal").modal("show");
                        })
                    //var rowData = user.parentNode.parentNode;
                    //var rowIndex = rowData.rowIndex;
                    //var grid = document.getElementsByTagName("asp:GridView")[0];

                    //var row = grid.getAttribute("SelectedRow").val;
                    //$scope.selectedRow = {
                    //    StudentID: $scope.angGridView.SelectedRow.Cells[0]
                    //}

                    //if($scope.curUser!=user.Id)return;
                    //if(arguments.length==0){  
                    //  $scope.selectedUser = {
                    //      StudentID: 0,
                    //        Mail:"",
                    //        Password:"",
                    //        Address:""
                    //    }
                    //}else
                    //    $scope.selectedUser = angular.copy(user);

                    //$("#assignmentModal").modal("show");
                }

                $scope.getAssignemnt = function () {
                    $http.get("WebService1.asmx/GetSpecificAssingment")
                        .then(function (response) {
                            $scope.assignment = response.data;
                        })
                }
            });
    </script>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <!-- contact -->
    <div class="contact" ng-app="app" ng-controller="ViewAssignmentPage">
        <div class="container">
            <div class="contact-agileinfo">
                <asp:UpdatePanel ID="changeGradeModal" runat="server" class="col-md-15">
                    <ContentTemplate>
                        <div class="card-header">
                            <div class="w3l-heading">
                                <h2 class="w3ls_head">Assignment Name</h2>
                            </div>
                            <%--                            <h4 class="modal-title"><span ng-bind="selectedUser.Id>0 ? 'Update' : 'New'"></span>User <span class="text-info" ng-show="selectedUser.Id>0" ng-bind="selectedUser.Id"></span></h4>--%>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label class="control-label">StudentID</label>
                                <input data-title="x.StudentID" id="studentID" class="form-control" readonly="readonly" type="text" ng-model="selectedRow.StudentID" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">StudentName</label>
                                <input id="studentName" class="form-control" readonly="readonly" type="text" ng-model="selectedUser.Password" />
                            </div>
                            <div class="form-group ">
                                <label class="control-label">Grade</label>
                                <input class="form-control" type="text" ng-model="selectedUser.Address" />
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success col-2" style="width: auto" type="submit" ng-model="selectedUser.Address">Submit Grade</button>
                            </div>



                            <div class="form-group">
                                <button class="btn btn-info" type="button" ng-click="assignmentModalShow()" ng-model="selectedUser.Address">View Submitted Assignment</button>
                                <%--<iframe class="form-control" ng-model="selectedUser.Address" />--%>
                            </div>

                            <%--                    <button type="button" class="btn btn-danger" data-dismiss="modal">Canel</button>--%>
                            <%--<button type="button" class="btn btn-success" ng-click="save()" ng-show="curUser==selectedUser.Id">Save</button>--%>
                        </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="contact">
        <div class="container">
            <div class="w3l-heading">
                <h2 class="w3ls_head">Mail Us</h2>
            </div>
            <div class="contact-agileinfo">
                <div class="col-md-7 contact-right">
                    <form action="mailto:help@DXdesign.com" method="post">
                        <input type="text" name="Name" placeholder="Name" required="" />
                        <input type="text" class="email" name="Email" placeholder="Email" required="" />
                        <input type="text" name="Phone no" placeholder="Phone" required="" />
                        <textarea name="Message" placeholder="Message" required=""></textarea>
                        <input type="submit" value="SUBMIT" />
                    </form>
                </div>
                <br />
                <br />
                <div class="col-md-5 contact-left">
                    <div class="address">
                        <h5>Address:</h5>
                        <p><i class="glyphicon glyphicon-home"></i>Karmiel , Israel </p>
                    </div>

                    <div class="address">
                        <h5>Email:</h5>
                        <p><i class="glyphicon glyphicon-envelope"></i><a href="mailto:Contact@DXdesign.com">Contact@DXdesign.com</a></p>
                    </div>
                </div>

            </div>




        </div>
    </div>

    <!-- modal window -->
    <div id="assignmentModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form-group">
                        <iframe  class="form-control" ng-src="data:image/DOC;base64,{{assignment}}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
