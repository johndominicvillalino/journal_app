

$('#newCatName').on('change',function(el){
    var val = el.target.value
    $('#newCatNameHidden').val(val)

})

$('#newCatSubmit').on('click',function(){
    $('#submitCatHidden').trigger('click')
})