<%@ Page Title="Rsvp" Language="C#" MasterPageFile="~/Master/Site_1Col.master" AutoEventWireup="true"
    CodeBehind="Rsvp.aspx.cs" Inherits="September22.Rsvp" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
        function bounce() {
            $(".bounce").effect("bounce", { times: 4, distance: 16 }, 200);
            $(".bounce-little").effect("bounce", { times: 3, distance: 8 }, 200);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiddleColumnContent" runat="server">
    <h2>
        <span>RSVP</span></h2>
    <asp:Label ID="timeLabel" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="listview rounded-corner">
                <div>
                    Name
                </div>
                <div>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RadioButtonList ID="rbAccept" runat="server" RepeatDirection="Horizontal" 
                        AutoPostBack="True" onselectedindexchanged="rbAccept_SelectedIndexChanged">
                        <asp:ListItem Value="Yes">Accept with Pleasure</asp:ListItem>
                        <asp:ListItem Value="No">Decline with regret</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Button runat="server" ID="btnNewGuest" Text="Add another Guest" UseSubmitBehavior="False"
                        OnClick="btnNewGuest_Click" Visible="False" />
                </div>
            </div>
            <div style="height: 4px;"></div>
            <asp:MultiView ID="mvRSVP" runat="server">
                <asp:View ID="viewAccepted" runat="server">
                    <asp:ListView runat="server" ID="lvGuests" OnDataBound="lvGuests_DataBound" OnItemDeleting="lvGuests_ItemDeleting">
                        <ItemTemplate>
                            <asp:Panel runat="server" ID="itemPlaceHolder">
                                <div style="height: 4px;">
                                </div>
                                <div class="listview rounded-corner">
                                    <asp:TextBox ID="txtGuest" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                                    <asp:DropDownList ID="ddlDinnerPreference" runat="server">
                                    </asp:DropDownList>
                                    <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/App_Themes/Wedding/Images/delete.gif"
                                        CommandName="Delete" ImageAlign="AbsMiddle" />
                                </div>
                                <div style="height: 4px;">
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:ListView>
                </asp:View>
                <asp:View ID="viewDeclined" runat="server">
                    <p>
                        Awww... That's a shame. We're sorry you can't make it.
                    </p>
                    <p>
                        Press the confirm button to let us know. Hope to see you soon
                    </p>
                </asp:View>
            </asp:MultiView>
            <asp:Button runat="server" ID="btnConfirm" Text="Confirm" UseSubmitBehavior="False"
                OnClick="btnConfirm_Click" style="margin-top: 20px;" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnConfirm" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnNewGuest" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
