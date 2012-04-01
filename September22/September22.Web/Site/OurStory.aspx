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
                    I first met Chi in the summer of 2002, on June 10th, a Monday... the first day of 
                    the second summer session. I was taking an extra computer science class to try to
                    graduate on-time. I walked into the room and took a seat in the front row, oblivious
                    to whomever was sitting in the rows behind me. At the end of class, I walked out
                    with my new heels and no umbrella... only to find it raining outside. Of course.
                </p>
                <p>
                    Well, tough. I had to get across campus for my next class. As I looked out of DCL, 
                    there was a guy standing by the door, offering to share his umbrella with me. I 
                    thought, "Wow, chivalry isn't dead after all." So we walked out together, huddled
                    under his umbrella, and before long, we stopped at Everitt Lab, where his next class
                    would be. I said goodbye and leapfrogged from one building to the next until I got
                    to my next class.
                </p>
                <p>
                    An informal study group started meeting in the union after classes ended, and I 
                    saw Chi there most days. That first weekend after class started, though, I went out
                    of town and didn't get back 'til late Sunday, and of course I hadn't started on my 
                    homework. I did see Chi online, though, and so I IMed him asking if he'd help me.
                    He got on Durai's bike and rode across campus to let me copy his homework.
                </p>
                <p>
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
