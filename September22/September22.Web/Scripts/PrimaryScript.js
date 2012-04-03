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
    $('#lavalamp li').each(function () {
        $(this).removeClass('current');
    });

    var url = window.location.href;
    if (url.indexOf("/Home/") > 0) {
        $("#liHome").addClass('current');
    }
    else if (url.indexOf("/Story/") > 0) {
        $("#liOurStory").addClass('current');
    }
    else if (url.indexOf("/Photo/") > 0) {
        $("#liOurPhotos").addClass('current');
    }
    else if (url.indexOf("/Party/") > 0) {
        $("#liWeddingParty").addClass('current');
    }
    else if (url.indexOf("/Map/") > 0) {
        $("#liMap").addClass('current');
    }
    else if (url.indexOf("/RSVP/") > 0) {
        $("#liRsvp").addClass('current');
    }
    else {
        $("#liHome").addClass('current');
    }

//    var lampPage = url.substring(url.indexOf("/Site") + 5);
//    switch (lampPage) {
//        case "Home.aspx":
//            $("#liHome").addClass('current');
//            break;
//        case "OurStory.aspx":
//            $("#liOurStory").addClass('current');
//            break;
//        case "OurPhotos.aspx":
//            $("#liOurPhotos").addClass('current');
//            break;
//        case "CeremonyAndReception.aspx":
//            $("#liCeremonyAndReception").addClass('current');
//            break;
//        case "WeddingParty.aspx":
//            $("#liWeddingParty").addClass('current');
//            break;
//        case "Map.aspx":
//            $("#liMap").addClass('current');
//            break;
//        case "Rsvp.aspx":
//            $("#liRsvp").addClass('current');
//            break;
//        default:
//            $("#liHome").addClass('current');
//            break;
//    }
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

$(document).ready(function () {
    $('#parallax_bg').plaxify({ "xRange": 0, "yRange": 20, "invert": true })
    $('#parallax_error_text').plaxify({ "xRange": 20, "yRange": 10 })
    $('#parallax_octocat').plaxify({ "xRange": 10, "yRange": 10 })
    $('#parallax_octocatshadow').plaxify({ "xRange": 10, "yRange": 20 })
    $('#parallax_speeder').plaxify({ "xRange": 20, "yRange": 20 })
    $('#parallax_speedershadow').plaxify({ "xRange": 20, "yRange": 20 })
    $('#parallax_building_1').plaxify({ "xRange": 30, "yRange": 10, "invert": true })
    $('#parallax_building_2').plaxify({ "xRange": 40, "yRange": 20, "invert": true })

    $.plax.enable({ "activityTarget": $('#parallax_shell') })
})