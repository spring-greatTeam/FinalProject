$(document).ready(function () {
        $(".question h3").click(function () {
          var answer = $(this).siblings(".answer");
          if (answer.css("max-height") === "0px") {
            answer.css("max-height", answer[0].scrollHeight + "px");
          } else {
            answer.css("max-height", "0px");
          }
        });
      });