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
    var lampPage = url.substring(url.indexOf("Site/") + 5);

    switch (lampPage) {
        case "Home.aspx":
            $("#liHome").addClass('current');
            break;
        case "OurStory.aspx":
            $("#liOurStory").addClass('current');
            break;
        case "OurPhotos.aspx":
            $("#liOurPhotos").addClass('current');
            break;
        case "CeremonyAndReception.aspx":
            $("#liCeremonyAndReception").addClass('current');
            break;
        case "WeddingParty.aspx":
            $("#liWeddingParty").addClass('current');
            break;
        case "Map.aspx":
            $("#liMap").addClass('current');
            break;
        case "Rsvp.aspx":
            $("#liRsvp").addClass('current');
            break;
        default:
            $("#liHome").addClass('current');
            break;
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

$(document).ready(function () {
    $('#parallax_bg').plaxify({ "xRange": 0, "yRange": 20, "invert": true })
    $('#parallax_error_text').plaxify({ "xRange": 20, "yRange": 10 })
    $('#parallax_octocat').plaxify({ "xRange": 10, "yRange": 10 })
    $('#parallax_octocatshadow').plaxify({ "xRange": 10, "yRange": 10 })
    $('#parallax_speeder').plaxify({ "xRange": 30, "yRange": 30 })
    $('#parallax_speedershadow').plaxify({ "xRange": 30, "yRange": 30 })
    $('#parallax_building_1').plaxify({ "xRange": 60, "yRange": 30, "invert": true })
    $('#parallax_building_2').plaxify({ "xRange": 80, "yRange": 40, "invert": true })

    $.plax.enable({ "activityTarget": $('#parallax_shell') })
})