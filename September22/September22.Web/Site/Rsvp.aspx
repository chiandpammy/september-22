<%@ Page Title="Rsvp" Language="C#" MasterPageFile="~/Master/Site_1Col.master" AutoEventWireup="true"
    CodeBehind="Rsvp.aspx.cs" Inherits="September22.Rsvp" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        div.left_indent label
        {
            position: absolute;
            text-align: right;
            width: 140px;
            margin-top: 4px;
        }
        div.left_indent input[type="text"], textarea, select
        {
            margin-left: 150px;
        }
        div.left_indent input[type="image"]
        {
            margin-top: -4px;
        }
        div.left_indent td
        {
            width: 150px;
        }
        div.left_indent td label
        {
            text-align: left;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function bounce() {
            $(".bounce").effect("bounce", { times: 3, distance: 8 }, 200);
        };

        function selected(source, eventArgs) {
            var hdnValueID = "<%= hfInvitationName.ClientID %>";
            document.getElementById(hdnValueID).value = eventArgs.get_value();

            __doPostBack(hdnValueID, "");
        }
    </script>
    <style type="text/css">
        .invitation_list
        {
            margin: 0px;
            overflow: hidden;
            background: transparent url("../App_Themes/Wedding/Images/completion_pointer.gif") no-repeat 32px 0px;
            padding-top: 10px;
            cursor: pointer;
        }
        
        .invitation_list > :first-child
        {
            -webkit-border-top-left-radius: 10px; /* chrome and safari */
            -khtml-border-top-left-radius: 10px;
            -moz-border-top-left-radius: 10px; /* firefox */
            border-top-left-radius: 10px;
            -webkit-border-top-right-radius: 10px; /* chrome and safari */
            -khtml-border-top-right-radius: 10px;
            -moz-border-top-right-radius: 10px; /* firefox */
            border-top-right-radius: 10px;
        }
        
        .invitation_list > :last-child
        {
            -webkit-border-bottom-left-radius: 10px; /* chrome and safari */
            -khtml-border-bottom-left-radius: 10px;
            -moz-border-bottom-left-radius: 10px; /* firefox */
            border-bottom-left-radius: 10px;
            -webkit-border-bottom-right-radius: 10px; /* chrome and safari */
            -khtml-border-bottom-right-radius: 10px;
            -moz-border-bottom-right-radius: 10px; /* firefox */
            border-bottom-right-radius: 10px;
        }
        
        .invitation_list_item
        {
            /*padding: 4px 8px;*/ /* background-color: #00447e;*/
            padding: 2px 8px 6px 8px;
            background-color: #444444;
            color: #c7d6e3;
        }
        
        .invitation_list_item_highlighted
        {
            padding: 4px 8px;
            background-color: #0fc0f3;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiddleColumnContent" runat="server">
    <h2>
        <span>RSVP</span></h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="height: 8px;">
            </div>
            <div class="listview rounded-corner">
                <div>
                    <h5>
                        Step 1: Please enter the name on your invitation.
                    </h5>
                </div>
                <div class="left_indent">
                    <label for="txtInvitation" style="vertical-align: top">
                        Name on the invitation:
                    </label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender ID="acextName" runat="server" TargetControlID="txtName"
                        ServicePath="Rsvp.aspx" ServiceMethod="GetInvitationList" MinimumPrefixLength="2"
                        OnClientItemSelected="selected" CompletionListCssClass="invitation_list" CompletionListItemCssClass="invitation_list_item"
                        CompletionListHighlightedItemCssClass="invitation_list_item_highlighted" CompletionInterval="1">
                    </ajaxToolkit:AutoCompleteExtender>
                    <asp:HiddenField ID="hfInvitationName" runat="server" />
                </div>
            </div>
            <div style="height: 8px;">
            </div>
            <asp:Panel runat="server" ID="pnlDecision" CssClass="listview rounded-corner" Visible="false">
                <div>
                    <h5>
                        Step 2: Tell us if you're coming.
                    </h5>
                </div>
                <div class="left_indent">
                    <asp:RadioButtonList ID="rbAccept" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                        OnSelectedIndexChanged="rbAccept_SelectedIndexChanged">
                        <asp:ListItem Value="True">Accept with Pleasure</asp:ListItem>
                        <asp:ListItem Value="False">Decline with regret</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </asp:Panel>
            <div style="height: 8px;">
            </div>
            <asp:MultiView ID="mvRSVP" runat="server">
                <asp:View ID="viewAccepted" runat="server">
                    <asp:Panel runat="server" ID="pnlAccepted" CssClass="listview rounded-corner">
                        <div style="float:left">
                            <h5>
                                Step 3: Tell us who's coming and what they'd like to eat.
                            </h5>
  
                        </div>
                            <!--[if (IE 9)]><!-->
                            <div class="gradient-wrapper" style="margin:8px;">
                                <!--<![endif]-->
                                <asp:Button runat="server" ID="btnNewGuest" Text="Add another Guest" UseSubmitBehavior="False"
                                    OnClick="btnNewGuest_Click" Visible="false" />
                            </div>
                        <div style="clear:both">
                            <asp:ListView runat="server" ID="lvGuests" OnDataBound="lvGuests_DataBound" OnItemDeleting="lvGuests_ItemDeleting">
                            <ItemTemplate>
                                <asp:Panel runat="server" ID="itemPlaceHolder">
                                    <div style="height: 4px;">
                                    </div>
                                    <div class="left_indent">
                                        <label for="txtGuest" style="vertical-align: top">
                                            Guest Name:
                                        </label>
                                        <asp:TextBox ID="txtGuest" runat="server" Text='<%# Eval("FullName") %>'></asp:TextBox>
                                        <label class="dinnerOptions" for="ddlDinnerPreferences">
                                            Dinner Options:
                                        </label>
                                        <asp:DropDownList ID="ddlDinnerPreferences" runat="server" DataSourceID="odsDinnerPreferences"
                                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("SelectedDinnerPreferenceID") %>'
                                            AppendDataBoundItems="True">
                                            <asp:ListItem Text="" Value="-1" />
                                        </asp:DropDownList>
                                        <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/App_Themes/Wedding/Images/delete.gif"
                                            CommandName="Delete" ImageAlign="AbsMiddle" />
                                    </div>
                                    <div style="height: 4px;">
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:ListView>
                        </div>
                        <div class="left_indent" style="vertical-align: top">
                            <label for="txtSpecialRequest">
                                Special Request:
                            </label>
                            <asp:TextBox ID="txtSpecialRequest" runat="server" ClientIDMode="Static" TextMode="MultiLine"
                                Height="100px" MaxLength="500" class="border blue" Width="350px"></asp:TextBox>
                        </div>
                    </asp:Panel>
                </asp:View>
                <asp:View ID="viewDeclined" runat="server">
                    <asp:Panel runat="server" ID="pnlDeclined" CssClass="listview rounded-corner">
                        <div>
                            <h5>
                                Step 3: Awww...
                            </h5>
                        </div>
                        <p>
                            Awww... That's a shame. We're sorry you can't make it.
                        </p>
                        <p>
                            Press the confirm button to let us know. Hope to see you soon.
                        </p>
                    </asp:Panel>
                </asp:View>
            </asp:MultiView>
            <div style="height: 32px;">
            </div>
            <!--[if (IE 9)]><!-->
            <div class="gradient-wrapper">
                <!--<![endif]-->
                <asp:Button runat="server" ID="btnConfirm" Text="Confirm" Visible="false" UseSubmitBehavior="False"
                    OnClick="btnConfirm_Click" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnConfirm" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnNewGuest" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsDinnerPreferences" runat="server" SelectMethod="GetDinnerPreferences"
        TypeName="September22.DAL.DataAccess">
        <SelectParameters>
            <asp:Parameter Name="excludeOther" Type="Boolean" DefaultValue="true" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
