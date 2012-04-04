<%@ Page Title="Our Story" Language="C#" MasterPageFile="~/Master/Site_2Col.Master" AutoEventWireup="true" CodeBehind="OurStory.aspx.cs" Inherits="September22.OurStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                    After that, I started hanging out with him more during and after the study group
                    sessions. We'd often go out to eat afterwards, sometimes with the group; other times,
                    it would just be the two of us. We spent 5 hours talking in the Empire Chinese restaurant
                    one day. We kept in touch over the break before fall session, and we started seeing
                    each other soon after school started that fall.
                </p>
            </div>
            <div class="step">
                <h2><span>Chi Says</span></h2>
                <p>
                    He's taking the 5th!
                </p>
            </div>
            <div class="step">
                <h2><span>Our Proposal</span></h2>
                <p>
                    We got engaged on our ninth anniversary on September 22, 2011. It started out as 
                    most of our anniversary date nights do. Chi picks out the restaurant and makes the
                    reservation, and all I have to do is make myself pretty for the evening. This particular
                    evening, there were just a few hints that something was different about that night.
                </p>
                <p>
                    First, there was the mysterious appearance of a large white envelope that Chi almost
                    dropped on the way to the car... an envelope that Chi refused to let me see on the way
                    to the restaurant. Then, there was the phone call Chi made from the car when we hit 
                    traffic on the highway, apologizing for us being late. Chi <b>never</b> calls a restaurant
                    to apologize. He might tell them we're running late and ask them to change our reservation,
                    but he wouldn't apologize for being late. It just goes against everything he believes in. ;)
                </p>
                <p>
                    So we pulled up to what I had assumed was the restaurant parking lot, when Chi asked
                    me "Do you know where we are, honey?" I then looked around, and I saw a convenience store,
                    a dry cleaners, and a jewelry store. Chi told me we were going to the jewelry store,
                    and I got excited because I was going to get something sparkly. =) When we stepped inside,
                    we were the only ones in the store, and the owner and a salesperson were looking at us
                    expectantly. Chi handed the owner the mysterious white envelope, from which the owner then
                    retrieved and started examining my diamond!!! I was shocked speechless. I grabbed Chi and
                    looked from him to the owner and back again, just giggling and squealing for joy, unable to
                    speak. Then, I gave Chi a big kiss before I was promptly directed to go choose my setting.
                </p>
                <p>
                    After choosing my setting, we went on to Gibson's for dinner, having missed our reservation
                    by hours. Soon afterwards, I was anxious to see my complete ring. My parents were coming in
                    two weeks after our anniversary for my birthday celebration, and I wanted to show them my ring.
                    Chi informed me, however, that it wouldn't arrive in time for their visit; so I was a little
                    disappointed.
                </p>
                <p>
                    When my birthday rolled around, we had a great time playing Whirlyball, followed by a fabulous
                    dinner party at Sunda. When the birthday cake came out, there was an extra surprise that came
                    with it: a sparkly golden frog. Chi explained that it was a Korean birthday tradition. He told
                    me to pick up the frog; so I picked up the frog. He said to kiss the frog; so I kissed the frog.
                    He told me to open the frog, and my jaw dropped. Inside the frog's mouth was my ring! When I
                    looked at Chi, he was down on one knee, and he was asking me to marry him all over again in
                    in front of my family and friends.
                </p>
                
                <div style="display: block; margin-left: auto; margin-right: auto">
                    <img alt="Just Engaged!" title="Just Engaged!" src="../App_Themes/Wedding/Images/just_engaged.png" />
                </div>
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
