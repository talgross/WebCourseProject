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

                $scope.service = "WebService1.asmx/";

                angular.element(document).ready(function () {
                    //$scope.getUsers();GetAssignmentGrade
                    $http.get("WebService1.asmx/GetAssignmentGrade", {
                        reponseType: 'arraybuffer'
                    })
                        .then(function (response) {
                            $scope.grade = $scope.getResponceXML(response);

                        })
                });

                // open modal
                $scope.assignmentModalShow = function (user) {
                    $http.get($scope.service + "GetSpecificAssingment", {
                        reponseType: 'arraybuffer'
                    })
                        .then(function (response) {
                            $scope.assignment = $scope.getResponceXML(response);

                            var file = new Blob([$scope.assignment], { type: 'application/pdf' });
                            var fileURL = URL.createObjectURL(file);
                            window.open(fileURL);
                        })
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

                $scope.saveGrade = function () {
                    var user = angular.copy($scope.grade);
                    //var isNew = $scope.selectedUser.Id == 0;
                    var url = $scope.service + "SaveGrade";
                    var data = { data: user };
                    $http.post(url, data, null).then(
                        function (d) { // success
                            //if (isNew) {
                            //    user.Id = d.data.d;
                            //    $scope.users.push(user);
                            //} else {
                            //    $scope.users.map((x, i) => {
                            //        if (x.Id == d.data.d) {
                            //            $scope.users[i] = user;
                            //        }
                            //    });
                            //}
                            $scope.safeApply();
                            angular.element(document.location = "SecondPageWithMasterPage.aspx");
                            //$("#changeGradeModal").modal("hide");

                        },
                        function (e) { // error
                            console.log(e);
                        }
                    )
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
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <!-- contact -->
    <div class="contact" ng-app="app" ng-controller="ViewAssignmentPage">
        <div class="container align-items-center" style="margin: 40px auto">
            <div class="contact-agileinfo">
                <asp:UpdatePanel ID="changeGradeModal" runat="server" class="col-md-8 align-self-center">
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
                                <input data-title="x.StudentID" id="studentID" class="form-control" readonly="readonly" type="text" ng-model="grade.studentID" />
                            </div>
                            <div class="form-group ">
                                <label class="control-label">Grade</label>
                                <input class="form-control" type="text" required="" ng-model="grade.grade1" />
                            </div>
                            <div class="row row-cols-1 align-items-center ">
                                <button class="btn btn-info col-md-5 " type="button" ng-click="assignmentModalShow()" ng-model="selectedUser.Address">View Submitted Assignment</button>
                                <span class="col-sm-2"></span>
                                <button class="btn btn-success col-md-5"  ng-click="saveGrade()" type="submit" ng-model="selectedUser.Address">Submit Grade</button>

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

    <%--    <div class="contact">
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
    </div>--%>

    <!-- modal window -->
</asp:Content>
