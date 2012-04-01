<%@ Page Title="Map of Events" Language="C#" MasterPageFile="~/Master/Site_2Col.master" AutoEventWireup="true"
    CodeBehind="Map.aspx.cs" Inherits="September22.Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var map;
        var uni_club;
        function initialize() {
            //club location
            uni_club = new google.maps.LatLng(41.880, -87.625)

            var options =
            {
                zoom: 16,
                center: uni_club,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                mapTypeControl: true,
                mapTypeControlOptions:
                {
                    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                    poistion: google.maps.ControlPosition.TOP_RIGHT,
                    mapTypeIds: google.maps.MapTypeId.ROADMAP
                },
                navigationControl: true,
                navigationControlOptions:
                {
                    style: google.maps.NavigationControlStyle.ZOOM_PAN
                },
                scaleControl: true,
                disableDoubleClickZoom: false,
                draggable: true,
                streetViewControl: true,
                draggableCursor: 'move'
            };
            map = new google.maps.Map(document.getElementById("map_canvas"), options);

            var marker = new google.maps.Marker(
                {
                    position: uni_club,
                    map: map,
                    title: 'Click me'
                }
            );

            var infowindow = new google.maps.InfoWindow(
                {
                    content: "University Club of Chicago<br />76 East Monroe Street<br/>Chicago, IL 60603<br />"
                }
            );

            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        }

        function recenter() {
            map.panTo(uni_club);
        }

        window.onload = initialize;
    </script>
</asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="LeftColumnContent">
    <h2><span>Map</span></h2>
    <br />
    <div id="map_canvas" style="width: 470px; height: 400px">
    </div>
    <br />
    <br />
    <asp:Button ID="Button3" runat="server" Text="Button1" OnClientClick="return recenter()" UseSubmitBehavior="false" />
</asp:Content>
<asp:Content runat="Server" ID="Content3" ContentPlaceHolderID="RightColumnContent">
    <div id="navigation">
        <h3><span>Points of Interest</span></h3>
        <ul>
            <li><asp:HyperLink ID="HyperLink1" runat="server" Text="Ceremony"></asp:HyperLink></li>
        </ul>
    </div>
</asp:Content>