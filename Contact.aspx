<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="lab8.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container align-items-center" style="margin: 40px auto">
        <div class="container">
            <div class="w3l-heading">
                <h2 class="w3ls_head">Any Problems or Suggestions? Send us a message</h2>
            </div>
            <div class="contact-agileinfo">
                <div class="col-md-2 contact-right">
                    <form class="form-group" action="mailto:talgross9@Gmail.com" method="post">
                        <div class="form-group">
                            <input type="text" name="Name" placeholder="Name" required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="email" name="Email" placeholder="Email" required="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="Phone no" placeholder="Phone" required="" />
                        </div>
                        <div class="form-group">
                            <textarea name="Message" placeholder="Message" required=""></textarea>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn-success" title="Submit" />
                        </div>
                    </form>
                </div>
                <br />
                <br />
                <div class="col-md-5 contact-left">
                    <div class="address">
                        <h5>Email:</h5>
                        <p><i class="glyphicon glyphicon-envelope"></i><a href="mailto:talgross9@Gmail.com">someone@mail.com</a></p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
