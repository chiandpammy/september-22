<%@ Page Title="Our Wedding" Language="C#" MasterPageFile="~/Master/Site_2Col.master"
    AutoEventWireup="true" CodeBehind="OurWedding.aspx.cs" Inherits="September22.OurWedding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumnContent" runat="server">
    <div id="wrapper">
        <div id="steps">
            <div class="step">
                <h2><span>Location</span></h2>
                <p>
                </p>
            </div>
            <div class="step">
                <h2><span>Day of Info</span></h2>
                <p>
                </p>
            </div>
            <div class="step">
                <h2><span>Directions</span></h2>
                <h3>From O'Hare Airport</h3>
                <ol>
                    <li>Follow Airport exit signs toward I-190 E / I-90 E.</li>
                    <li>Take the exit onto I-90 East. Stay on I-90 E for 17.5 miles.</li>
                    <li>Take exit 51C toward Washington Blvd.  Stay on Washington Blvd for 1.0 Miles.</li>
                    <li>Turn right onto State St.  Stay on State St for 0.2 Miles.</li>
                    <li>Turn left onto Monroe St.  Destination will be on the right in 0.1 Miles.</li>
                </ol>
                <h3>From Midway Airport</h3>
                <ol>
                    <li>Follow Airport exit signs toward North Cicero.</li>
                    <li>Turn right onto N Cicero Ave. Stay on Cicero Ave for 2.0 Miles.</li>
                    <li>Merge onto I-55 N/Stevenson Expy.  Stay on I-55 N for 4.8 Miles.</li>
                    <li>Take exit 292A to merge onto I-90 W/I-94 W toward W Ryan Expy/Wisconsin.  Stay on I-90 W for 3.2 Miles.</li>
                    <li>Take exit 51C toward Washington Blvd.  Stay on Washington Blvd for 1.0 Miles.</li>
                    <li>Turn right onto State St.  Stay on State St for 0.2 Miles.</li>
                    <li>Turn left onto Monroe St.  Destination will be on the right in 0.1 Miles.</li>
                </ol>
                <p>
                    * Your GPS may tell you to exit on Monroe St instead of Washington Blvd from I-90.
                    There is construction along Wacker St and you will not be able to take Monroe St all the way to the University Club.
                    
                </p>
            </div>
            <div class="step">
                <h2><span>Parking</span></h2>
                <h3>University Club of Chicago</h3>
                <p>
                    <b>Valet Parking</b><br />
                    $20.00 Per Vehicle - For duration of event
                </p>
                <br />
                <h3>Millennium Garages Self-Parking (312) 616-0600</h3>
                <p>
                    <b>East Monroe Garage</b><br />
                    Entrance is on Columbus Street, just east of Michigan Avenue and just south of East Randolph Street.<br /><br />
                    <b>Grant Park North Garage</b><br />
                    Entrance is on North Michigan Avenue between Monroe Street (from the south, heading north) and Washington Street (from the north, heading south)<br /><br />
                    <b>Grandt Park South Garage</b><br />
                    Entrance is on North Michigan Avennue between Congress Parkway (from the south, heading north), and Adams Street (from the north heading south).
                </p>
            </div>
            <div class="step">
                <h2><span>Places to Stay</span></h2>
                <p>
                    We will soon have a block of rooms reserved at a hotel in the downtown area. And if you ask very nicely we may give you that information.
                </p>
            </div>
            <div class="step">
                <h2><span>Things to Do</span></h2>
                <p>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightColumnContent" runat="server">
    <div id="navigation">
        <h3><span>Wedding Details</span></h3>
        <ul>
            <li><asp:HyperLink ID="HyperLink1" runat="server" Text="Location" NavigateUrl="#"></asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink2" runat="server" Text="Day of Info" NavigateUrl="#"></asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink3" runat="server" Text="Directions" NavigateUrl="#"></asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink4" runat="server" Text="Parking" NavigateUrl="#"></asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink5" runat="server" Text="Places to Stay" NavigateUrl="#"></asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink6" runat="server" Text="Things to Do" NavigateUrl="#"></asp:HyperLink></li>
        </ul>
    </div>
</asp:Content>
