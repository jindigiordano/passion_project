$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  // playing around with getting multiple pages
  // var all_planets = [];
  // var i = 1;
  // console.log($.getJSON('http://swapi.co/api/planets/?page=' + i.toString(), function(planets){return planets["results"]}));
  // i++;
  // console.log($.getJSON('http://swapi.co/api/planets/?page=' + i.toString(), function(planets){return planets["results"]}));

  bindEventHandlers();
});

var bindEventHandlers = function() {
  $('.show-details').on('click', function(event){
    event.preventDefault();
    $(event.target).closest('tr').find('.attribute-details').toggle();
  })

}
