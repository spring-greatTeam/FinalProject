$(function () {
  const x = $(".slide>div");
  const slideleft = -1200;
  const slideContainer = x;

  setInterval(function () {
    const firstImage = slideContainer.find("img:first");
    slideContainer.css("left", slideleft);
    slideContainer.append(firstImage);
  }, 3000);
});
