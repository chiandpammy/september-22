function initMenu() {
    if ($(".toggle_list") != null) {
        $(".toggle_list").hide();

        $('.accordion').click(
        function () {
            $(this).next('.toggle_list').slideToggle("Slow");
        });
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