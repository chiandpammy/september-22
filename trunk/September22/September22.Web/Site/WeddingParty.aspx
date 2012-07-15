<%@ Page Title="Wedding Party" Language="C#" MasterPageFile="~/Master/Site_2Col.master" AutoEventWireup="true" CodeBehind="WeddingParty.aspx.cs" Inherits="September22.WeddingParty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumnContent" runat="server">
<div id="wrapper">
        <div id="steps">
            <div class="step">
            <h2><span>Women of Distinction</span></h2>
            <table border="0" cellpadding="2" cellspacing="0" width="470px">
                <tbody>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                    <tr>
                        <td width="150">
                            <img align="left" alt="" src="http://graph.facebook.com/guamacario/picture?type=large" width="150" /></td>
                        <td valign="top">
                            <b>Luella May </b>- Maid of Honor<br /><br />
                            Luella is Pamela&rsquo;s favorite sister, okay only sister, but still her favorite!&nbsp;She is Pamela&rsquo;s confidante and co-conspirator and will be the best maid of honor!</td>
                    </tr>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                    <tr>
                        <td style="padding: 5px;" width="150">
                            <img align="left" alt="" src="http://graph.facebook.com/778027537/picture?type=large" width="150" /></td>

                        <td valign="top">

                            <b>April</b><br />
                            <br />
                            April and Pamela grew up together on a rock in the middle of the Pacific all the way until April took off for the Big Apple. When April moved to Chicago a few years ago, they started catching up again and have been introducing each other to the best food and drink the city has to offer ever since.<br /><br />April has also been Pamela's self-appointed wedding planner throughout the exciting wedding planning process.
                            </td>
                    </tr>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                    <tr>
                        <td width="150">
                            <img align="left" alt="" src="http://graph.facebook.com/nyvellee/picture?type=large" width="150" /></td>
                        <td valign="top">
                            <b>Janice</b><br /><br />
                            Janice and Pamela met when they were 5 years old and have been close friends ever since. Though time and space have separated them on and off through the years, whenever they get together, it feels as if they've never truly been apart.<br /><br />She's also the super talented graphic designer who is responsible for our announcements and invitations!
                            <%--Janice is one of those friends who's impossible not to like.  Whether it's been 5 years or 5 minutes since the last time you've seen her, all the time instantly melts away, and it's as if she'd never left your side.--%>
                            </td>
                    </tr>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                    <tr>
                        <td style="padding: 5px;" width="150">
                            <img align="left" alt="" src="http://graph.facebook.com/754333847/picture?type=large" width="150" /></td>

                        <td valign="top">

                            <b>Mina</b><br /><br />
                            Mina is Chi's younger sister, and she is the floral designer responsible for all the beautiful floral      arrangements at the wedding!
                            </td>
                    </tr>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                    <tr>
                        <td style="padding: 5px;" width="150">
                            <img align="left" alt="" src="http://graph.facebook.com/32811574/picture?type=large" width="150" /></td>

                        <td valign="top">

                            <b>Nana</b><br />
                            <br />
                            Nana is Chi's younger sister.  She's a pharmacist out in Boston and a huge animal lover.
                            </td>
                    </tr>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                </tbody>
            </table>
        </div>
        <div class="step">
            <h2><span>Men of no musical skills</span></h2>
            <table border="0" cellpadding="2" cellspacing="0" width="470px">
                <tbody>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                    <tr>
                        <td colspan="2">We will find them soon.</td></tr>
                    <tr><td colspan="2"><br /><hr /></td></tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content runat="Server" ID="Content3" ContentPlaceHolderID="RightColumnContent">
    <div id="navigation">
        <h3><span>The Wedding Party!</span></h3>
        <ul>
            <li><asp:HyperLink ID="hlBridesmaids" runat="server" Text="Women of Distinction" NavigateUrl="#"></asp:HyperLink></li>
            <li><asp:HyperLink ID="hlGroomsmen" runat="server" Text="Men of no musical skills" NavigateUrl="#"></asp:HyperLink></li>
        </ul>
    </div>
</asp:Content>