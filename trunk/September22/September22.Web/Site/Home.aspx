<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site_2Col.Master" AutoEventWireup="true"
    Inherits="Setpember22.Site.Home" EnableViewState="false" EnableEventValidation="false"
    CodeBehind="Home.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #wrapper
        {
            position: relative;
            width: 470px;
            overflow: hidden;
            height: 100%;
        }
        #steps
        {
            position: relative;
            width: 510px;
            overflow: hidden;
        }
        .step
        {
            width: 510px;
            float: left;
        }
        .step p
        {
            padding: 0 50 0 10px; 
            padding-right:50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumnContent" runat="Server">
    <div id="wrapper" class="article">
        <div id="steps">
            <div class="step">
                <h2><span>Pamela's Story...</span></h2>
                <p>
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting behind me. At the end of class, I walked out in my heels and a skirt with
                    no umbrella... only to find it raining outside.
                </p>
            </div>
            <div class="step">
                <h2><span>Personal</span></h2>
                <p>
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting behind me. At the end of class, I walked out in my heels and a skirt with
                    no umbrella... only to find it raining outside.
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting behind me. At the end of class, I walked out in my heels and a skirt with
                    no umbrella... only to find it raining outside.
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting behind me. At the end of class, I walked out in my heels and a skirt with
                    no umbrella... only to find it raining outside.
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting behind me. At the end of class, I walked out in my heels and a skirt with
                    no umbrella... only to find it raining outside.
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting behind me. At the end of class, I walked out in my heels and a skirt with
                    no umbrella... only to find it raining outside.
                </p>
            </div>
            <div class="step">
                <h2><span>Personal</span></h2>
                <p>
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting behind me. At the end of class, I walked out in my heels and a skirt with
                    no umbrella... only to find it raining outside.
                    </p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightColumnContent" runat="Server">
    <div id="navigation">
        <asp:ListView ID="lvNavigatoin" runat="server" DataSourceID="srcNavigation" ItemPlaceholderID="itemPlaceholder">
            <ItemTemplate>
                <h3>
                    <span>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("HeaderName") %>'></asp:Label>
                    </span>
                </h3>
                <ul>
                    <asp:ListView ID="lParentNavigation" runat="server" ItemPlaceholderID="itemPlaceholderParent"
                        DataSource='<%# Eval("Links") %>'>
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("LinkName") %>' NavigateUrl='<%# Eval("LinkURL") %>' />
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
    </div>
    <asp:ObjectDataSource ID="srcNavigation" runat="server" SelectMethod="GetNavigation"
        TypeName="September22.Common.Class1" DataObjectTypeName="object">
        <SelectParameters>
            <asp:QueryStringParameter Name="sectionID" QueryStringField="secID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
