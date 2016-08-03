var Bike = require('../js/bike-model.js').bikeModule;


$(document).ready(function() {
  var bike = new Bike();
  $('#bike-search').submit(function(event){
    event.preventDefault();
    bike.beginningDate = $('#start_date').val();
    bike.endingDate = $('#end_date').val();
    bike.pageNumber = 1;
    bike.perPage = 5;
    if($('#color').val() != "unknown"){
      bike.color = $('#color').val();
    }
    bike.manufacturer = $('#manufacturer').val();
    bike.findStolenBikes();
  });

});
