import 'jquery'

$('.back-login').on('click', function() {
    
    $('.login-form-container').animate({width:'toggle'},350);
    
})

$('.login').on('click', function() {
    $('.login-form-container').animate({width:'toggle', },350).css('display','flex');
})






;
