<%@ Page Title="Wedding Party" Language="C#" MasterPageFile="~/Master/Site_2Col.master" AutoEventWireup="true" CodeBehind="WeddingParty.aspx.cs" Inherits="September22.WeddingParty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Steps.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumnContent" runat="server">
<div id="wrapper">
    <div id="steps">
        <div class="step">
            <h2><span>My wonderful bridesmaids</span></h2>

            <table border="0" cellpadding="2" cellspacing="0" width="100%">
	            <tbody>
		            <tr>
			            <td width="150">
				            <img align="left" alt="" src="http://graph.facebook.com/guamacario/picture?type=large" width="150" /></td>
			            <td valign="top">
				            <b>Luella May </b>- Maid of Honor<br /><br />
				            Luella is Pamela&rsquo;s favorite sister, okay only sister, but still her favorite!&nbsp;She is Pamela&rsquo;s confidante and co-conspirator and will be the best maid of honor!</td>
		            </tr>
		            <tr>
			            <td style="padding: 5px;" width="150">
				            <img align="left" alt="" src="http://graph.facebook.com/778027537/picture?type=large" width="150" /></td>

			            <td valign="top">

				            <b>April</b><br />
				            <br />
				            <!--Meg and Sara were college roommates. They were partners in crime and probably would not have made it through college without each other!-->
                            </td>
		            </tr>
                    <tr>
			            <td width="150">
				            <img align="left" alt="" src="http://graph.facebook.com/nyvellee/picture?type=large" width="150" /></td>
			            <td valign="top">
				            <b>Janice</b><br /><br />
				            Janice and Pamela met when they were 5 years old and have been close friends ever since.&nbsp;Janice is one of those friends who's impossible not to like.  Whether it's been 5 years or 5 minutes since the last time you've seen her, all the time instantly melts away, and it's as if she'd never left your side.</td>
		            </tr>
                    <tr>
			            <td style="padding: 5px;" width="150">
				            <img align="left" alt="" src="http://graph.facebook.com/754333847/picture?type=large" width="150" /></td>

			            <td valign="top">

				            <b>Mina</b><br />
				            <br />
				            <!--Meg and Sara were college roommates. They were partners in crime and probably would not have made it through college without each other!-->
                            </td>
		            </tr>
                    <tr>
			            <td style="padding: 5px;" width="150">
				            <img align="left" alt="" src="http://graph.facebook.com/32811574/picture?type=large" width="150" /></td>

			            <td valign="top">

				            <b>Nana</b><br />
				            <br />
				            <!--Meg and Sara were college roommates. They were partners in crime and probably would not have made it through college without each other!-->
                            </td>
		            </tr>
	            </tbody>
            </table>
        </div>
        <div class="step">
            <h2><span>Men of Honor</span></h2>
            <p>We haven't found any!</p>
        </div>            
    </div>
</div>
</asp:Content>
<asp:Content runat="Server" ID="Content3" ContentPlaceHolderID="RightColumnContent">
    <div id="navigation">
        <h3><span>The Wedding Party!</span></h3>
        <ul>
            <li><asp:HyperLink ID="hlBridesmaids" runat="server" Text="Women of Distinction" NavigateUrl="#"></asp:HyperLink></li>
            <li><asp:HyperLink ID="hlGroomsmen" runat="server" Text="Men of Honor" NavigateUrl="#"></asp:HyperLink></li>
        </ul>
    </div>
</asp:Content>