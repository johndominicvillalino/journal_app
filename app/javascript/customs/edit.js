

var urlArr = window.location.href.split('/')
urlArr = urlArr.map(e => Number(e))
urlArr = urlArr.find(e => e > 0);

$(`#${urlArr}`).attr('disabled')
$(`#${urlArr}`).trigger('focus')

$(`#edit${urlArr}`).css('visibility','hidden')

$(`#edit${urlArr}`).on('click',function(e){
    e.preventDefault()
})

$(`#${urlArr}`).on('click',function(e){
    e.preventDefault()
})


// let token = document.getElementsByName('authenticity_token')
// token = token[0].value



$($(`#${urlArr}`)).on('change', function (el) {
    
    
    let val = el.target.value

     $('#categoryNameHidden').val(val)
     $('#submitCatUpdate').trigger('click')

      
})



// $($(`#${urlArr}`)).on('focusout', function (e) {

//     e.preventDefault()
//     let token = document.getElementsByName('authenticity_token')
//     token = token[0].value
//     homeLoginData['authenticity_token'] = token
//     $.ajax({
//       type: 'POST',
//       url: '/users/sign_in',
//       data: homeLoginData,
//       dataType: 'json',
//       ContentType: 'application/json'
//     }, function() {
//       alert( "success" );
//     })
//       .done(function() {
//         alert( "second success" );
//       })
//       .fail(function(err) {
//         const status = err.status
//         if(status == 200) {
//           window.location.href = '/categories'
//         } else {
//           $('#login-error').css('display','block')
//         }
//       })
//     })
  