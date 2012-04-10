<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site_1Col.master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="September22.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
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
                $("#txtEmail").removeClass('red');
                $("#txtEmail").addClass('blue');
            }
            else {
                $("#txtEmail").effect("shake", { times: 4, distance: 4 }, 50);
                $("#txtEmail").removeClass('blue');
                $("#txtEmail").addClass('red');
            }
        };

        function ValidateName(oSrc, args) {
            if ($("#txtName").val().trim() == "") {
                $("#txtName").effect("shake", { times: 4, distance: 4 }, 50);
                $("#txtName").removeClass('blue');
                $("#txtName").addClass('red');
                args.IsValid = false;
            }
            else {
                $("#txtName").removeClass('red');
                $("#txtName").addClass('blue');
                args.IsValid = true;
            }
        };

        function ValidateMessage(oSrc, args) {
            if ($("#txtMessage").val().trim() == "") {
                $("#txtMessage").effect("shake", { times: 4, distance: 4 }, 50);
                $("#txtMessage").removeClass('blue');
                $("#txtMessage").addClass('red');
                args.IsValid = false;
            }
            else {
                $("#txtMessage").removeClass('red');
                $("#txtMessage").addClass('blue');
                args.IsValid = true;
            }
        };
    </script>
    <style type="text/css">
        input, textarea
        {
            width: 400px;
            resize: none;
        }
        .border
        {
            border-width: 5px;
            border-style: solid;
            margin-bottom: 15px;
        }
        .blue
        {
            border-color: #4dd0f5;
        }
        .red
        {
            border-color: #ff0000;
        }
        .view 
        {
            min-height:440px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiddleColumnContent" runat="server">
    <h2><span>Contact Us</span></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional">
        <ContentTemplate>
        <asp:MultiView ID="mviewContactUs" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewContactForm" runat="server">
                <div class="view">
                    <br />
                    Name:<br />
                    <div>
                        <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" class="border blue"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtName" EnableClientScript="true" ClientValidationFunction="ValidateName" ValidateEmptyText="true">
                        </asp:CustomValidator>
                    </div>
                    Email:<br />
                    <div>
                        <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" class="border blue"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtEmail" EnableClientScript="true" ClientValidationFunction="ValidateEmail" ValidateEmptyText="true">
                        </asp:CustomValidator>
                    </div>
                    Message:<br />
                    <div>
                        <asp:TextBox ID="txtMessage" runat="server" ClientIDMode="Static" TextMode="MultiLine" Height="200px"  MaxLength="400" class="border blue"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtMessage" EnableClientScript="true" ClientValidationFunction="ValidateMessage" ValidateEmptyText="true">
                        </asp:CustomValidator>
                    </div>
                    <br />
                    <asp:Button ID="btnSend" runat="server" Text="Send" onclick="btnSend_Click" />
                </div>
            </asp:View>
            <asp:View ID="viewFinished"  runat="server">
                <div class="view">
                    <br />Email has been sent.  Thank you.
                </div>
            </asp:View>
        </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>