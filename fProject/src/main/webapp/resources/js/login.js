
$("#resetbtn").click(function () {
  document.getElementById("id").value = "";
  $("#resetbtn").css("display", "none");
});


$("#id").on("input", function () {
  const value = $(this).val();
  const button = $("#resetbtn");

  if (value.length >= 1) {
    button.css("display", "block");
  } else {
    button.css("display", "none");
  }
});

$(".login")
  .on("focus", function () {
    $(this).addClass("focusLine");
  })
  .on("blur", function () {
    $(this).removeClass("focusLine");
  });
