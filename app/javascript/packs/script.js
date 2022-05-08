$(document).on('turbolinks:load', function() {
    console.log('script.js');
    $('.top-title').hide();
    $('.top-text').hide();
    $('.top-btn').hide();
    $('.img-wrap img:nth-child(n+2)').hide();
    $(".img-wrap img:nth-child(2)").fadeIn(4000);
    $('.top-title').fadeIn(5000);
    $('.top-text').fadeIn(7000);
    $('.top-btn').fadeIn(9000);
});
