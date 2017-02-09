$(document).ready(function() {
  bindEventHandlers();
});

var bindEventHandlers = function() {
  $('.show-details').on('click', function(event){
    event.preventDefault();
    $(event.target).closest('tr').find('.attribute-details').toggle();
  })

}
