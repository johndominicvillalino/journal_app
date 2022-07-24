


$('#editTaskBtn').removeClass('bg-blue-500 text-white cursor-pointer')
$('#editTaskBtn').addClass('text-gray-200')
$('#editTaskBtn').attr('disabled','disabled')

$('input').on('change',function(){

 $('#editTaskBtn').addClass('bg-blue-500 text-white cursor-pointer')
$('#editTaskBtn').removeClass('text-gray-200')
$('#editTaskBtn').removeAttr('disabled')

})





// text-white