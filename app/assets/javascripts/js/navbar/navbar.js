$(document).ready(function(){
  $('.navbar-normal').click(function () {
    console.log('good');
  });
  var oldClassName = navbar.className;
  $(window).scroll(function (event) {
    var banner = document.getElementById('banner');
    var navbar = document.getElementById('navbar')
    var bannerHeight = banner.offsetHeight;
    var scrollHeight = window.scrollY;
    // 定义透明度
    if (scrollHeight + 400 >= bannerHeight && scrollHeight < bannerHeight) {
      navbar.className = oldClassName;
      navbar.style.opacity = (bannerHeight - scrollHeight) / 400;
    } else if (scrollHeight > bannerHeight) {
      navbar.style.opacity = 1;
      navbar.className = oldClassName + " navbar-display";
    } else {
      navbar.style.opacity = 1;
      navbar.className = oldClassName;
    }
});
});
