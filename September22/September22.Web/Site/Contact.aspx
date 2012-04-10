<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site_1Col.master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="September22.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript">
        function ValidateEmail(oSrc, args) {
            //assume validation fail
            args.IsValid = false;
            
            //check email address against regex
            var email = $("#txtEmail").val().trim();
            if (email != "") {
                var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                args.IsValid = regex.test(email);
            }

            if (args.IsValid) {
                $("#txtEmail").removeClass('redborder');
                $("#txtEmail").addClass('blueborder');
            }
            else {
                $("#txtEmail").effect("shake", { times: 4, distance: 4 }, 50);
                $("#txtEmail").removeClass('blueborder');
                $("#txtEmail").addClass('redborder');
            }
        };

        function ValidateName(oSrc, args) {
            if ($("#txtName").val().trim() == "") {
                $("#txtName").effect("shake", { times: 4, distance: 4 }, 50);
                $("#txtName").removeClass('blueborder');
                $("#txtName").addClass('redborder');
                args.IsValid = false;
            }
            else {
                $("#txtName").removeClass('redborder');
                $("#txtName").addClass('blueborder');
                args.IsValid = true;
            }
        };

        function ValidateMessage(oSrc, args) {
            if ($("#txtMessage").val().trim() == "") {
                $("#txtMessage").effect("shake", { times: 4, distance: 4 }, 50);
                $("#txtMessage").removeClass('blueborder');
                $("#txtMessage").addClass('redborder');
                args.IsValid = false;
            }
            else {
                $("#txtMessage").removeClass('redborder');
                $("#txtMessage").addClass('blueborder');
                args.IsValid = true;
            }
        };
    </script>
    <style type="text/css">
        .vibrate
        {
            margin-bottom: 15px;
        }
        .blueborder
        {
            border-color: #4dd0f5;
            border-width: 5px;
            border-style: solid;
            width: 400px;
        }
        .redborder
        {
            border-color: #ff0000;
            border-width: 5px;
            border-style: solid;
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiddleColumnContent" runat="server">
    <h2><span>Contact Us</span></h2>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <br />
            Name:<br />
            <div class="vibrate">
                <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" Width="400px" class="blueborder"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtName" EnableClientScript="true" ClientValidationFunction="ValidateName" ValidateEmptyText="true">
                </asp:CustomValidator>
            </div>
            Email:<br />
            <div class="vibrate">
                <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" Width="400px" class="blueborder"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtEmail" EnableClientScript="true" ClientValidationFunction="ValidateEmail" ValidateEmptyText="true">
                </asp:CustomValidator>
            </div>
            Message:<br />
            <div class="vibrate">
                <asp:TextBox ID="txtMessage" runat="server" ClientIDMode="Static" TextMode="MultiLine" Width="400px" Height="200px" class="blueborder"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtMessage" EnableClientScript="true" ClientValidationFunction="ValidateMessage" ValidateEmptyText="true">
                </asp:CustomValidator>
            </div>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Button"  />
        </asp:View>
        <asp:View ID="View2" runat="server">

        </asp:View>
    </asp:MultiView>
               
</asp:Content>