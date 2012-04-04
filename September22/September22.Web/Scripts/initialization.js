function initializeMenu() {
    if ($(".toggle_list") != null) {
        $(".toggle_list").hide();

        $('.accordion').click(
        function () {
            $(this).next('.toggle_list').slideToggle("Slow");
        });
    }
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
};

function initializeParallax() {
    $('#parallax_bg').plaxify({ "xRange": 0, "yRange": 20, "invert": true })
    $('#parallax_error_text').plaxify({ "xRange": 20, "yRange": 10 })
    $('#parallax_octocat').plaxify({ "xRange": 10, "yRange": 10 })
    $('#parallax_octocatshadow').plaxify({ "xRange": 10, "yRange": 20 })
    $('#parallax_speeder').plaxify({ "xRange": 20, "yRange": 20 })
    $('#parallax_speedershadow').plaxify({ "xRange": 20, "yRange": 20 })
    $('#parallax_building_1').plaxify({ "xRange": 30, "yRange": 10, "invert": true })
    $('#parallax_building_2').plaxify({ "xRange": 40, "yRange": 20, "invert": true })

    $.plax.enable({ "activityTarget": $('#parallax_shell') })
};

function initializeAdGallery() {
    /*$('img.image1').data('ad-desc', 'Whoa! This description is set through elm.data("ad-desc") instead of using the longdesc attribute.<br>And it contains <strong>H</strong>ow <strong>T</strong>o <strong>M</strong>eet <strong>L</strong>adies... <em>What?</em> That aint what HTML stands for? Man...');
    $('img.image1').data('ad-title', 'Title through $.data');
    $('img.image4').data('ad-desc', 'This image is wider than the wrapper, so it has been scaled down');
    $('img.image5').data('ad-desc', 'This image is higher than the wrapper, so it has been scaled down');*/
    var galleries = $('.ad-gallery').adGallery(/*{ display_next_and_prev: true }*/);
    $('#switch-effect').change(
      function() {
        galleries[0].settings.effect = $(this).val();
        return false;
      }
    );
    $('#toggle-slideshow').click(
      function() {
        galleries[0].slideshow.toggle();
        return false;
      }
    );
    $('#toggle-description').click(
      function() {
        if(!galleries[0].settings.description_wrapper) {
          galleries[0].settings.description_wrapper = $('#descriptions');
        } else {
          galleries[0].settings.description_wrapper = false;
        }
        return false;
      }
    );
};

$(document).ready(function () {
    initializeMenu();
    setCurrentLavaLamp();
    initializeParallax();
    initializeAdGallery();
});

$(function () {
    $("#lavalamp").lavaLamp({
        fx: "easeOutBack",
        speed: 600,
        click: function (event, menuItem) {
            return true;
        }
    });
});