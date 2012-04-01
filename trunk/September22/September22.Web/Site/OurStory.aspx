<%@ Page Title="Our Story" Language="C#" MasterPageFile="~/Master/Site_2Col.Master" AutoEventWireup="true" CodeBehind="OurStory.aspx.cs" Inherits="September22.OurStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../App_Themes/Wedding/jquery-sliding.form.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumnContent" runat="Server">
    <div id="wrapper">
        <div id="steps">
            <div class="step">
                <h2><span>Pamela Says</span></h2>
                <p>
                    It was the summer of 2002, on June 10th, the first day of the second summer session.
                    I was taking an extra computer science class to try to graduate on-time. Chi was
                    just getting in another technical class under his belt, but I didn't know him then.
                    I walked into the room and took a seat in the front row, oblivious to whomever was
                    sitting in the rows behind me. At the end of class, I walked out in my new outfit with
                    my heels and no umbrella... only to find it raining outside.
                </p>
            </div>
            <div class="step">
                <h2><span>Chi Says</span></h2>
                <p>
                    Hi
                </p>
            </div>
            <div class="step">
                <h2><span>Our Proposal</span></h2>
                <p>
                    Coming soon!
                    </p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightColumnContent" runat="Server">
    <div id="navigation">
        <h3>
            <span>
                <asp:Label ID="Label1" runat="server" Text="Our Story"></asp:Label>
            </span>
        </h3>
        <ul>
            <li><asp:HyperLink ID="HyperLink1" runat="server" Text="Pamela Says" NavigateUrl="#" /></li>
            <li><asp:HyperLink ID="HyperLink3" runat="server" Text="Chi Says" NavigateUrl="#" /></li>
            <li><asp:HyperLink ID="HyperLink2" runat="server" Text="Our Proposal" NavigateUrl="#" /></li>
        </ul>
    </div>
</asp:Content>
