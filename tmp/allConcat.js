var Bike = require('../js/bike-model.js').bikeModule;

$(document).ready(function() {
  var bike = new Bike();
  $('#bike-search').submit(function(event){
    $('.output').empty();
    event.preventDefault();
    if(typeof $('#start_date').val() != "undefined"){
      bike.beginningDate = Date.parse($('#start_date').val())/1000;
    }
    if(typeof $('#end_date').val() != "undefined"){
      bike.endingDate = Date.parse($('#end_date').val())/1000;
    }
    if(typeof $('#manufacturer').val() != "undefined"){
      bike.manufacturer = $('#manufacturer').val();
    }
    bike.pageNumber = 1;
    bike.perPage = 5;
    if($('#color').val() != "unknown"){
      bike.color = $('#color').val();
    }

    bike.findStolenBikes();
  });

  $('.page-btn').click(function(){
    $('.output').empty();
    if(this.id === "next-page"){
      bike.pageNumber += 1;
      bike.findStolenBikes();
    } else {
      if(bike.pageNumber > 1){
        bike.pageNumber -= 1;
        bike.findStolenBikes();
      }
    }

  });

});

var Database = require('../js/database.js').databaseModule;

$(document).ready(function() {
  var db = new Database();
  var stateList = "";

  for (var key in db.states) {
    stateList += '<option value="' + key + '">' + key+ "</option>";
  }
  $('#state-list').html(stateList);


  $('#state-select').submit(function(event){
    event.preventDefault();
    var stateInfo = db.findByState($('#state-list').val());
    stateInfo.forEach(function(zipCode){
      for(var key in zipCode) {
        $('#results').append('<p>' + key + ': ' + zipCode[key] + '</p>')
      }
    });
  });

});
