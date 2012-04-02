<%@ Page Title="Map of Events" Language="C#" MasterPageFile="~/Master/Site_2Col.master" AutoEventWireup="true"
    CodeBehind="Map.aspx.cs" Inherits="September22.Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var map;
        var uni_club;
        function initialize() {
            //location
            uni_club = new google.maps.LatLng(41.880969, -87.624979)

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
                    title: 'Ceremony at University Club of Chicago'
                }
            );
            

            var infowindow = new google.maps.InfoWindow(
                {
                    content: "<a href=\"http://www.ucco.com\" target=\"_blank\"><b>University Club of Chicago</b><a>"
                        + "<br />76 East Monroe Street<br/>Chicago, IL 60603"
                        + "<br />"
                        + "<br /><a href=\"http://maps.google.com/maps?saddr=&daddr=76%20East%20Monroe%20Street%20Chicago,%20IL%2060603\" target=\"_blank\">Directions To Here<a>"
                        + "&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"http://maps.google.com/maps?saddr=76%20East%20Monroe%20Street%20Chicago,%20IL%2060603&daddr=\" target=\"_blank\">Directions From Here<a>"
                }
            );

            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        }

        function focus_uni_club() {
            map.panTo(uni_club);
        }

        window.onload = initialize;
    </script>
</asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="LeftColumnContent">
    <h2><span>Map</span></h2>
    <br />
    <div id="map_canvas" style="height:400px; width:470px;"></div>
    <br />
</asp:Content>
<asp:Content runat="Server" ID="Content3" ContentPlaceHolderID="RightColumnContent">
    <div id="navigation">
        <h3><span>Points of Interest</span></h3>
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton1" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_uni_club()" >Ceremony</asp:LinkButton>
            </li>
                        <li>
                <asp:LinkButton ID="LinkButton2" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_uni_club()" >Reception</asp:LinkButton>
            </li>
        </ul>
    </div>
</asp:Content>