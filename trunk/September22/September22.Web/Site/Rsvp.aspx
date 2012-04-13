<%@ Page Title="Rsvp" Language="C#" MasterPageFile="~/Master/Site_1Col.master" AutoEventWireup="true"
    CodeBehind="Rsvp.aspx.cs" Inherits="September22.Rsvp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
        function bounce() {
            $(".bounce").effect("bounce", { times: 5 }, 300);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiddleColumnContent" runat="server">
    <h2><span>RSVP</span></h2>
    <p>Coming soon!</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="margin: 30;">
                name: <asp:TextBox ID="txtName" runat="server" />
            </div>
            <asp:Button runat="server" ID="btnNewGuest" Text="abcd" UseSubmitBehavior="False" 
                onclick="btnNewGuest_Click" />
            <br />
            <asp:ListView runat="server" ID="lvGuests" ondatabound="lvGuests_DataBound">
                <ItemTemplate>
                    <asp:Panel runat="server" ID="bounceControl">
                        <div class="listview rounded-corner">
                            <asp:Label Text='<%# Eval("Name") %>' runat="server" /><br />
                        </div>
                    </asp:Panel>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
