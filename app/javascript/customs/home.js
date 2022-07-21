
$(".back-login").on("click", function () {
  $(".login-form-container").animate({ width: "toggle" }, 350);
});

$(".login").on("click", function () {
  $(".login-form-container")
    .animate({ width: "toggle" }, 350)
    .css("display", "flex");
});


var homeLoginData = {
  user: {
    email: '',
    password: '',
  },
  commit: 'Log in'
}


$('.login-home-input').on('change', function (e) {

  const { value } = e.target
  const { name } = e.target
  homeLoginData.user[name] = value

})

$('.login-home-input').on('focus', function (e) {

  $('#login-error').css('display','none')

})


$('#loginHome').on('click', async function (e) {

  e.preventDefault()
  let token = document.getElementsByName('authenticity_token')
  token = token[0].value
  homeLoginData['authenticity_token'] = token
  $.ajax({
    type: 'POST',
    url: '/users/sign_in',
    data: homeLoginData,
    dataType: 'json',
    ContentType: 'application/json'
  }, function() {
    alert( "success" );
  })
    .done(function() {
      alert( "second success" );
    })
    .fail(function(err) {
      const status = err.status
      if(status == 200) {
        window.location.href = '/categories'
      } else {
        $('#login-error').css('display','block')
      }
    })
  })




  // try {

  //    $.ajax({
  //     type: 'POST',
  //     url: '/users/sign_in',
  //     data: homeLoginData,
  //     dataType: 'json',
  //     ContentType: 'application/json'
  //   })

  //   if(res) {
  //     console.log(res)
  //   }

  // } catch (err) {

  //   console.log(err)

  // }







