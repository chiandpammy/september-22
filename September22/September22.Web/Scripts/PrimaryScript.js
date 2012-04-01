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
        case "OurStory.aspx":
            $("#liOurStory").addClass('current');
            break;
        case "OurProposal.aspx":
            $("#liOurProposal").addClass('current');
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
            $("#liOurStory").addClass('current');
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