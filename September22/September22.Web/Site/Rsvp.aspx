<%@ Page Title="Rsvp" Language="C#" MasterPageFile="~/Master/Site_1Col.master" AutoEventWireup="true"
    CodeBehind="Rsvp.aspx.cs" Inherits="September22.Rsvp" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        div.accept label { position: absolute; text-align:right; width:90px; }
        div.accept input[type="text"], textarea, select { margin-left: 100px; }
        /*div.accept label.input, label.select { position:relative; text-align:left; }*/
        div.accept label:after { content: ": " }
    </style>

    <script language="javascript" type="text/javascript">
        function bounce() {
            $(".bounce").effect("bounce", { times: 4, distance: 8 }, 200);
        };

        function selected(source, eventArgs) {
            var hdnValueID = "<%= hfInvitationName.ClientID %>";
            document.getElementById(hdnValueID).value = eventArgs.get_value();

            __doPostBack(hdnValueID, "");
        }
    </script>
    <style type="text/css">
        .completion_list
        {
            margin: 0px;
            overflow: hidden;
            background: transparent url("../App_Themes/Wedding/Images/completion_pointer.gif") no-repeat 32px 0px;
            padding-top: 10px;
            cursor: pointer;
        }
        
        .completion_list > :first-child
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
        
        .completion_list > :last-child
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
        
        .completion_list_item
        {
            /*padding: 4px 8px;*/ /* background-color: #00447e;*/
            padding: 2px 8px 6px 8px;
            background-color: #444444;
            color: #c7d6e3;
        }
        
        .completion_list_item_highlighted
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
                    Step 1: Look for your invitation.
                </div>
                <div>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender ID="acextName" runat="server" TargetControlID="txtName"
                        ServicePath="Rsvp.aspx" ServiceMethod="GetCompletionList" MinimumPrefixLength="2"
                        OnClientItemSelected="selected" CompletionListCssClass="completion_list" CompletionListItemCssClass="completion_list_item"
                        CompletionListHighlightedItemCssClass="completion_list_item_highlighted" CompletionInterval="1">
                    </ajaxToolkit:AutoCompleteExtender>
                    <asp:HiddenField ID="hfInvitationName" runat="server" />
                </div>
            </div>
            <div style="height: 8px;">
            </div>
            <asp:Panel runat="server" ID="pnlDecision" CssClass="listview rounded-corner" Visible="false">
                <div>
                    Step 2: Tell us if you're coming.
                </div>
                <asp:RadioButtonList ID="rbAccept" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                    OnSelectedIndexChanged="rbAccept_SelectedIndexChanged">
                    <asp:ListItem Value="Yes">Accept with Pleasure</asp:ListItem>
                    <asp:ListItem Value="No">Decline with regret</asp:ListItem>
                </asp:RadioButtonList>
            </asp:Panel>
            <div style="height: 8px;">
            </div>
            <asp:MultiView ID="mvRSVP" runat="server">
                <asp:View ID="viewAccepted" runat="server">
                    <asp:Panel runat="server" ID="pnlAccepted" CssClass="listview rounded-corner">
                        <div>
                            Step 3: Tell us who's coming.
                        </div>
                        <!--[if (IE 9)]><!-->
                        <div class="gradient-wrapper">
                            <!--<![endif]-->
                            <asp:Button runat="server" ID="btnNewGuest" Text="Add another Guest" UseSubmitBehavior="False"
                                OnClick="btnNewGuest_Click" Visible="false" />
                        </div>
                        <asp:ListView runat="server" ID="lvGuests" OnDataBound="lvGuests_DataBound" OnItemDeleting="lvGuests_ItemDeleting">
                            <ItemTemplate>
                                <asp:Panel runat="server" ID="itemPlaceHolder">
                                    <div style="height: 4px;">
                                    </div>
                                    <div class="accept">
                                        <label for="txtGuest" style="vertical-align:top">Name</label>
                                        <asp:TextBox ID="txtGuest" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                                        <label class="dinnerOptions" for="ddlDinnerPreferences">Dinner Options</label>
                                        <asp:DropDownList ID="ddlDinnerPreferences" runat="server" DataSourceID="odsDinnerPreferences"
                                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Eval("DinnerPreference") %>'>
                                        </asp:DropDownList>
                                        <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/App_Themes/Wedding/Images/delete.gif"
                                            CommandName="Delete" ImageAlign="AbsMiddle" />
                                    </div>
                                    <div style="height: 4px;">
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:ListView>
                        <div class="accept" style="vertical-align:top">
                            <label for="txtSpecialRequest">Special Request</label>
                            <asp:TextBox ID="txtSpecialRequest" runat="server" ClientIDMode="Static" TextMode="MultiLine" Height="100px" MaxLength="500" class="border blue" Width="500px"></asp:TextBox>
                        </div>
                    </asp:Panel>
                </asp:View>
                <asp:View ID="viewDeclined" runat="server">
                    <asp:Panel runat="server" ID="pnlDeclined" CssClass="listview rounded-corner">
                        <div>
                            Step 3: Tell us who's coming.
                        </div>
                        <p>
                            Awww... That's a shame. We're sorry you can't make it.
                        </p>
                        <p>
                            Press the confirm button to let us know. Hope to see you soon
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
            <asp:Parameter Name="addBlank" Type="Boolean" DefaultValue="true" />
            <asp:Parameter Name="excludeOther" Type="Boolean" DefaultValue="true" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
