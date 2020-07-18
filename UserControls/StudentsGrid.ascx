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
    <style>
        .modal-body, .modal-footer {
            padding-left: 30px;
            padding-right: 30px;
        }

        #editUser button {
            width: 80px;
        }

        .btn-group-sm > .btn, .btn-sm {
            padding: .0rem .3rem !important;
        }

        .rem-btn {
            display: none;
        }

        /*tr:hover .rem-btn{
            display:inline-block;
        }*/
        /*td{
            height:54px;
        }*/
    </style>
    <script>
        var app = angular.module('app', [])
            .controller('usersCtrl', function ($scope, $http) {

                $scope.curUser = <%=Session["lecturerID"]%>;
                $scope.service = "webservice1.asmx/";

                angular.element(document).ready(function () {
                    //$scope.getUsers();
                });

                // get all users from webservice
                $scope.getUsers = function () {
                    var url = $scope.service + "GetUsers";
                    $http.get(url, null)
                        .then(
                            function (d) {// success
                                $scope.users = $scope.getResponceXML(d)
                                console.log($scope.data);
                            },
                            function (er) {// error
                                console.log(er);
                            });
                }

                // get all users from webservice
                $scope.remUser = function (id) {
                    var url = $scope.service + "RemUser";
                    var config = { params: { id: id } };
                    $http.get(url, config)
                        .then(
                            function (d) {// success
                                $scope.users = $scope.users.filter(u => u.Id != id);
                                $scope.safeApply();
                            },
                            function (er) {// error
                                console.log(er);
                            });
                }


                // open modal
                $scope.userModal = function (user) {
                    //if($scope.curUser!=user.Id)return;
                    console.log("BLABLA");
                    //if(arguments.length==0){
                    //    $scope.selectedUser = {
                    //        Id: 0,
                    //        Mail:"",
                    //        Password:"",
                    //        Address:""
                    //    }
                    //}else
                    //    $scope.selectedUser = angular.copy(user);

                    $("#editUser").modal("show");
                }

                $scope.save = function () {
                    var user = angular.copy($scope.selectedUser);
                    var isNew = $scope.selectedUser.Id == 0;
                    var url = $scope.service + "SaveUser";
                    var data = { data: user };
                    $http.post(url, data, null).then(
                        function (d) { // success
                            if (isNew) {
                                user.Id = d.data.d;
                                $scope.users.push(user);
                            } else {
                                $scope.users.map((x, i) => {
                                    if (x.Id == d.data.d) {
                                        $scope.users[i] = user;
                                    }
                                });
                            }
                            $scope.safeApply();
                            $("#editUser").modal("hide");

                        },
                        function (e) { // error
                            console.log(e);
                        }
                    )

                }

                // data from service xml -> json
                $scope.getResponceXML = function (d) {
                    var xmlDoc = $.parseXML(d.data);
                    if (xmlDoc == null) { // json format
                        return JSON.parse(d.data.d);
                    } else { // xml format
                        return JSON.parse(xmlDoc.documentElement.textContent);
                    }
                }

                //
                $scope.safeApply = function (fn) {
                    var phase = this.$root.$$phase;
                    if (phase == '$apply' || phase == '$digest') {
                        if (fn && (typeof (fn) === 'function')) {
                            fn();
                        }
                    } else {
                        this.$apply(fn);
                    }
                };

            });

    </script>
</head>
<body ng-app="app" ng-controller="usersCtrl">
    <div class="container0">
        <div>
            <div style="float: left">
                <h1>Grades</h1>
            </div>
            <div style="float: right; padding-top: 10px">
                <button class="btn btn-success" ng-click="userModal()">Add User</button>
            </div>
            <div style="clear: both"></div>
        </div>

        <div class="table-responsive">
            <asp:GridView runat="server" ID="gridView"
                CssClass="table table-sm table-hover table-bordered"
                AllowSorting="false" PagerStyle-CssClass="pgr"
                AutoGenerateColumns="false" AllowPaging="True" PageSize="20">
                <%--OnPageIndexChanging="gvData_PageIndexChanging" OnSorting="gvData_Sorting" --%>
                <Columns>
                    <asp:BoundField DataField="StudentID" ItemStyle-Width="20%" HeaderText="StudentID" SortExpression="Id" />

                    <asp:BoundField DataField="StudentName" ItemStyle-Width="15%" HeaderText="StudentName" SortExpression="User" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" ItemStyle-Width="15px" ItemStyle-HorizontalAlign="Center" SortExpression="Ordered" DataFormatString="{0:#,0.######}" />
                    <%--<asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-info" Text="Changed Grade" CommandName="userModal()" />--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <button type="button" class="btn btn-info" ng-click="userModal()">Changed Grade</button>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--       <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="${0:#,0.00}" />
                        <asp:BoundField DataField="CostD" HeaderText="Cost" SortExpression="Cost" DataFormatString="${0:#,0.00}" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yy HH:mm:ss}" />--%>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />

            </asp:GridView>
        </div>
        <%-- <table id="gradesTable" class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th>Assignment Name</th>
                    <th>StudentId</th>
                    <th>Grade</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="u in users" ng-click="userModal(u)">
                    <td ng-bind="u.Id"></td>
                    <td style="width:300px">
                        <div>
                            <div style="float:left" ng-bind="u.Email"></div>
                            <div style="float:right" class="rem-btn" ng-show="curUser==u.Id">
                                <button class="btn btn-sm btn-danger" ng-click="remUser(u.Id);$event.stopPropagation()">&times;</button>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </td>
                    <td ng-bind="(curUser==u.Id ? u.Password : '***********')"></td>
                    <td ng-bind="u.Address"></td>
                </tr>
            </tbody>
        </table>--%>
    </div>
    <!-- modal window -->
    <div id="editUser" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><span ng-bind="selectedUser.Id>0 ? 'Update' : 'New'"></span>User <span class="text-info" ng-show="selectedUser.Id>0" ng-bind="selectedUser.Id"></span></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">Email</label>
                        <input class="form-control" type="text" ng-model="selectedUser.Email" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Password</label>
                        <input class="form-control" type="text" ng-model="selectedUser.Password" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Address</label>
                        <input class="form-control" type="text" ng-model="selectedUser.Address" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Canel</button>
                    <button type="button" class="btn btn-success" ng-click="save()" ng-show="curUser==selectedUser.Id">Save</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

