$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  // my first successful api call
  // $.getJSON('http://swapi.co/api/planets/1/', function(planet){$('.test').text(planet["name"])});
  bindEventHandlers();
});

var bindEventHandlers = function() {
  $('.show-details').on('click', function(event){
    event.preventDefault();
    $(event.target).closest('tr').find('.attribute-details').toggle();
  })
}
