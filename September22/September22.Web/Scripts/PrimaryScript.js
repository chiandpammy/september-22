function initMenu() {
    if ($(".toggle_list") != null) {
        $(".toggle_list").hide();

        $('.accordion').click(
        function () {
            $(this).next('.toggle_list').slideToggle("Slow");
        });
    }

    setCurrentLavaLamp();
};

function setCurrentLavaLamp() {
    var qrStr = window.location.search;
    var spQrStr = qrStr.substring(1);
    var arrQrStr = new Array();
    var arr = spQrStr.split('&');

    for (var i = 0; i < arr.length; i++) {
        var queryvalue = arr[i].split('=');
        var secId = queryvalue[1];
        //alert("Name: " + queryvalue[0] + " Value: " + queryvalue[1]);
        $
    }
};

$(document).ready(initMenu);

$(function () {
    $("#lavalamp").lavaLamp({
        fx: "backout",
        speed: 600,
        click: function (event, menuItem) {
            return true;
        }
    });
});