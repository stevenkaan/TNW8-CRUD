$(function() {
  $(document).on("click", ".arrow", function() {
    $("html, body").animate({ scrollTop: $(document).height() }, "slow");
    return false;
 });
});
