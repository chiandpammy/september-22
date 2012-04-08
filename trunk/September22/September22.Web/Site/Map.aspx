<%@ Page Title="Map of Events" Language="C#" MasterPageFile="~/Master/Site_2Col.master"
    AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="September22.Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var map;
        var mapCenterLocation;
        var locationKeys;
        var mapMarkers;
        var infoWindows;

        function initialize() {
            //locations
            mapCenterLocation = new google.maps.LatLng(41.880969, -87.624979); // University Club

            var options =
            {
                zoom: 15,
                center: mapCenterLocation,
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

            locationKeys = ["uni_club", "sears_tower", "navy_pier", "buckingham_fountain", "da_bean", "margies_candies", "ohare_airport", "midway_airport"];
            mapMarkers = {};
            infoWindows = {};

            // University Club
            mapMarkers["uni_club"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.880969, -87.624979),
                map: map,
                title: 'University Club of Chicago'
            });
            infoWindows["uni_club"] = createInfoWindow("http://www.ucco.com", "University Club of Chicago", "76 East Monroe Street", "Chicago, IL 60603"); ;

            // Sears Tower
            mapMarkers["sears_tower"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.878828, -87.635901),
                map: map,
                title: 'Sears Tower'
            });
            infoWindows["sears_tower"] = createInfoWindow("http://www.theskydeck.com/the-tower/past-a-future", "Sears Tower", "233 South Wacker Drive", "Chicago, IL 60606");

            // Navy Pier
            mapMarkers["navy_pier"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.891576, -87.609551),
                map: map,
                title: 'Navy Pier'
            });
            infoWindows["navy_pier"] = createInfoWindow("http://www.navypier.com", "Navy Pier", "600 East Grand Avenue", "Chicago, IL 60611");

            // Buckingham Fountain
            mapMarkers["buckingham_fountain"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.875792, -87.618944),
                map: map,
                title: 'Buckingham Fountain'
            });
            infoWindows["buckingham_fountain"] = createInfoWindow("http://www.explorechicago.org/city/en/things_see_do/attractions/park_district/clarence_buckingham.html", "Buckingham Fountain", "500 South Columbus Drive", "Chicago, IL 60605");

            // Da Bean
            mapMarkers["da_bean"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.882686, -87.622962),
                map: map,
                title: 'Da Bean'
            });
            infoWindows["da_bean"] = createInfoWindow("http://www.explorechicago.org/city/en/things_see_do/attractions/dca_tourism/MP_orinigal.html", "Cloud Gate", "201 East Randolph Street", "Chicago, IL 60602");

            // Margie's Candies
            mapMarkers["margies_candies"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.917483, -87.687566),
                map: map,
                title: 'Margie\'s Candies'
            });
            infoWindows["margies_candies"] = createInfoWindow("http://chicagoist.com/2004/06/16/a_closer_look_at_margies_candies.php", "Margie's Candies", "1960 North Western Avenue", "Chicago, IL 60647");

            // O'Hare Airport
            mapMarkers["ohare_airport"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.97889, -87.902727),
                map: map,
                title: 'O\'Hare Airport'
            });
            infoWindows["ohare_airport"] = createInfoWindow("http://www.ohare.com/About/OHare/Default.aspx", "Chicago O'Hare International Airport", "Bessie Coleman Drive", "Chicago, IL 60666");

            // Midway Airport
            mapMarkers["midway_airport"] = new google.maps.Marker({
                position: new google.maps.LatLng(41.788017, -87.742438),
                map: map,
                title: 'Midway Airport'
            });
            infoWindows["midway_airport"] = createInfoWindow("http://www.ohare.com/About/Midway/Default.aspx", "Chicago Midway International Airport", "5600 South Cicero Avenue", "Chicago, IL 60638");

            // Set up the click event listeners
            for (var i = 0; i < locationKeys.length; i++) {
                updateMarker(locationKeys[i]);
            }
        }

        function updateMarker(markerName) {
            google.maps.event.addListener(mapMarkers[markerName], 'click', function () {
                return openInfoWindow(markerName);
             }); 
        }

        function createInfoWindow(link, name, addressLine1, addressLine2) {
            return new google.maps.InfoWindow(
                {
                    content: "<a href=\"" + link + "\" target=\"_blank\"><b>" + name + "</b><a>"
                        + "<br />" + addressLine1 + "<br/>" + addressLine2 + "<br />"
                        + "<br /><a href=\"" + replaceUrlSpaces("http://maps.google.com/maps?saddr=&daddr=" + addressLine1 + " " + addressLine2) + "\" target=\"_blank\">Directions To Here<a>"
                        + "&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"" + replaceUrlSpaces("http://maps.google.com/maps?saddr=" + addressLine1 + " " + addressLine2 + "&daddr=") + "\" target=\"_blank\">Directions From Here<a>"
                }
            );
        }

        function focus_marker(markerName) {
            map.panTo(mapMarkers[markerName].getPosition());
        }

        function openInfoWindow(markerName) {
            infoWindows[markerName].open(map, mapMarkers[markerName]);
        }

        function replaceUrlSpaces(url) {
            return url.replace(/\s/g, "%20");
        }

        function focusAndOpen(markerName) {
            focus_marker(markerName);
            openInfoWindow(markerName);
        }

        window.onload = initialize;
    </script>
</asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="LeftColumnContent">
    <h2>
        <span>Map</span></h2>
    <br />
    <div id="map_canvas" style="height: 470px; width: 470px;">
    </div>
    <br />
</asp:Content>
<asp:Content runat="Server" ID="Content3" ContentPlaceHolderID="RightColumnContent">
    <div id="navigation">
        <h3>
            <span>Wedding</span></h3>
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton1" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('uni_club')">Ceremony and Reception</asp:LinkButton>
            </li>
        </ul>
        <h3>
            <span>Points of Interest</span></h3>
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton2" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('sears_tower')">Sears Tower</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton3" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('navy_pier')">Navy Pier</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton4" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('buckingham_fountain')">Buckingham Fountain</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton5" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('da_bean')">Da Bean</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton8" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('margies_candies')">Margie's Candies</asp:LinkButton>
            </li>
        </ul>
        <h3>
            <span>Airports</span></h3>
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton6" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('ohare_airport')">O'Hare Airport</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton7" runat="server" UseSubmitBehavior="false" OnClientClick="return focusAndOpen('midway_airport')">Midway Airport</asp:LinkButton>
            </li>
        </ul>
    </div>
</asp:Content>
