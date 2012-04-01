<%@ Page Title="Map of Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Map.aspx.cs" Inherits="Setpember22.Map" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false">
    </script>
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
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="map_canvas" style="width: 600px; height: 400px">
    </div>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button1" OnClientClick="return recenter()" UseSubmitBehavior="false" />
    <asp:Button ID="Button2" runat="server" Text="Button2" OnClientClick="return recenter()" UseSubmitBehavior="false" />
</asp:Content>
