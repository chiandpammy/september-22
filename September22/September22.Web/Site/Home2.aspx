<%@ Page Title="Home2" Language="C#" MasterPageFile="~/Master/Site_2Col.Master" AutoEventWireup="true" Inherits="September22.Site.Home2" EnableViewState="false" EnableEventValidation="false" Codebehind="Home2.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumnContent" runat="Server">
    <!-- Article -->
    <asp:ListView ID="lvContents" runat="server" DataSourceID="srcContent" ItemPlaceholderID="itemPlaceholderContent" OnDataBound="lvContents_DataBound">
        <ItemTemplate>
            <h2>
                <span>
                    <%--<asp:HyperLink ID="hlTitle" runat="server" Text='<%# Eval("PostTitle") %>' />--%>
                    aaaa
                </span>
            </h2>
            <p class="info">
                <span class="date">
                    <asp:Label ID="lblDateTime" runat="server" Text='<%# Eval("CreatedDateTime") %>' />
                </span>
                <span class="cat">
                    <asp:HyperLink ID="hlCatetory" runat="server" Text='<%# Eval("CreatingUserName") %>' />
                </span>
                <span class="user">
                    <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("CreatingUserName") %>' />
                </span>
                <span class="comments">
                    <asp:HyperLink ID="hlComment" runat="server" Text='<%# "Comments (" + Eval("CommentCount") + ")"%>' />
                </span>
            </p>
            <p>
                <asp:Label ID="lblPost" runat="server" Text='<%# Eval("ContentHTML") %>'></asp:Label>
            </p>
            <p class="btn-more box">
                <strong>
                    <asp:HyperLink ID="hlPost" runat="server" Text="Continue" NavigateUrl='<%# "~/Site/Home.aspx?postID=" + Eval("PostID") %>' /></span>
                </strong>
            </p>
            <asp:ListView ID="lvComments" runat="server" ItemPlaceholderID="itemPlaceholderConmment" DataSource='<%# Eval("Comments") %>'>
                <ItemTemplate>
                        <p class="info">
                            <span class="date">
                                <asp:Label ID="lblDateTime" runat="server" Text='<%# Eval("CreatedDateTime") %>' />
                            </span>
                            <span class="user">
                                <asp:HyperLink ID="hlUserName" runat="server" Text='<%# Eval("CreatingUserName") %>' />
                            </span>
                        </p>
                        <p>
                            <asp:Label ID="lblPost" runat="server" Text='<%# Eval("ContentHTML") %>'></asp:Label>
                        </p>
                        <br />
                        <br />
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="comments">
                        <h4>
                            <span>
                                <asp:Label ID="lblCommentTitle" runat="server" Text="Comments (10)" />
                            </span>
                        </h4>
                        <asp:PlaceHolder ID="itemPlaceholderConmment" runat="server"></asp:PlaceHolder>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </ItemTemplate>
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholderContent" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="srcContent" runat="server" SelectMethod="GetContents" TypeName="September22.Common.Class1"
        OnSelected="srcContent_Selected">
        <SelectParameters>
            <asp:QueryStringParameter Name="postID" QueryStringField="postID" Type="Int32" />
            <asp:QueryStringParameter Name="categoryID" QueryStringField="catID" Type="Int32" />
            <asp:QueryStringParameter Name="sectionID" QueryStringField="secID" Type="Int32" />
            <asp:Parameter Direction="Output" Name="secID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="RightColumnContent" runat="Server">
    <asp:ListView ID="lvNavigatoin" runat="server" DataSourceID="srcNavigation" ItemPlaceholderID="itemPlaceholder">
        <ItemTemplate>
            <h3>
                <span>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("HeaderName") %>'></asp:Label>
                </span>
            </h3>
            <ul>
                <asp:ListView 
                    ID="lParentNavigation" 
                    runat="server" 
                    ItemPlaceholderID="itemPlaceholderParent"
                    DataSource='<%# Eval("Links") %>'>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink 
                                ID="HyperLink1" 
                                runat="server" 
                                NavigateUrl='<%# Eval("LinkURL") %>'
                                Text='<%# Eval("LinkName") %>' 
                                CssClass="accordion" />
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemPlaceholderParent" runat="server"></asp:PlaceHolder>
                    </LayoutTemplate>
                </asp:ListView>
            </ul>
        </ItemTemplate>
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="srcNavigation" runat="server" SelectMethod="GetNavigation"
        TypeName="September22.Common.Class1" DataObjectTypeName="object">
        <SelectParameters>
            <asp:QueryStringParameter Name="sectionID" QueryStringField="secID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>
