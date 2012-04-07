<%@ Page Title="Map of Events" Language="C#" MasterPageFile="~/Master/Site_2Col.master"
    AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="September22.Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var map;
        var uni_club;
        var sears_tower;
        var navy_pier;
        var buckingham_fountain;
        var da_bean;
        var margies_candies;
        var ohare_airport;
        var midway_airport;

        function initialize() {
            //locations
            uni_club = new google.maps.LatLng(41.880969, -87.624979);
            sears_tower = new google.maps.LatLng(41.878828, -87.635901);
            navy_pier = new google.maps.LatLng(41.891576, -87.609551);
            buckingham_fountain = new google.maps.LatLng(41.875792, -87.618944);
            da_bean = new google.maps.LatLng(41.882686, -87.622962);
            margies_candies = new google.maps.LatLng(41.917483, -87.687566);
            ohare_airport = new google.maps.LatLng(41.97889, -87.902727);
            midway_airport = new google.maps.LatLng(41.788017, -87.742438);

            var options =
            {
                zoom: 15,
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

            var uni_club_marker = new google.maps.Marker({
                position: uni_club,
                map: map,
                title: 'University Club of Chicago'
            });
            var sears_tower_marker = new google.maps.Marker({
                position: sears_tower,
                map: map,
                title: 'Sears Tower'
            });
            var navy_pier_marker = new google.maps.Marker({
                position: navy_pier,
                map: map,
                title: 'Navy Pier'
            });
            var buckingham_fountain_marker = new google.maps.Marker({
                position: buckingham_fountain,
                map: map,
                title: 'Buckingham Fountain'
            });
            var da_bean_marker = new google.maps.Marker({
                position: da_bean,
                map: map,
                title: 'Da Bean'
            });
            var margies_candies_marker = new google.maps.Marker({
                position: margies_candies,
                map: map,
                title: 'Margie\'s Candies'
            });
            var ohare_airport_marker = new google.maps.Marker({
                position: ohare_airport,
                map: map,
                title: 'O\'Hare Airport'
            });
            var midway_airport_marker = new google.maps.Marker({
                position: midway_airport,
                map: map,
                title: 'Midway Airport'
            });

            var uni_club_window = createInfoWindow("http://www.ucco.com", "University Club of Chicago", "76 East Monroe Street", "Chicago, IL 60603");
            var sears_tower_window = createInfoWindow("http://www.theskydeck.com/the-tower/past-a-future", "Sears Tower", "233 South Wacker Drive", "Chicago, IL 60606");
            var navy_pier_window = createInfoWindow("http://www.navypier.com", "Navy Pier", "600 East Grand Avenue", "Chicago, IL 60611");
            var buckingham_fountain_window = createInfoWindow("http://en.wikipedia.org/wiki/Buckingham_Fountainhttp://www.explorechicago.org/city/en/things_see_do/attractions/park_district/clarence_buckingham.html", "Buckingham Fountain", "500 South Columbus Drive", "Chicago, IL 60605");
            var da_bean_window = createInfoWindow("http://www.explorechicago.org/city/en/things_see_do/attractions/dca_tourism/MP_orinigal.html", "Cloud Gate", "201 East Randolph Street", "Chicago, IL 60602");
            var margies_candies_window = createInfoWindow("http://chicagoist.com/2004/06/16/a_closer_look_at_margies_candies.php", "Margie's Candies", "1960 North Western Avenue", "Chicago, IL 60647");
            var ohare_airport_window = createInfoWindow("http://www.ohare.com/About/OHare/Default.aspx", "Chicago O'Hare International Airport", "Bessie Coleman Drive", "Chicago, IL 60666");
            var midway_airport_window = createInfoWindow("http://www.ohare.com/About/Midway/Default.aspx", "Chicago Midway International Airport", "5600 South Cicero Avenue", "Chicago, IL 60638");

            google.maps.event.addListener(uni_club_marker, 'click', function () {
                openInfoWindow("http://www.ucco.com", "University Club of Chicago", "76 East Monroe Street", "Chicago, IL 60603", uni_club_marker);
            });
            
            google.maps.event.addListener(sears_tower_marker, 'click', function () {
                sears_tower_window.open(map, sears_tower_marker);
            });
            google.maps.event.addListener(navy_pier_marker, 'click', function () {
                navy_pier_window.open(map, navy_pier_marker);
            });
            google.maps.event.addListener(buckingham_fountain_marker, 'click', function () {
                buckingham_fountain_window.open(map, buckingham_fountain_marker);
            });
            google.maps.event.addListener(da_bean_marker, 'click', function () {
                da_bean_window.open(map, da_bean_marker);
            });
            google.maps.event.addListener(margies_candies_marker, 'click', function () {
                margies_candies_window.open(map, margies_candies_marker);
            });
            google.maps.event.addListener(ohare_airport_marker, 'click', function () {
                ohare_airport_window.open(map, ohare_airport_marker);
            });
            google.maps.event.addListener(midway_airport_marker, 'click', function () {
                midway_airport_window.open(map, midway_airport_marker);
            });
        }

        function focus_marker(markerName) {
            switch (markerName) {
                case "uni_club":
                    map.panTo(uni_club);
                    break;
                case "sears_tower":
                    map.panTo(sears_tower);
                    break;
                case "navy_pier":
                    map.panTo(navy_pier);
                    break;
                case "buckingham_fountain":
                    map.panTo(buckingham_fountain);
                    break;
                case "da_bean":
                    map.panTo(da_bean);
                    break;
                case "margies_candies":
                    map.panTo(margies_candies);
                    break;
                case "ohare_airport":
                    map.panTo(ohare_airport);
                    break;
                case "midway_airport":
                    map.panTo(midway_airport);
                    break;
            }
        }

        function createInfoWindow(link, name, addressLine1, addressLine2) {
            return new google.maps.InfoWindow(
                {
                    content: "<a href=\"" + link + "\" target=\"_blank\"><b>" + name + "</b><a>"
                        + "<br />" + addressLine1 + "<br/>" + addressLine2 + ""
                        + "<br />"
                        + "<br /><a href=\"" + replaceUrlSpaces("http://maps.google.com/maps?saddr=&daddr=" + addressLine1 + " " + addressLine2) + "\" target=\"_blank\">Directions To Here<a>"
                        + "&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"" + replaceUrlSpaces("http://maps.google.com/maps?saddr=" + addressLine1 + " " + addressLine2 + "&daddr=") + "\" target=\"_blank\">Directions From Here<a>"
                }
            );
        }

        function openInfoWindow(link, name, addressLine1, addressLine2, marker) {
            var infoWindow = createInfoWindow(link, name, addressLine1, addressLine2);
            infoWindow.open(map, marker);
        }

        function replaceUrlSpaces(url) {
            return url.replace(/\s/g, "%20");
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
        <h3><span>Wedding</span></h3>
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton1" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('uni_club')">Ceremony and Reception</asp:LinkButton>
            </li>
        </ul>
        <h3><span>Points of Interest</span></h3>
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton2" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('sears_tower')">Sears Tower</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton3" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('navy_pier')">Navy Pier</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton4" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('buckingham_fountain')">Buckingham Fountain</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton5" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('da_bean')">Da Bean</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton8" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('margies_candies')">Margie's Candies</asp:LinkButton>
            </li>
        </ul>
        <h3><span>Airports</span></h3>
        <ul>
            <li>
                <asp:LinkButton ID="LinkButton6" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('ohare_airport')">O'Hare Airport</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton7" runat="server" UseSubmitBehavior="false" OnClientClick="return focus_marker('midway_airport')">Midway Airport</asp:LinkButton>
            </li>
        </ul>
    </div>
</asp:Content>
